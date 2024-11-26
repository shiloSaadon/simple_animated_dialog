<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# simple_animated_dialog

A simple and customizable package for creating animated dialogs in Flutter. It supports a variety of dialog transition animations such as sliding, fading, scaling, and more, making it easy to add polished dialog transitions to your Flutter app.

## Features

- Multiple dialog transition types:
  - Fade
  - Slide from top, bottom, left, right
  - Fade with slide from any direction
  - Scale and fade-scale
  - Size and size-fade
  - No animation
- Customizable animation duration, alignment, and curves
- Built on top of Flutter's `showGeneralDialog`, offering full-screen modal dialogs
- Safe area handling to avoid UI clipping

## Available Transition Types

- `fade`
- `slideFromTop`, `slideFromBottom`, `slideFromLeft`, `slideFromRight`
- `slideFromTopFade`, `slideFromBottomFade`, `slideFromLeftFade`, `slideFromRightFade`
- `scale`
- `fadeScale`
- `size`, `sizeFade`
- `none` (No animation)

## Installation

Add `simple_animated_dialog` to your `pubspec.yaml` file:

```yaml
dependencies:
  simple_animated_dialog: <version_number>
```

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:simple_animated_dialog/simple_animated_dialog_lib.dart';

void showMyCustomDialog(BuildContext context) {
  showAnimatedDialog<dynamic>(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) => GestureDetector(
      onTap: () {},
      child: Dialog(
        shadowColor: Colors.grey,
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(dialogRadius))),
        child: child,
      ),
    ),
    animationType: DialogTransitionType.fade,
    curve: Curves.linear,
    duration: const Duration(milliseconds: 200),
  );
}
```

## Additional information

In progress
