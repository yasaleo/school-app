
import 'dart:math';

import 'package:flutter/material.dart';

class CustomAnimatedButton extends StatefulWidget {
  const CustomAnimatedButton({super.key});

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton>
    with TickerProviderStateMixin {
  late Animation<double> circleAnimation;
  late AnimationController circleController;

  late Animation<double> shadowAnimation;
  late AnimationController shadowController;
  bool reverse = false;
  @override
  void initState() {
    initCircleAnimation();
    initShadowAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        shadowController.forward();
        if (circleAnimation.value == 100 || reverse) {
          circleController.reverse();
        } else if (!reverse) {
          circleController.forward();
        }
      },
      onTapUp: (details) {
        shadowController.reverse();

        circleController.stop();
      },
      child: SizedBox(
        child: CustomPaint(
          foregroundPainter: CircleProgress(
            progress: circleAnimation.value,
          ),
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    blurRadius: shadowAnimation.value,
                    color: Colors.black54,
                    offset: const Offset(0, 0),
                    spreadRadius: shadowAnimation.value,
                  )
                ]),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white54,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    circleController.dispose();
    shadowController.dispose();
    super.dispose();
  }

  void initCircleAnimation() {
    circleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    circleAnimation =
        Tween<double>(begin: 0, end: 100).animate(circleController)
          ..addListener(() {
            setState(() {});

            reverseLogic();
          });
  }

  void initShadowAnimation() {
    shadowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
      reverseDuration: const Duration(milliseconds: 600),
    );
    shadowAnimation = Tween<double>(begin: 20, end: 0).animate(
      CurvedAnimation(
        parent: shadowController,
        curve: Curves.slowMiddle,
        reverseCurve: Curves.easeOut,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  void reverseLogic() {
    if (circleController.isCompleted) {
      reverse = true;
    } else if (circleController.isDismissed) {
      reverse = false;
    }
  }
}

class CircleProgress extends CustomPainter {
  double progress;

  CircleProgress({required this.progress});
  @override
  void paint(Canvas canvas, Size size) {
    //    paint circle
    Paint circle = Paint()
      ..strokeWidth = 5
      ..color = Colors.black12
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = 75;

    canvas.drawCircle(center, radius, circle);

    // paint arc----------
    Paint animationArc = Paint()
      ..strokeWidth = 5
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * (progress / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi / 2,
        angle, false, animationArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
