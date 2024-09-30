part of '../simple_animated_dialog_lib.dart';

/// Creates a widget that builds a page with animation and theming support.
///
/// The page is constructed using a [WidgetBuilder] and wrapped in a [SafeArea]
/// to handle safe insets (such as avoiding the status bar). The content of the
/// page is further wrapped in a [Theme] widget to ensure it inherits the
/// current theme.
///
/// - [buildContext]: The build context in which the widget is created.
/// - [animation]: The primary animation for the transition.
/// - [secondaryAnimation]: A secondary animation for transition effects (usually
///   not used in this builder, but passed to support complex transitions).
/// - [builder]: The builder function that constructs the dialog content.
///
/// The page is built inside a [SafeArea], with the top safe area inset
/// ignored (`top: false`), allowing the page to extend into the status bar area
/// if necessary.
///
/// Returns:
/// A widget that builds the page content with safe area and theme support.
Widget _pageBuilder(BuildContext buildContext, Animation<double> animation,
    Animation<double> secondaryAnimation, WidgetBuilder builder) {
  final Widget pageChild = Builder(builder: builder);
  return SafeArea(
    top: false,
    child: Builder(builder: (BuildContext context) {
      return Theme(data: Theme.of(context), child: pageChild);
    }),
  );
}
