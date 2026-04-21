import 'package:flutter/material.dart';

class NoFlashPageRoute<T> extends MaterialPageRoute<T> {
  NoFlashPageRoute({required super.builder});

  @override
  Duration get transitionDuration => Duration.zero;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}