import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rive/rive.dart';
import 'package:school_app/presentation/screens/login_screen.dart';

import '../widgets/constants.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController constroller;
  late Animation<Offset> animation;
  @override
  void initState() {
    constroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    animation = Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0)).animate(
      CurvedAnimation(parent: constroller, curve: Curves.elasticOut),
    );
    constroller.forward();
    navigateToLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              height10,
              height10,
              height10,
              Expanded(
                flex: 1,
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    return SlideTransition(
                      position: animation,
                      child: child,
                    );
                  },
                  child: const Text(
                    "School App",
                    style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Expanded(
                flex: 2,
                child: SizedBox(
                  height: 400,
                  width: 550,
                  child:
                      RiveAnimation.asset('assets/99-150-locating-a-school.riv'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToLogin() {
    Future.delayed(
      const Duration(milliseconds: 5500),
      () {
        Navigator.of(context).pushReplacement(CupertinoPageRoute(
          builder: (context) => LoginScreen(),
        ));
      },
    );
  }
}
