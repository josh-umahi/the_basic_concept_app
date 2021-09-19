import 'package:flutter/material.dart';

class ViewProfileModalRoute<T> extends PageRoute<T> {
  /// Creates a modal route that replaces the entire screen.
  ViewProfileModalRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool fullscreenDialog = false,
  })  : _builder = builder,
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  final WidgetBuilder _builder;

  @override
  Color? get barrierColor => Colors.black45;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => "My Profile Popup open";

  @override
  Duration get transitionDuration => const Duration(microseconds: 290);

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _builder(context);
  }
}
