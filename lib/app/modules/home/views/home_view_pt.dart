import 'package:flutter/material.dart';
//Custom Clipper class with path
// Vague du haut
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
    Offset(size.width - (size.width / 3.25), size.height - 100);
    var secondEnd = Offset(size.width, size.height * .5);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
// Vague du bas
class WaveBasClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint1 = Offset(size.width, 0);
    var controlPoint2 = Offset(size.width, size.height);

    Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height)
      ..quadraticBezierTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
          controlPoint2.dy)
      ..close();

    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
