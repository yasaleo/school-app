// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class FingressLogoScreen extends StatefulWidget {
  const FingressLogoScreen({super.key});

  @override
  State<FingressLogoScreen> createState() => _FingressLogoScreenState();
}

class _FingressLogoScreenState extends State<FingressLogoScreen>
    with TickerProviderStateMixin {
  late Animation<double> drwaAnimation;
  late AnimationController controller;
  @override
  void initState() {
    initializeAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 20,
                  color: Colors.red[200],
                ),
                const SizedBox(
                  height: 100,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: CustomPaint(
                      foregroundPainter: FingressLogoPainter(
                          animatedValue: drwaAnimation.value),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void initializeAnimation() async {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    drwaAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOutCubicEmphasized));

    controller.addListener(() {
      setState(() {});
    });
    await Future.delayed(const Duration(seconds: 1));
    controller.forward();
  }
}

class FingressLogoPainter extends CustomPainter {
  FingressLogoPainter({required this.animatedValue});
  final double animatedValue;
  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = size.height * .18;

    ///_______________________________________ yellow line
    Paint yellowLine = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..color = const Color.fromARGB(255, 234, 211, 2);

    canvas.drawLine(
      Offset(size.width * .0, size.height * .10),
      Offset(size.width * .70 * animatedValue, size.height * .10),
      yellowLine,
    );

    ///_______________________________________________blue line

    Paint blueLine = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..color = const Color.fromARGB(255, 0, 77, 159);
    final blueLinePath = Path();

    blueLinePath.moveTo(size.width * .70, size.height * .38);
    blueLinePath.lineTo(size.width * .09, size.height * .38);
    blueLinePath.lineTo(size.width * .09, size.height * 1 * animatedValue);

    canvas.drawPath(blueLinePath, blueLine);

    ///__________________________________________green line

    Paint greenLine = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..color = const Color.fromARGB(255, 54, 169, 1);
    final greenLinePath = Path();

    greenLinePath.moveTo(size.width * .90, size.height * .0);
    greenLinePath.lineTo(size.width * .90, size.height * .65);
    greenLinePath.lineTo(size.width * .30 * animatedValue, size.height * .65);

    canvas.drawPath(greenLinePath, greenLine);

    ///_______________________________________________red line
    Paint redLine = Paint()
      ..strokeWidth = strokeWidth
      ..color = const Color.fromARGB(255, 194, 0, 0);

    canvas.drawLine(
      Offset(size.width * .30, size.height * .93),
      Offset(size.width * 1 * animatedValue, size.height * .93),
      redLine,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
