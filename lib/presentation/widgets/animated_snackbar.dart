
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

  int reeatedTimes = 0;

  bool isFirst = true;
  @override
  void initState() {
    initAnimation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorAnimation.value,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 50,
      width: double.infinity,
      child: const Center(
          child: Text(
        "something went  wrong",
        style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
      )),
    );
  }

  void initAnimation()async {
    
    controller = AnimationController(
    
      vsync: this,
      duration: const Duration(milliseconds: 130,),
      reverseDuration: const Duration(milliseconds: 250)
    );
    colorAnimation =
        ColorTween(begin: Colors.white, end: Colors.red[400]).animate(
      CurvedAnimation(
          parent: controller, curve: Curves.fastOutSlowIn),
    );
    controller.addListener(() {
      if (!mounted) return;
        setState(() {});
      

      if (controller.isCompleted) {
        controller.reverse();
        controller.addListener(() {
          if (!mounted) return;
            setState(() {
              if (controller.isDismissed) {
                if (reeatedTimes != 2) {
                  reeatedTimes++;

                  repeat();
                }
              }
            });
          
        });
      }
    });
    if (isFirst) {
    await Future.delayed(const Duration(milliseconds: 300));
    isFirst = false;
      
    }
    controller.forward();
  }

  repeat() async {
    await Future.delayed(const Duration(milliseconds: 60));
    initAnimation();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
