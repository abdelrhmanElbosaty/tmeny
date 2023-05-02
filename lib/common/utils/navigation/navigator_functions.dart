import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<T?> pushMaterialPage<T>(
  BuildContext context,
  Widget page, {
  bool rootNavigator = false,
  RouteSettings? settings,
  bool fullscreenDialog = false,
}) {
  return Navigator.of(context, rootNavigator: rootNavigator).push(
      CupertinoPageRoute(
          builder: (context) => page,
          settings: settings,
          fullscreenDialog: fullscreenDialog));
}

Future<T?> pushReplacementMaterialPage<T>(BuildContext context, Widget page,
    {bool rootNavigator = false, RouteSettings? settings}) {
  return Navigator.of(context, rootNavigator: rootNavigator).pushReplacement(
      MaterialPageRoute(builder: (context) => page, settings: settings));
}

Future<void> pushWithName(
  BuildContext context,
  String widgetName,
  Widget widget,
) async {
  await Navigator.of(context).push(
    MaterialPageRoute(
      settings: RouteSettings(name: widgetName),
      builder: (context) => widget,
    ),
  );
}

void popWithName(BuildContext context, String widgetName) {
  Navigator.of(context).popUntil((route) {
    return route.settings.name == widgetName;
  });
}

Future<void> pushReplacement(
    BuildContext context, String widgetName, Widget widget) async {
  await Navigator.of(context, rootNavigator: true).pushReplacement(
    MaterialPageRoute(
      settings: RouteSettings(name: widgetName),
      builder: (context) => widget,
    ),
  );
}

Future<void> pushReplacementUntil(
    BuildContext context, String widgetName, Widget widget) async {
  await Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
    MaterialPageRoute<void>(builder: (BuildContext context) => widget),
    ModalRoute.withName(widgetName),
  );
}

Future<void> pushWithNameUsingRoot(
  BuildContext context,
  String widgetName,
  Widget widget,
) async {
  await Navigator.of(context, rootNavigator: true).push(
    MaterialPageRoute(
      settings: RouteSettings(name: widgetName),
      builder: (context) => widget,
    ),
  );
}

void canPopFunction(BuildContext context) {
  if (Navigator.of(context).canPop()) {
    Navigator.of(context).pop();
  } else {
    Navigator.of(context, rootNavigator: true).pop();
  }
}

mixin NamedRoute implements Widget {
  String get routeName;
}
