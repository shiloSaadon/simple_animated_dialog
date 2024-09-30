part of 'simple_animated_dialog_lib.dart';

/// Display the dialog content using the animation
Future<T?> showAnimatedDialog<T extends Object?>({
  /// Duration for the animation to play
  required Duration duration,

  /// Used by flutter to display the dialog
  required BuildContext context,

  /// The dialog content widget
  required WidgetBuilder builder,

  /// Whether click on the barrier (Outside of the dialog) pop the dialog or not
  /// default set to false
  bool barrierDismissible = false,

  /// [DialogTransitionType] for the animation
  animationType = DialogTransitionType.size,

  /// The animation curve
  Curve curve = Curves.linear,

  /// Scale and Size animations need to get the alignment where to start from
  Alignment alignment = Alignment.center,

  /// Color for the outside of the dialog
  Color? barrierColor,

  /// [DialogTransitionType.size] required this in orger to set how to size change will accure
  Axis? axis = Axis.horizontal,
}) {
  return showGeneralDialog(
    barrierDismissible: barrierDismissible,
    context: context,
    pageBuilder: (context, animation, secAnimation) =>
        _pageBuilder(context, animation, secAnimation, builder),
    barrierColor: barrierColor ?? Colors.black.withOpacity(0.4),
    barrierLabel: '',
    transitionDuration: duration,
    transitionBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      switch (animationType) {
        case DialogTransitionType.fade:
          return FadeTransition(opacity: animation, child: child);
        case DialogTransitionType.slideFromRight:
          return _slideTransition(curve, animation, child);
        case DialogTransitionType.slideFromLeft:
          return _slideTransition(curve, animation, child,
              begin: const Offset(-1.0, 0.0));
        case DialogTransitionType.slideFromRightFade:
          return _slideTransition(curve, animation,
              FadeTransition(opacity: animation, child: child),
              transformHitTests: true);
        case DialogTransitionType.slideFromLeftFade:
          return _slideTransition(curve, animation,
              FadeTransition(opacity: animation, child: child),
              transformHitTests: true, begin: const Offset(-1.0, 0.0));
        case DialogTransitionType.slideFromTop:
          return _slideTransition(curve, animation, child,
              begin: const Offset(0.0, -1.0));
        case DialogTransitionType.slideFromTopFade:
          return _slideTransition(curve, animation,
              FadeTransition(opacity: animation, child: child),
              transformHitTests: true, begin: const Offset(0.0, -1.0));
        case DialogTransitionType.slideFromBottom:
          return _slideTransition(curve, animation, child,
              begin: const Offset(0.0, 1.0));
        case DialogTransitionType.slideFromBottomFade:
          return _slideTransition(curve, animation,
              FadeTransition(opacity: animation, child: child),
              transformHitTests: true, begin: const Offset(0.0, 1.0));
        case DialogTransitionType.scale:
          return _scaleTransition(curve, animation, child, alignment);
        case DialogTransitionType.fadeScale:
          return _scaleTransition(
              curve,
              animation,
              FadeTransition(
                  opacity: CurvedAnimation(parent: animation, curve: curve),
                  child: child),
              alignment);
        case DialogTransitionType.size:
          return _sizeTransition(curve, animation, child, alignment,
              axis: axis);
        case DialogTransitionType.sizeFade:
          return _sizeTransition(
              curve,
              animation,
              FadeTransition(
                  opacity: CurvedAnimation(parent: animation, curve: curve),
                  child: child),
              alignment);
        case DialogTransitionType.none:
          return child;
        default:
          return FadeTransition(opacity: animation, child: child);
      }
    },
  );
}
