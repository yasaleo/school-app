import 'dart:math';

import 'package:flutter/material.dart';
import 'package:school_app/presentation/screens/testScreen.dart';
import 'package:school_app/presentation/widgets/custom_page_transition.dart';

import 'custom_animated_shadow_button.dart';

class CustomAnimatedSizeWidget extends StatefulWidget {
  const CustomAnimatedSizeWidget({super.key});

  @override
  State<CustomAnimatedSizeWidget> createState() =>
      _AnimatedSizeTransformWidgetState();
}

class _AnimatedSizeTransformWidgetState extends State<CustomAnimatedSizeWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> _sizeAnimation;
  late Animation<double> _angleAnimation;

  late AnimationController _controller;

  String content = "WELCOME";

  @override
  void initState() {
    initializeSizeAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deSize = MediaQuery.of(context).size;
    
    return GestureDetector(
      onTapUp: (tapUpDetails) => _ontap(),
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _sizeAnimation.value,
              child: Transform.rotate(
                angle: _angleAnimation.value * pi / 360,
                child: CustomAnimatedShadowButton(
                  content: content,
                ),
              ),
            );
          }),
    );
  }

  void _ontap() async {
    await Future.delayed(const Duration(milliseconds: 150));
    _controller.forward();
    
  }

  void initializeSizeAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    final sizeTween = Tween<double>(
      begin: 1,
      end: 150,
    );

    _sizeAnimation = sizeTween.animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInCubic,
      ),
    );

    final angleTween = Tween<double>(
      begin: 0,
      end: 180,
    );

    _angleAnimation = angleTween.animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linearToEaseOut,
      ),
    );
    _controller.addListener(() { 
      if (_controller.isCompleted) {
        navigation();
      }
        
      
      
    });
  }

  void navigation()  {
    
    if (mounted) {
      Navigator.of(context).pushReplacement(
          CustomPageTransition().customFadeRoute(page: const TestScreen()));
    }
  }

  @override
  void dispose() {

    _controller.dispose();
    
    super.dispose();
  }
}
