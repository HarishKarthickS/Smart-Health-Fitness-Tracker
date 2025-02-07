class Workout {
  final int id;
  final String type;
  final int duration;
  final DateTime date;

  Workout({
    required this.id,
    required this.type,
    required this.duration,
    required this.date,
  });

  // Convert a Workout into a Map.
  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'duration': duration,
        'date': date.toIso8601String(),
      };

  // Create a Workout from a Map.
  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
      id: json['id'],
      type: json['type'],
      duration: json['duration'],
      date: DateTime.parse(json['date']),
    );
  }
}
