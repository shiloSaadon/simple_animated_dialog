part of '../simple_animated_dialog_lib.dart';

/// Creates a widget that scales its size over time.
///
/// The scale transition is applied using a [ScaleTransition] widget, where the
/// scale changes based on an [Animation] and a [Curve]. The widget is aligned
/// using the provided [alignment].
///
/// - [curve]: The animation curve that defines how the animation progresses.
/// - [animation]: The animation controlling the scale factor of the transition.
/// - [child]: The widget to be scaled during the transition.
/// - [alignment]: The alignment of the widget during the scaling animation.
///
/// The [curve] is applied to an interval between 0.00 and 0.50 to control
/// the scaling phase of the animation.
///
/// Returns:
/// A widget that animates its scale based on the specified [curve] and [animation].
ScaleTransition _scaleTransition(Curve curve, Animation<double> animation,
    Widget child, Alignment alignment) {
  return ScaleTransition(
    alignment: alignment,
    scale: CurvedAnimation(
      parent: animation,
      curve: Interval(0.00, 0.50, curve: curve),
    ),
    child: child,
  );
}
