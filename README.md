<div align="center">
  <h1>CUET Get Help</h1>  
</div>
 
<div align="center">
  <p>
    <img src="https://user-images.githubusercontent.com/38901581/213903262-5b4bffbe-1f37-4aa5-928b-d65b3bdb2c22.svg" align="center" alt="Logo" width="200px" height="auto" />
  </p>
  <p>
    A platform for students of <a href="https://www.cuet.ac.bd/">CUET</a> to express concern and recieve help
  </p>
</div>

<div>
  
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
  
</div>

# TDD (Test Driven Developemt)

Our goal is to develop the app using TDD (Test Driven Development) approach. We'll write unit tests that fails first and then write the code to make the test pass.

Flutter provides three types of tests:

- [Unit tests](https://docs.flutter.dev/cookbook/testing/unit)
- [Widget tests](https://docs.flutter.dev/cookbook/testing/widget)
- [Integration tests](https://docs.flutter.dev/cookbook/testing/integration)

We aim to achieve higher test coverage of Unit tests and Widget tests.

<div align="center">
  <p>
    <img src="https://files.koenig.kodeco.com/uploads/2020/04/testing-pyramid.001.jpeg" align="center" alt="tests" width="400px" height="auto" />
  </p>
  
</div>

<!-- ![flutter-tests](https://files.koenig.kodeco.com/uploads/2020/04/testing-pyramid.001.jpeg) -->

## Unit tests

Unit tests are handy for verifying the behavior of a single function, method, or class.

Unit tests will be written in `/test/unit` directory.

Every units will be treated as `sut` (system under test) and will be tested in a separate file.


<div align="center">
  <p>
    <img src="https://user-images.githubusercontent.com/38901581/215708724-3fd7033b-3afa-4875-888e-926b1883482a.png" align="center" alt="tests" width="500px" height="auto" />
  </p>
  
</div>

<!-- ![image](https://user-images.githubusercontent.com/38901581/215708724-3fd7033b-3afa-4875-888e-926b1883482a.png) -->


- [Mocktail - Mock library](https://pub.dev/packages/mocktail)

## Widget tests

Widget tests are useful for verifying the behavior of a widget or a screen. Our goal will be to ensure if an widget properly renders in the UI.

Widget tests will be written in `/test/widget` directory.

Every widget will be treated as `sut` (system under test) and will be tested in a separate file.

- [Mocktail - Mock library](https://pub.dev/packages/mocktail)

## Integration tests

Integration tests are useful for verifying that a group of widgets work together as expected.

Integration tests are more costly and complex than unit tests and widget tests, so we'll try write them only when necessary.

## Getting Started w/ development

- Clone the repository `git clone git@github.com:RobinHood3082/get_help.git`
- cd into the direcotry `cd get_help`
- Install dependencies `flutter pub get`
- Run the app `flutter run`

## Build

- Run `flutter build apk --release` to build the apk file

## UI data flow

<!-- ![Logo](https://user-images.githubusercontent.com/38901581/213903262-5b4bffbe-1f37-4aa5-928b-d65b3bdb2c22.svg) -->

![get-help-flow](https://user-images.githubusercontent.com/38901581/213904348-754cbb4b-3a54-4d87-99e8-2baa8bc7ea4a.svg)
