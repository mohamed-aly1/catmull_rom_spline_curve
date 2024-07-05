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

# Catmull-Rom Curve  
[![pub package](https://img.shields.io/pub/v/battery_plus.svg)](https://pub.dev/packages/battery_plus)
[![pub points](https://img.shields.io/pub/points/battery_plus?color=2E8B57&label=pub%20points)](https://pub.dev/packages/battery_plus/score)
[![catmull_rom_spline_curve](https://github.com/fluttercommunity/plus_plugins/actions/workflows/battery_plus.yaml/badge.svg)](https://github.com/mohamed-aly1/catmull_rom_spline_curve/commit/d3718ec46bb89350759b438cb3565b9c8e203b3c)


## Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :----: |
|   ✅    | ✅  |  ✅   | ✅  |  ✅   |   ✅   |


## Features
Now You can Draw Fitted Curves easily just using points Offsets.

## Screenshot

<img src="https://i.ibb.co/Mkc2N32/Simulator-Screenshot-i-Phone-12-2023-10-09-at-20-44-27.png" width="250" />



## Getting started

using CatmullCurve.drawCurve() Function that will return a CustomPaint waiting to be placed inside your **Constrained Sized** Widget
## Constraints

Required : 
-List of Offset "points of the curve",
-Color  "Curve color"
-double "Curve Stroke Width"
-PaintingStyle "Define Curve Style",

Optional : 
-bool drawPoints "If you want to draw the points of your curve, Set this to true" 
-double? pointsStrokeWidth "Specify the stroke width of your points, Default set to 2x Curve Stroke Width "
-Color pointcolor "Specify the points color, Default set to Red"

## Usage

 1 - Import the Package "import 'package:catmull_rom_spline_curve/catmull_rom_spline_curve.dart';"

 2- Inside your Constrained Sized Widget, Call the function CatmullCurve.drawCurve() With the corresponding parameters

 3- Voila!

```dart
 SizedBox(
          width: 200,
          height: 200,
          child: CatmullCurve.drawCurve(
            [
              Offset(0, 200),
              Offset(20, 50),
              Offset(30, 200),
            ],
            Colors.red,
            2,
            PaintingStyle.stroke,
            pointcolor: Colors.blue,
            drawPoints: true,
            pointsStrokeWidth: 8,
          ),
        ),
```

## Additional information
- [API Documentation](https://pub.dev/documentation/catmull_rom_spline_curve/latest/catmull_rom_spline_curve/catmull_rom_spline_curve-library.html)
