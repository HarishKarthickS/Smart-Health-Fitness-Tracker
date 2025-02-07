const express = require('express');
const app = express();
const port = 3000;

app.use(express.json());

// Enable CORS for development purposes.
app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*"); 
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

let workouts = [];

// GET all workouts
app.get('/workouts', (req, res) => {
  res.json(workouts);
});

// POST a new workout
app.post('/workouts', (req, res) => {
  const { type, duration, date } = req.body;
  const newWorkout = {
    id: workouts.length + 1,
    type,
    duration,
    date: date || new Date().toISOString()
  };
  workouts.push(newWorkout);
  res.status(201).json(newWorkout);
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
