# palm-code-assesment

## Getting Started

1. run `flutter pub get` on terminal to download all the dependencies
2. you can run the app on any devices you preferred (ios/android)
3. to run unit test it requires to run build_runner `dart run build_runner build`

## App Architecture

This project is mainly using MVVM + Clean Architecture Pattern

### MVVM

This project use GetX as the state management also as the main helper for MVVM binding using it's RxType & Obx widget to bind properties and widget
Layered by file
`presentation/*_page.dart` -> View
`presentation/*_controller.dart` -> Viewmodel
`domains/models/*.dart` -> model

### Repository Pattern

Repository exist as data layer of the project, it responsible to provide and process data to presentation layer so presentation layer doesn't need to know implementation detail of the data.
Repository also as bridge for multi DataProvider communitation for example API Data & Local Data.

- API Data Provider responsible to provide and process data from certain Remote API, in here I use DIO as main dependency for all API communication
- Local Data Provider responsible to provide and process data from storage in local device, in here I use SHared Preference as main dependecny for all Local Storage. Shared Preference provides simplicity on usage so it really helps for this small project size compare to using Database

## Items not completed

1. Unit Test = time not enough to prepare all test cases
