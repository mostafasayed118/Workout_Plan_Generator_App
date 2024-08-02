import 'dart:async';

import 'package:calorie_estimates/views/home_page_workout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import 'core/utils/app_strings.dart';

Future<void> main() async {
  // Widgets Binding

  // Add local storage
  await GetStorage.init();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => const GetMaterialApp(
        // initialBinding: GeneralBindings(),
        title: AppStrings.nutrifix,
        // title:  "Workout Plan Generator",

        home: HomePageWorkout(),
      ),
    );
  }
}




//! how to get api key done
//! how to make prompt
//! ho to handel project
