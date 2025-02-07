import 'package:flutter/material.dart';
import '../models/workout.dart';
import '../services/api_service.dart';

class WorkoutLogScreen extends StatefulWidget {
  @override
  _WorkoutLogScreenState createState() => _WorkoutLogScreenState();
}

class _WorkoutLogScreenState extends State<WorkoutLogScreen> {
  List<Workout> _workouts = [];
  final _formKey = GlobalKey<FormState>();
  String _workoutType = '';
  int _duration = 0;

  @override
  void initState() {
    super.initState();
    _fetchWorkouts();
  }

  Future<void> _fetchWorkouts() async {
    try {
      List<Workout> workouts = await ApiService.getWorkouts();
      setState(() {
        _workouts = workouts;
      });
    } catch (e) {
      // Handle error appropriately in production apps.
      print('Error fetching workouts: $e');
    }
  }

  Future<void> _addWorkout() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Workout newWorkout = Workout(
        id: 0, // The backend will assign the actual ID.
        type: _workoutType,
        duration: _duration,
        date: DateTime.now(),
      );
      try {
        Workout createdWorkout = await ApiService.addWorkout(newWorkout);
        setState(() {
          _workouts.add(createdWorkout);
        });
        // Clear form
        _formKey.currentState!.reset();
      } catch (e) {
        print('Error adding workout: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Log a New Workout',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Workout Type'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a workout type';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _workoutType = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Duration (minutes)'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter duration';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _duration = int.parse(value!);
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _addWorkout,
                    child: Text('Add Workout'),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Workout Log',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          _workouts.isEmpty
              ? Text('No workouts logged yet.')
              : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _workouts.length,
                  itemBuilder: (context, index) {
                    final workout = _workouts[index];
                    return ListTile(
                      title: Text(workout.type),
                      subtitle: Text(
                          'Duration: ${workout.duration} mins\nDate: ${workout.date.toLocal().toString().split('.')[0]}'),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
