import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/workout.dart';

class ApiService {
  // Change this URL to your backend server URL.
  static const String baseUrl = 'http://localhost:3000';

  static Future<List<Workout>> getWorkouts() async {
    final response = await http.get(Uri.parse('$baseUrl/workouts'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Workout.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load workouts');
    }
  }

  static Future<Workout> addWorkout(Workout workout) async {
    final response = await http.post(
      Uri.parse('$baseUrl/workouts'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(workout.toJson()),
    );
    if (response.statusCode == 201) {
      return Workout.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add workout');
    }
  }
}
