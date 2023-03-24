import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';

class CustomAnimatedButton extends StatefulWidget {
  const CustomAnimatedButton({super.key});

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  bool reverse = false;
  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        if (animation.value == 100 || reverse) {
          controller.reverse();
        } else if (!reverse) {
          controller.forward();
        }
      },
      onTapUp: (details) {
        controller.stop();
      },
      child: SizedBox(
        child: CustomPaint(
          foregroundPainter: CircleProgress(
            progress: animation.value,
          ),
          child: Container(
            height: 70,
            width: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void initAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = Tween<double>(begin: 0, end: 100).animate(controller)
      ..addListener(() {
        setState(() {});

       reverseLogic();
      });
  }

  void reverseLogic(){
     if (controller.isCompleted) {
          reverse = true;
        } else if (controller.isDismissed) {
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
