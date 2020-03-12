import React, { useState, useEffect } from "react";
import "./App.css";
import AddSightingForm from "./components/AddSightingForm";

function App() {
  const [sightings, setSightings] = useState([]);

  useEffect(() => {
    fetch("http://localhost:3000/sightings", {
      headers: {
        Accept: "application/json"
      },
      method: "GET"
    })
      .then(response => response.json())
      .then(json => {
        setSightings(json);
      });
  }, []);

  return (
    <div className="App">
      <h1>Animal Sighting Tracker</h1>
      <h2>Sightings</h2>
      <table>
        <tbody>
          {sightings.map(function(sighting) {
            return (
              <tr key={sighting.id}>
                <td>{sighting.id}</td>
                <td>{sighting.date_time}</td>
                <td>{sighting.ind_seen_id}</td>
                <td>{sighting.location}</td>
                <td>{sighting.email}</td>
                <td>{sighting.healthy}</td>
              </tr>
            );
          })}
        </tbody>
      </table>
      <AddSightingForm />
    </div>
  );
}

export default App;
