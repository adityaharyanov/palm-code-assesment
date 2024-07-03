import 'dart:async';

import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:palm_code_assessment/presentations/dependency.dart';
import 'package:palm_code_assessment/presentations/routes/route.dart';
import 'package:palm_code_assessment/utility/error_handler/error_handler.dart';

void main() {
  return runZonedGuarded(() async {
    ErrorHandler.init();

    runApp(MyApp());
  }, (Object error, StackTrace stackTrace) {
    ErrorHandler.initUnhandled(error: error, stackTrace: stackTrace);
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    prepareDependencies();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Book App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
      ),
      initialRoute: RouteName.home.path,
      getPages: AppRoute.pages,
    );
  }

  // // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       // This is the theme of your application.
  //       //
  //       // TRY THIS: Try running your application with "flutter run". You'll see
  //       // the application has a purple toolbar. Then, without quitting the app,
  //       // try changing the seedColor in the colorScheme below to Colors.green
  //       // and then invoke "hot reload" (save your changes or press the "hot
  //       // reload" button in a Flutter-supported IDE, or press "r" if you used
  //       // the command line to start the app).
  //       //
  //       // Notice that the counter didn't reset back to zero; the application
  //       // state is not lost during the reload. To reset the state, use hot
  //       // restart instead.
  //       //
  //       // This works for code too, not just values: Most code changes can be
  //       // tested with just a hot reload.
  //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //       useMaterial3: true,
  //     ),
  //     home: const MyHomePage(title: 'Flutter Demo Home Page'),
  //   );
  // }
}
