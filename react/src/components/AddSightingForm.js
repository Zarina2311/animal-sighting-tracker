import React from "react";

function AddSightingForm() {
  function handleSubmit(event) {
    event.preventDefault();

    const newRecord = new URLSearchParams({
      date_time: event.target.date_time.value,
      ind_seen_id: event.target.ind_seen_id.value,
      location: event.target.location.value,
      email: event.target.email.value,
      healthy: event.target.healthy.checked,
    });

    fetch("http://localhost:3000/sightings", {
      headers: {
        Accept: "application/json",
      },
      body: newRecord,
      method: "POST",
    });
  }

  return (
    <form onSubmit={handleSubmit}>
      <h2>Add new sighting</h2>
      <label>Date and time:</label>
      <input type="text" name="date_time" />
      <br />
      <label>Individual seen:</label>
      <input type="text" name="ind_seen_id" />
      <br />
      <label>Location:</label>
      <input type="text" name="location" />
      <br />
      <label>Email of scientist:</label>
      <input type="text" name="email" />
      <br />
      <label>Individual healthy:</label>
      <input type="checkbox" name="healthy" />
      <br />
      <input type="submit" />
    </form>
  );
}

export default AddSightingForm;
