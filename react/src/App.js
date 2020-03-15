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
                <td>{new Date(sighting.date_time).toLocaleDateString()}</td>
                <td>
                  <a href={sighting.link}>{sighting.ind_seen_id}</a>
                </td>
                <td>{sighting.location}</td>
                <td>{sighting.email}</td>
                <td>{sighting.healthy}</td>
                <td>
                  <img src={sighting.photo} width="100" />
                </td>
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
