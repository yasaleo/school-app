import 'dart:math';

import 'package:flutter/material.dart';

class CustomAnimatedButton extends StatefulWidget {
  const CustomAnimatedButton({super.key});

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton>
    with TickerProviderStateMixin {
  late Animation<double> _circleAnimation;
  late AnimationController _circleController;

  late Animation<double> _shadowAnimation;
  late AnimationController _shadowController;

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
        _shadowController.forward();
        if (_circleAnimation.value == 100 || reverse) {
          _circleController.reverse();
        } else if (!reverse) {
          _circleController.forward();
        }
      },
      onTapUp: (details) {
        _shadowController.reverse();

        _circleController.stop();
      },
      child: SizedBox(
        child: CustomPaint(          
          foregroundPainter: CircleProgress(
            progress: _circleAnimation.value,
          ),
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    blurRadius: _shadowAnimation.value,
                    color: Colors.black54,
                    offset: const Offset(0, 0),
                    spreadRadius: _shadowAnimation.value,
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
    _circleController.dispose();
    _shadowController.dispose();
    super.dispose();
  }

  void initCircleAnimation() {
    _circleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    _circleAnimation =
        Tween<double>(begin: 0, end: 100).animate(_circleController)
          ..addListener(() {
            setState(() {});

            reverseLogic();
          });
  }

  void initShadowAnimation() {
    _shadowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
      reverseDuration: const Duration(milliseconds: 600),
    );
    final shadowTween = Tween<double>(begin: 20, end: 0);
    
    _shadowAnimation = shadowTween.animate(
      CurvedAnimation(
        parent: _circleController,
        curve: Curves.slowMiddle,
        reverseCurve: Curves.easeOut,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  void reverseLogic() {
    if (_circleController.isCompleted) {
      reverse = true;
    } else if (_circleController.isDismissed) {
      reverse = false;
    }
  }
}

class CircleProgress extends CustomPainter {
  double progress;

  CircleProgress({
    required this.progress,
  });
  @override
  void paint(Canvas canvas, Size size) {
    //    paint circle
    Paint circle = Paint()
      ..strokeWidth = 5
      ..color = Colors.black26
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = 75;

    canvas.drawCircle(center, radius, circle);

    // paint arc----------
    Paint animationArc = Paint()
      ..strokeWidth = 7.5
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
