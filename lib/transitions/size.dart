part of '../simple_animated_dialog_lib.dart';

/// Creates a widget that transitions its size over time.
///
/// The size transition is applied using a [SizeTransition] widget, where the
/// size changes based on an [Animation] and a [Curve]. The widget is also
/// aligned using an [Align] widget to control its positioning within the
/// available space.
///
/// - [curve]: The animation curve that defines how the animation progresses.
/// - [animation]: The animation controlling the size factor of the transition.
/// - [child]: The widget to be animated.
/// - [alignment]: The alignment of the widget within the available space.
/// - [axis]: (Optional) The axis along which the size transition should happen.
///           If not provided, defaults to the vertical axis.
///
/// Returns:
/// A widget that animates its size along the specified [axis] and is aligned
/// based on the [alignment].
Widget _sizeTransition(
    Curve curve, Animation<double> animation, Widget child, Alignment alignment,
    {Axis? axis}) {
  return Align(
    alignment: alignment,
    child: SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animation,
        curve: curve,
      ),
      axis: axis ?? Axis.vertical,
      child: child,
    ),
  );
}
