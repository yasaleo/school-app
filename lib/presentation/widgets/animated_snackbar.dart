import 'dart:developer';

import 'package:flutter/material.dart';


class AnimatedSnackbar extends StatefulWidget {
  const AnimatedSnackbar({super.key});

  @override
  State<AnimatedSnackbar> createState() => _AnimatedSnackbarState();
}

class _AnimatedSnackbarState extends State<AnimatedSnackbar>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAnimation;

   int reeatedTimes=0;
  @override
  void initState() {
    initAnimation();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: colorAnimation.value, borderRadius: BorderRadius.circular(15)),
      height: 50,
      width: double.infinity,
      child: const Center(
          child: Text(
        "something went  wrong",
        style: TextStyle(color: Colors.black),
      )),
    );
  }

  void initAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    colorAnimation =
        ColorTween(begin: Colors.white, end: Colors.red[700]).animate(controller);
    controller.addListener(() {
      setState(() {
        log(colorAnimation.value.toString());
      });
      if (controller.isCompleted) {
        controller.reverse();
        controller.addListener(() {
          setState(() {
           
            if (controller.isDismissed) {
             
              if (reeatedTimes !=2) {
                reeatedTimes = ++reeatedTimes;
                
              repeat();
              }
            }
          });
        });
      }
    });
    controller.forward();
  }

  repeat()async{
    
      await Future.delayed(const Duration(milliseconds: 60));
      initAnimation();
      
   
  }
}
