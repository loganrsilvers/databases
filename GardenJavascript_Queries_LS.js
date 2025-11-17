use('Garden');

// Try exact slug first, then fall back to flexible regex-based searches across slug/name/title
const slug = 'wheel-barrow-9092';
let product = db.getCollection('products').findOne({ slug: slug });

if (!product) {
  // convert separators in slug (hyphens, spaces, punctuation) into a flexible regex pattern
  const pattern = slug.replace(/[^a-zA-Z0-9]+/g, '.*');
  const regex = new RegExp('^' + pattern + '$', 'i');
  product = db.getCollection('products').findOne({ slug: { $regex: regex } });
}

if (!product) {
  // broader fallback: match parts in slug anywhere in slug/name/title
  const looseRegex = /wheel.*barrow.*9092/i;
  product = db.getCollection('products').findOne({
    $or: [
      { slug: { $regex: looseRegex } },
      { name: { $regex: looseRegex } },
      { title: { $regex: looseRegex } }
    ]
  });
}

if (!product) {
  throw new Error("Product not found: " + slug);
}

const reviews_count = db.getCollection('reviews').countDocuments({ product_id: product._id });
reviews_count;

db.reviews.aggregate([
  {
    $group: {
      _id: '$product_id',
      countDocuments: { $sum: 1 }
    }
  }
]);

db.reviews.aggregate([
  { $match: { product_id: product._id } },
  {
    $group: {
      _id: '$product_id',
      countDocuments: { $sum: 1 }
    }
  }
]).next();

// Get the counts for each category and lookup the category name
db.products.aggregate([
  { $unwind: '$category_ids' },
  { $group: { _id: '$category_ids', count: { $sum: 1 } } },
  {
    $lookup: { 
        from: 'categories',
        localField: '_id',
        foreignField: '_id',
        as: 'category'
    }
  },
    { $unwind: '$category' },
    { $project: { _id: 1, count: 1, category_name: '$category.name' } }
]);

db.reviews.aggregate([
  {
    $lookup: {
      from: "products",
      localField: "product_id",
      foreignField: "_id",
      as: "product"
    }
  },
  { $unwind: "$product" },
  { $unwind: "$product.category_ids" },
  {
    $group: {
      _id: "$product.category_ids",
      reviewCount: { $sum: 1 }
    }
  },
  {
    $lookup: {
      from: "categories",
      localField: "_id",
      foreignField: "_id",
      as: "category"
    }
  },
  { $unwind: "$category" },
  { $project: { _id: 0, categoryId: "$_id", categoryName: "$category.name", reviewCount: 1 } }
]);

// Display the Count by Category ID using the $out 
db.reviews.aggregate([
  {
    $lookup: {
      from: "products",
      localField: "product_id",
      foreignField: "_id",
      as: "product"
    }
  },
  { $unwind: "$product" },
  { $unwind: "$product.category_ids" },
  {
    $group: {
      _id: "$product.category_ids",
      reviewCount: { $sum: 1 }
    }
  },
  {
    $out: "category_review_counts"
  }
]);

// Unwind the category ids, get the count of each category id, and send to the output

db.products.aggregate([
  { $unwind: "$category_ids" },
  {
    $group: {
      _id: "$category_ids",
      productCount: { $sum: 1 }
    }
  },
  { $out: "category_counts" }
]);

// Get purchases after 1/1/2010 and aggregate the counts by year, month, and week

db.purchases.aggregate([
  {
    $match: {
      purchase_date: { $gte: new Date("2010-01-01") }
    }
  },
  {
    $group: {
      _id: {
        year: { $year: "$purchase_date" },
        month: { $month: "$purchase_date" },
        week: { $isoWeek: "$purchase_date" }
      },
      purchaseCount: { $sum: 1 }
    }
  },
  { $sort: { "_id.year": 1, "_id.month": 1, "_id.week": 1 } }
]);
