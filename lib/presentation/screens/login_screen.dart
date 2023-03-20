import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:school_app/data_layer/services/validation.dart';
import 'package:school_app/presentation/widgets/constants.dart';
import 'package:school_app/presentation/widgets/custom_textfeild.dart';

import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: formkey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _Logo(),
                  CustomTextfeild(
                    label: "Email",
                    validator: (value) => Validation().email(value),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextfeild(
                    label: "Password",
                    passwordfeild: true,
                    validator: (value) => Validation().password(value),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        maximumSize: const Size(360, 50),
                        minimumSize: const Size(350, 50),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.greenAccent, width: 5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {}
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Center(
          child: Text(
            'School App',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        const Center(
          child: SizedBox(
            height: 300,
            width: 300,
            child: RiveAnimation.asset("assets/127-191-student.riv"),
          ),
        ),
        height10,
        Text(
          'Login',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const Divider(
          thickness: 3,
          endIndent: 280,
        ),
        height10,
      ],
    );
  }
}
