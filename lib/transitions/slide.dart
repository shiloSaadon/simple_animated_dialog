part of '../simple_animated_dialog_lib.dart';

/// Creates a widget that transitions its position over time by sliding from
/// one offset to another.
///
/// The slide transition is applied using a [SlideTransition] widget, where the
/// widget moves from a starting [begin] offset to an ending [end] offset based on
/// an [Animation] and a [Curve].
///
/// - [curve]: The animation curve that defines how the transition progresses.
/// - [animation]: The animation controlling the sliding effect.
/// - [child]: The widget to be animated during the slide transition.
/// - [begin]: (Optional) The starting offset of the slide. Defaults to
///            `Offset(1.0, 0.0)` (which slides in from the right).
/// - [end]: (Optional) The ending offset of the slide. Defaults to `Offset.zero`
///          (which positions the widget at its final location).
/// - [transformHitTests]: (Optional) Whether to consider hit tests at the
///                        transformed position. Defaults to `false`.
///
/// The sliding animation is controlled by a [Tween] that interpolates between
/// the [begin] and [end] offsets and is chained with a [CurveTween] to apply
/// the [curve].
///
/// Returns:
/// A widget that animates its position from [begin] to [end] over time,
/// using the specified [curve] and [animation].
SlideTransition _slideTransition(
  Curve curve,
  Animation<double> animation,
  Widget child, {
  Offset begin = const Offset(1.0, 0.0),
  Offset end = Offset.zero,
  bool transformHitTests = false,
}) {
  return SlideTransition(
    transformHitTests: transformHitTests,
    position: Tween<Offset>(
      begin: begin,
      end: end,
    ).chain(CurveTween(curve: curve)).animate(animation),
    child: child,
  );
}
