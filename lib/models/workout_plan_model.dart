class WorkoutPlan {
  final String title;
  final String subtitle;
  final String description;

  WorkoutPlan(
      {required this.title, required this.subtitle, required this.description});

  // Factory method to create a WorkoutPlan from API response
  factory WorkoutPlan.fromApiResponse(String response) {
    // Clean up the response text
    final cleanedText = response.replaceAll(RegExp(r'[\*\#]'), '');
    // Logic to parse the cleanedText and create a WorkoutPlan object
    return WorkoutPlan(
      title: 'Generated Workout Plan',
      subtitle: 'Based on your input',
      description: cleanedText,
    );
  }
}
