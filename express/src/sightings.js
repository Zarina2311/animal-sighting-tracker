const pgp = require("pg-promise")(/* options */);
const db = pgp("postgres://postgres@localhost:5432/animals");

class AnimalSighting {
  getAllSightings() {
    return db.any("SELECT * FROM sightings");
  }

  addSighting(date_time, ind_seen_id, location, email, healthy) {
    return db.one(
      "INSERT INTO sightings (date_time, ind_seen_id, location, email, healthy) VALUES ($1, $2, $3, $4, $5) RETURNING id",
      [date_time, ind_seen_id, location, email, healthy]
    );
  }
}

module.exports = { AnimalSighting };
