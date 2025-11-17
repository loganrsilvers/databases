
// Select the database to use.
use('sample_mflix');

// Find the Movies that have more than 
// 10 awards, displaying the title and the number of award wins, 
// sorted by award wins in descending order.
db.movies.find(
    { "awards.wins": { $gt: 10 } },
    { title: 1, "awards.wins": 1, _id: 0 }
).sort({ "awards.wins": -1 })

//Find the movies directed by David Fincher with at least 
// one award nomination displaying the title, the directors, 
// the award nominations, and award wins, sorted by nominations 
// in ascending order.
db.movies.find(
    { 
        directors: "David Fincher",
        "awards.nominations": { $gte: 1 }
    },
    { title: 1, directors: 1, "awards.nominations": 1, "awards.wins": 1, _id: 0 }
).sort({ "awards.nominations": 1 })

// Find the movies directed by David Fincher with at least one 
// award nomination that also won at least one award, 
// displaying the title, the directors, the award nominations, 
// and award wins, sorted by wins in descending order.
db.movies.find(
    { 
        directors: "David Fincher",
        "awards.nominations": { $gte: 1 },
        "awards.wins": { $gte: 1 }
    },
    { title: 1, directors: 1, "awards.nominations": 1, "awards.wins": 1, _id: 0 }
).sort({ "awards.wins": -1 })

// Find all the movies in the 'Sci-Fi', 'Drama', 'Animation' 
// genres with at least one award nomination that also won at 
// least one award, displaying the title, the genres, the award 
// nominations, and award wins sorted by wins in descending order.
db.movies.find(
    { 
        genres: { $in: ['Sci-Fi', 'Drama', 'Animation'] },
        "awards.nominations": { $gte: 1 },
        "awards.wins": { $gte: 1 }
    },
    { title: 1, genres: 1, "awards.nominations": 1, "awards.wins": 1, _id: 0 }
).sort({ "awards.wins": -1 })

// Find the movies that have awards.wins greater than the value of a variable 
// that the user can change.
var numwins = 120; // example
db.movies.find(
    // Your query will refer to this variable.
// Like above, display the title, the award nominations, 
// and award wins sorted by award.wins in descending order
    { "awards.wins": { $gt: numwins } },
    { title: 1, "awards.nominations": 1, "awards.wins": 1, _id: 0 }
).sort({ "awards.wins": -1 })

// Create a new document for a recent film 
// (unlikely to be in this sample database)
// Use the following fields: 
// plot,genres,cast,title,fullplot,released,directors
var newmovie = db.movies.insertOne({
    title: "Spiderman",
    plot: "Peter turns into spiderman",
    fullplot: "Peter turns into spiderman after being bitten by a radioactive spider.",
    genres: ["Action"],
    cast: ["Tom Holland", "Zendaya"],
    released: ISODate("2021-12-17"),
    directors: ["Jon Watts"],
});
// Save the return value of the "Insert" operation 
// which contains the objectid.
var number = newmovie.insertedId;
// Retrieve the new document using the _id that is 
// contained within the return value insertOne command.
db.movies.findOne({ _id: number })


// Updates on the document created in Step 6
db.movies.updateOne(
    { _id: number },
    // Update the runtime field to the value of 2.
    { $set: { runtime: 2 } }
);

// Update the imdb document 
// with a rating of 9.5, 
// votes equal to 2000000, 
// and an id of 4
db.movies.updateOne(
    { _id: number },
    { $set: { imdb: { 
        rating: 9.5, 
        votes: 2000000, 
        id: 4 } } }
);

// Delete the document created in 
// Step 6 and updated in step 7.
db.movies.deleteOne({ _id: number });