import "dart:developer";
import "dart:isolate";

import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/src/widgets/framework.dart";
import "package:get/get.dart";

const String kGenericExceptionMessage = "Oh no! Something went wrong.";

// Regex
final RegExp kBracketsContentRegex = RegExp(r"\[.*?\]");

//==========================================================

class ErrorHandler {
  static bool ignoreFlutterError = false;
  ErrorHandler._();

  static void init() {
    FlutterError.onError = (FlutterErrorDetails details) async {
      FlutterError.presentError(details);
      reportErrorDetails(details);
    };
  }

  static void initUnhandled(
      {required Object error, required StackTrace stackTrace}) {
    if (kDebugMode) {
      debugPrint("Unhandled Error: $error StackTrace: $stackTrace");
    }
    reportErrorToUI(error, stackTrace);
  }
}

void reportErrorDetails(FlutterErrorDetails flutterErrorDetails) {
  const List<String> errors = <String>["rendering library", "widgets library"];

  final bool isSilentOnRelease = kReleaseMode && flutterErrorDetails.silent;
  final bool isLibraryOnDebug =
      !kReleaseMode && errors.contains(flutterErrorDetails.library);
  if (isSilentOnRelease || isLibraryOnDebug) {
    log(
      flutterErrorDetails.exceptionAsString(),
      name: "ReportErrorDetails",
      stackTrace: flutterErrorDetails.stack,
      error: flutterErrorDetails.exception,
    );
  }

  return reportErrorToUI(
      flutterErrorDetails.exception, flutterErrorDetails.stack);
}

void reportErrorToUI(Object error, StackTrace? stackTrace) {
  String message = "An error occurred. Please try again later.";
  if (error is Exception) {
    message = error.toString();
  }

  if (error is Error) {
    message = error.toString();
  }

  showErrorMessage(message);
}

void showErrorMessage(String message) {
  Get.closeAllSnackbars();
  Get.snackbar("Error ", message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM);
}
