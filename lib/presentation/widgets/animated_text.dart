import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  AnimatedText({super.key, required this.content});

  String content;

  @override
  State<AnimatedText> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  late Animation<double> sizeAnimation;

  late AnimationController controller;

  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Center(
        child: Text(
          widget.content,
          style: TextStyle(
              color: Colors.green[700],
              fontSize: sizeAnimation.value,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void initAnimation() async {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1200,
      ),
    );

    sizeAnimation = Tween<double>(begin: 10, end: 50).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticOut),
    );

    await Future.delayed(
      const Duration(milliseconds: 100),
    );

    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
