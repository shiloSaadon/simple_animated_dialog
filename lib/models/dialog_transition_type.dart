part of '../simple_animated_dialog_lib.dart';

/// This enum hold all the supported types on animations
/// applaying by [DialogTransitionType.ANIMATION]
enum DialogTransitionType {
  /// Fade animation
  fade,

  /// Slide from top animation
  slideFromTop,

  /// Slide from top fade animation
  slideFromTopFade,

  /// Slide from bottom animation
  slideFromBottom,

  /// Slide from bottom fade animation
  slideFromBottomFade,

  /// Slide from left animation
  slideFromLeft,

  /// Slide from left fade animation
  slideFromLeftFade,

  /// Slide from right animation
  slideFromRight,

  /// Slide from right fade animation
  slideFromRightFade,

  /// Scale animation
  scale,

  /// Fade scale animation
  fadeScale,

  /// Size animation
  size,

  /// Size fade animation
  sizeFade,

  /// No animation
  none,
}
