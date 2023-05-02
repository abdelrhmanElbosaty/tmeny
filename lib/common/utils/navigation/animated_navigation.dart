import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/utils/app_style/app_colors.dart';

class FadeTransitionRoute<T> extends PageRoute<T> {
  FadeTransitionRoute(this.child);

  @override
  Color get barrierColor => AppColors.appBackgroundColor;

  @override
  String? get barrierLabel => null;

  final Widget child;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 350);
}

// Navigator.of(context)
//     .push(FadeTransitionRoute(FullImagePage(image: image))),

// Route _createRoute(File image) {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => FullImagePage(
//       image: image,
//     ),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(0.5, 1.0);
//       const end = Offset.zero;
//       const curve = Curves.ease;
//
//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }

// Navigator.of(context).push(CustomPageRoute(page));
