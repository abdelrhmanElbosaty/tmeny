
import 'package:flutter/material.dart';

class SwitchedWidget extends StatelessWidget {
  final WidgetBuilder? on;
  final WidgetBuilder? off;

  final bool isEnabled;

  const SwitchedWidget({
    Key? key,
    this.on,
    this.off,
    this.isEnabled = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget widget;
    if (isEnabled) {
      if (on != null) {
        widget = on!(context);
      } else {
        widget = Container();
      }
    } else {
      if (off != null) {
        widget = off!(context);
      } else {
        widget = Container();
      }
    }

    return widget;
  }
}
