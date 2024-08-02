import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../core/utils/app_colors.dart';
import '../models/workout_plan_model.dart';

class WorkoutPlanViewModel extends GetxController {
  var isLoading = false.obs;
  var workoutPlan = Rxn<WorkoutPlan>();
  var errorMessage = ''.obs;

  final model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey:
        'AIzaSyDxztOMxboYXtsL5mX7lWyvLGKfkUwoRJ0', // Access your API key securely
  ); 

  final workoutPlanStorage = GetStorage();

  Future<void> generateWorkoutPlan(Map<String, String> inputs) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final content = [Content.text(inputs.toString())];
      final response = await model.generateContent(content);
      workoutPlan.value = WorkoutPlan.fromApiResponse(response.text!);
    } catch (e) {
      errorMessage.value = 'Failed to generate workout plan';
    } finally {
      isLoading.value = false;
    }
  }

  void saveWorkoutPlan() {
    if (workoutPlan.value != null) {
      final plans = workoutPlanStorage.read<List>('workoutPlans') ?? [];
      plans.add({
        'title': workoutPlan.value!.title,
        'subtitle': workoutPlan.value!.subtitle,
        'description': workoutPlan.value!.description,
      });
      workoutPlanStorage.write('workoutPlans', plans);
      Get.snackbar(
        'Success',
        'Workout plan saved successfully!',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        backgroundColor: AppColor.primaryColor1,
        colorText: AppColor.white,
        borderRadius: 10,
        margin: const EdgeInsets.all(10),
        isDismissible: true,
        shouldIconPulse: true,
        dismissDirection: DismissDirection.horizontal,
        icon: Icon(
          Icons.check,
          color: AppColor.white,
        ),
      );
    }
  }

  void deleteWorkoutPlan(int index) {
    final plans = workoutPlanStorage.read<List>('workoutPlans') ?? [];
    if (plans.isNotEmpty && index >= 0 && index < plans.length) {
      plans.removeAt(index);
      workoutPlanStorage.write('workoutPlans', plans);
      Get.snackbar(
        'Success',
        'Workout plan deleted successfully!',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        backgroundColor: AppColor.primaryColor1,
        colorText: AppColor.white,
        borderRadius: 10,
        margin: const EdgeInsets.all(10),
        isDismissible: true,
        shouldIconPulse: true,
        dismissDirection: DismissDirection.horizontal,
        icon: Icon(
          Icons.check,
          color: AppColor.white,
        ),
      );
    }
  }

  List<WorkoutPlan> getSavedWorkoutPlans() {
    final plans = workoutPlanStorage.read<List>('workoutPlans') ?? [];
    return plans
        .map((plan) => WorkoutPlan(
              title: plan['title'],
              subtitle: plan['subtitle'],
              description: plan['description'],
            ))
        .toList();
  }
}
