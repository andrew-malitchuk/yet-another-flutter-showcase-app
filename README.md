# yet-another-flutter-showcase-app

## Overview

__YAFSA__ - Yet Another Flutter Showcase App - simple PoC app for learning Flutter.

This project is an educational Flutter application.
Its main goal is to comprehensively apply the knowledge gained while learning Flutter.
The app serves as a client for the [Gutendex API](https://gutendex.com/), which provides access to a
collection of books from Project Gutenberg.

## Tech stack

External libraries used in this project:

- [Bloc](https://pub.dev/packages/flutter_bloc);
- [go_router](https://pub.dev/packages/go_router);
- [dio](https://pub.dev/packages/dio);
- [Hive](https://pub.dev/packages/hive);
- [SharedPreferences](https://pub.dev/packages/shared_preferences);
- [Get_It](https://pub.dev/packages/get_it);

Architecture:

- [Clean Architecture](https://en.wikipedia.org/wiki/Clean_architecture);
- [Bloc](https://pub.dev/packages/flutter_bloc) for state management;
- DI;
- Domain layer & usecases;

## Features

Following features are implemented in the app:

- Onboarding;
- Main screen:
  - home page with recently viewed books & recommended books;
  - catalog page with a list of books, filter & search;
  - library page;
  - menu:
    - theme chooser;
    - language chooser;
    - about;
- Book details page.

