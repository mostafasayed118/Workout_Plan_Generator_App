import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';
import '../core/utils/app_assets.dart';
import '../viewmodels/workout_plan_viewmodel.dart';
import '../widgets/custom_input_field_workout.dart';
import '../widgets/normal_button.dart';
import 'workout_plan_result.dart';

class WorkoutPlanForm extends StatelessWidget {
  WorkoutPlanForm({super.key});
  final WorkoutPlanViewModel workoutPlanViewModel =
      Get.put(WorkoutPlanViewModel());

  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {
    'Age': TextEditingController(),
    'Height': TextEditingController(),
    'Weight': TextEditingController(),
    'Goal': TextEditingController(),
    'Fitness Level': TextEditingController(),
    'Days': TextEditingController(),
    'Hours': TextEditingController(),
    'Health Condition': TextEditingController(),
    'Routine': TextEditingController(),
  };
  final Map<String, String> _iconMapping = {
    'Age': AppAssets.iconCalendarWeek,
    'Height': AppAssets.heightIcon,
    'Weight': AppAssets.weightIcon,
    'Goal': AppAssets.iconActivity,
    'Fitness Level': AppAssets.iconLevel,
    'Days': AppAssets.iconCalendarWeek,
    'Hours': AppAssets.iconHours,
    'Health Condition': AppAssets.iconMedicalInsurance,
    'Routine': AppAssets.iconRepeat,
  };
  final Map<String, TextInputType> keyboardTypes = {
    'Age': TextInputType.number,
    'Height': TextInputType.number,
    'Weight': TextInputType.number,
    'Goal': TextInputType.text,
    'Fitness Level': TextInputType.text,
    'Days': TextInputType.number,
    'Hours': TextInputType.number,
    'Health Condition': TextInputType.text,
    'Routine': TextInputType.text,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
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
              Icons.arrow_back,
              color: AppColor.primaryColor1,
              size: 30,
            )
          ),
        ),
        title: Text(
          "Workout Plan Form",
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
                return WorkoutPlanResult();
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
                Icons.check,
                color: AppColor.primaryColor1,
                size: 30,
              )
            ),
          )
        ],
      ),
      body: Obx(() {
        if (workoutPlanViewModel.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColor.primaryColor1),
              backgroundColor: AppColor.backgroundColor,
              strokeWidth: 5,
              semanticsLabel: 'Loading',
              semanticsValue: 'Loading',
              value: null,
              color: AppColor.primaryColor1,
            ),
          );
        }
        return Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ..._controllers.entries.map((entry) {
                  return CustomInputFieldWorkout(
                    label: entry.key,
                    controller: entry.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter ${entry.key}';
                      }
                      return null;
                    },
                    iconPath: _iconMapping[entry.key] ?? '',
                    keyboardType:
                        keyboardTypes[entry.key] ?? TextInputType.text,
                  );
                }),
                const SizedBox(height: 20),
                NormalButton(
                    textColor: AppColor.primaryColor1,
                    text: 'Generate Workout Plan',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final inputs = _controllers
                            .map((key, value) => MapEntry(key, value.text));
                        await workoutPlanViewModel.generateWorkoutPlan(inputs);
                        if (workoutPlanViewModel.errorMessage.value.isEmpty) {
                          Get.to(WorkoutPlanResult());
                        } else {
                          Get.snackbar(
                            'Error',
                            workoutPlanViewModel.errorMessage.value,
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppColor.red,
                            colorText: AppColor.white,
                            duration: const Duration(seconds: 4),
                            isDismissible: true,
                            shouldIconPulse: true,
                            borderRadius: 15,
                            dismissDirection: DismissDirection.horizontal,
                            margin: const EdgeInsets.all(20),
                            animationDuration: const Duration(seconds: 1),
                            forwardAnimationCurve: Curves.easeOutBack,
                            icon: Icon(
                              Icons.error,
                              color: AppColor.white,
                              size: 30,
                            ),
                          );
                        }
                      }
                    },
                    backgroundColor: AppColor.white,
                    widthSize: 300,
                    heightSize: 60,
                    borderColor: AppColor.primaryColor1,
                    fontSize: 22),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      }),
    );
  }
}
