import 'dart:developer';

import 'package:flutter/material.dart';

class CustomColorPainterAnimated extends StatefulWidget {
  const CustomColorPainterAnimated({super.key});

  @override
  State<CustomColorPainterAnimated> createState() =>
      _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomColorPainterAnimated>
    with TickerProviderStateMixin {
  List<Color> colorsList = [
    Colors.red,
    Colors.yellow,
    Colors.cyan,
    Colors.green,
    Colors.teal,
    Colors.orangeAccent,
  ];
  int colorIndex = 0;

  late Animation<Color?> _colorAnimation;
  late AnimationController _colorController;

  late Animation<double> _radiusAnimation;
  late AnimationController _radiusController;

  bool reverse = false;
  @override
  void initState() {
    initColorAnimation();
    initRadiusAnimation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (colorIndex != 0) {
          initColorAnimation();
        }
        _colorController.forward();
      },
      child: SizedBox(
        child: CustomPaint(
          painter: CircleProgress(
            col: _colorAnimation.value!,
            radi: _radiusAnimation.value,
          ),
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _colorAnimation.value!.withAlpha(180),
            ),
            child: const Icon(
              Icons.color_lens,
              color: Colors.white54,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _colorController.dispose();
    _radiusController.dispose();
    super.dispose();
  }

  void initColorAnimation() {
    _colorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _colorAnimation = ColorTween(
      begin: colorsList[colorIndex],
      end: colorsList[colorIndex + 1],
    ).animate(_colorController)
      ..addListener(() {
        setState(() {});

        reverseLogic();
      });
  }

  void reverseLogic() {
    if (_colorController.isCompleted) {
      if (colorIndex <= colorsList.length - 3) {
        colorIndex++;
      } else {
        colorIndex = 0;
        initColorAnimation();
      }
    }
  }

  void initRadiusAnimation() async {
    _radiusController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3800),
      reverseDuration: const Duration(milliseconds: 1000),
    );

    _radiusAnimation = Tween<double>(
      begin: 15,
      end: 75,
    ).animate(
      CurvedAnimation(
        parent: _radiusController,
        curve: Curves.elasticInOut,
        reverseCurve: Curves.easeInOutCubicEmphasized,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener(
        (status) async {
          if (status == AnimationStatus.completed) {
            _radiusController.reverse();
          } else if (status == AnimationStatus.dismissed) {
            await Future.delayed(
              const Duration(milliseconds: 800),
            );
            _radiusController.forward();
          }
        },
      );
    await Future.delayed(
      const Duration(milliseconds: 1000),
    );
    _radiusController.forward();
  }
}

class CircleProgress extends CustomPainter {
  Color col;
  double radi;

  CircleProgress({
    required this.col,
    required this.radi,
  });
  @override
  void paint(Canvas canvas, Size size) {
    //    paint circle
    Paint circle = Paint()
      ..strokeWidth = 25
      ..color = col
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 35);

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = 70;

    canvas.drawCircle(center, radi, circle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
