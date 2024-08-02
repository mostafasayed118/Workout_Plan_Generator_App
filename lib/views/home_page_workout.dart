import 'package:calorie_estimates/widgets/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';
import 'saved_requests_page_workout.dart';
import 'workout_plan_form.dart';

class HomePageWorkout extends StatelessWidget {
  const HomePageWorkout({super.key});

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
          "Workout Plan Generator",
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
                return SavedRequestsWorkoutPage();
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
                  Icons.add,
                  color: AppColor.primaryColor1,
                  size: 30,
                )),
          )
        ],
      ),
      backgroundColor: AppColor.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NormalButton(
                textColor: AppColor.primaryColor1,
                text: 'Generate Workout Plan',
                onPressed: () => Get.to(WorkoutPlanForm()),
                backgroundColor: AppColor.white,
                widthSize: 300,
                heightSize: 60,
                borderColor: AppColor.primaryColor1,
                fontSize: 22),
            const SizedBox(height: 20),
            NormalButton(
                textColor: AppColor.primaryColor1,
                text: 'Saved Requests',
                onPressed: () => Get.to(SavedRequestsWorkoutPage()),
                backgroundColor: AppColor.white,
                widthSize: 300,
                heightSize: 60,
                borderColor: AppColor.primaryColor1,
                fontSize: 22),
          ],
        ),
      ),
    );
  }
}
