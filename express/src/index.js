const express = require("express");
const bodyParser = require("body-parser");
const { AnimalSighting } = require("./sightings");

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Methods", "GET,POST");
  next();
});

const port = 3000;

const animalTracker = new AnimalSighting();

app.get("/sightings", (req, res) => {
  animalTracker.getAllSightings().then(sightings => {
    res.status(200).send(sightings);
  });
});

app.post("/sightings", (req, res) => {
  const date_time = req.body.date_time;
  const ind_seen_id = req.body.ind_seen_id;
  const location = req.body.location;
  const email = req.body.email;
  const healthy = req.body.healthy;

  animalTracker
    .addSighting(date_time, ind_seen_id, location, email, healthy)
    .then(() => {
      res.status(200).send("Record added successfully");
    });
});

app.get("/", (req, res) =>
  res.status(200).send("Hello People! Welcome to my Animal Sighting Project!")
);

app.listen(port, () => console.log(`Example app listening on port ${port}!`));
