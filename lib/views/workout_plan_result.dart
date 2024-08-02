import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/app_strings.dart';
import '../core/utils/app_colors.dart';
import '../viewmodels/workout_plan_viewmodel.dart';
import '../widgets/normal_button.dart';
import 'home_page_workout.dart';
import 'saved_requests_page_workout.dart';

class WorkoutPlanResult extends StatelessWidget {
  final WorkoutPlanViewModel workoutPlanViewModel = Get.find();

  WorkoutPlanResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  // color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColor.primaryColor1,
                size: 30,
              )),
        ),
        title: Text(
          "Workout Plan Result",
          style: TextStyle(
            color: AppColor.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: AppStrings.fontFamilyPoppins,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const HomePageWorkout();
              }));
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  // color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(
                Icons.home,
                color: AppColor.primaryColor1,
                size: 30,
              ),
            ),
          )
        ],
      ),
      backgroundColor: AppColor.backgroundColor,
      body: Obx(() {
        if (workoutPlanViewModel.workoutPlan.value == null) {
          return const Center(
            child: Text(
              'No workout plan generated',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontFamily: AppStrings.fontFamilyHind,
              ),
            ),
          );
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  workoutPlanViewModel.workoutPlan.value!.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor1,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  workoutPlanViewModel.workoutPlan.value!.subtitle,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryColor4,
                    fontFamily: AppStrings.fontFamilyHind,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  workoutPlanViewModel.workoutPlan.value!.description,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColor.black,
                    fontFamily: AppStrings.fontFamilyHind,
                  ),
                ),
                const SizedBox(height: 20),
                NormalButton(
                    textColor: AppColor.primaryColor1,
                    text: 'Save',
                    onPressed: workoutPlanViewModel.saveWorkoutPlan,
                    backgroundColor: AppColor.white,
                    widthSize: 300,
                    heightSize: 60,
                    borderColor: AppColor.primaryColor1,
                    fontSize: 22),
                const SizedBox(height: 20),
                NormalButton(
                    textColor: AppColor.primaryColor1,
                    text: 'Saved Requests',
                    onPressed: () {
                      // Navigate to saved requests page
                      Get.to(SavedRequestsWorkoutPage());
                    },
                    backgroundColor: AppColor.white,
                    widthSize: 300,
                    heightSize: 60,
                    borderColor: AppColor.primaryColor1,
                    fontSize: 22),
              ],
            ),
          ),
        );
      }),
    );
  }
}
