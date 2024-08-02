import 'package:calorie_estimates/views/home_page_workout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';
import '../viewmodels/workout_plan_viewmodel.dart';
import '../widgets/normal_button.dart';

class SavedRequestsWorkoutPage extends StatelessWidget {
  final WorkoutPlanViewModel viewModelWorkout = Get.find();

  SavedRequestsWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final savedPlans = viewModelWorkout.getSavedWorkoutPlans();

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
            )
          ),
        ),
        title: Text(
          "Saved Requests",
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
                size: 30,)
            ),
          )
        ],
      ),
      backgroundColor: AppColor.backgroundColor,
      body: ListView.builder(
        itemCount: savedPlans.length,
        itemBuilder: (context, index) {
          final plan = savedPlans[index];
          return ListTile(
            title: Text(
              plan.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: AppStrings.fontFamilyHind,
                color: AppColor.primaryColor4,
              ),
            ),
            subtitle: Text(
              plan.subtitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: AppStrings.fontFamilyHind,
                color: AppColor.primaryColor1,
              ),
            ),
            trailing: IconButton(
              // tooltip: 'Delete',
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 30,
              ),
              onPressed: () {
                viewModelWorkout.deleteWorkoutPlan(index);

                // Refresh the list of saved plans after deleting a plan at the same time

                Get.off(SavedRequestsWorkoutPage());
                Get.forceAppUpdate();
              },
            ),
            onTap: () {
              // Display full plan details
              Get.dialog(
                AlertDialog(
                  backgroundColor: AppColor.backgroundColor,
                  title: Text(
                    plan.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppStrings.fontFamilyHind,
                      color: AppColor.primaryColor4,
                    ),
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          plan.subtitle,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppStrings.fontFamilyHind,
                            color: AppColor.primaryColor1,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          plan.description,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColor.black,
                            fontFamily: AppStrings.fontFamilyHind,
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    NormalButton(
                        textColor: AppColor.primaryColor1,
                        text: 'Close',
                        onPressed: () => Get.back(),
                        backgroundColor: AppColor.white,
                        widthSize: 60,
                        heightSize: 20,
                        borderColor: AppColor.primaryColor1,
                        fontSize: 18),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
