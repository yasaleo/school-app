import 'dart:ui';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final dHeight = MediaQuery.sizeOf(context).height;
    final dWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const AnimatedCircleBackground(),
          const GlassMorphicLayer(),
          fingressTextWidget(
            dHeight: dHeight,
            dWidth: dWidth,
          ),
          subTitleWidget(
            dHeight: dHeight,
            dWidth: dWidth,
          ),
          formFeild(
            dHeight: dHeight,
            dWidth: dWidth,
          )
          // AnimatedCustomContainer()
        ],
      ),
    );
  }

  Widget fingressTextWidget({required double dHeight, required double dWidth}) {
    return Positioned(
      top: dHeight / 10 * .5,
      left: dWidth / 10 * .2,
      child: Text(
        "Fingress",
        style: TextStyle(
          fontSize: 70,
          fontWeight: FontWeight.w800,
          color: Colors.grey[700]?.withOpacity(.45),
          letterSpacing: -2.4,
        ),
      ),
    );
  }

  Widget subTitleWidget({required double dHeight, required double dWidth}) {
    return Positioned(
      top: dHeight / 10 * 1.8,
      left: dWidth / 10 * .3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 4,
          ),
          Text(
            "Welcome back :)",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            "Enter your credentials to login ..",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget formFeild({required double dHeight, required double dWidth}) {
    return Positioned(
      top: dHeight / 10 * 3.4,
      left: dWidth / 10 * .3,
      child: SizedBox(
        width: dWidth / 10 * 9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFeild(
              labelText: "Domain ",
              icon: const Icon(Icons.domain_add_rounded),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(child: _CustomAnimatedButton())
          ],
        ),
      ),
    );
  }
}

class CustomTextFeild extends StatelessWidget {
  CustomTextFeild({
    Key? key,
    required this.icon,
    required this.labelText,
    this.textEditingController,
  }) : super(key: key);
  final Widget icon;
  final String labelText;
  final TextEditingController? textEditingController;

  final InputBorder? border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      color: Colors.grey[700]!.withOpacity(.5),
      width: 2.5,
    ),
  );
  final InputBorder? focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      color: Colors.grey[700]!,
      width: 2.5,
    ),
  );
  final InputBorder? errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      color: Colors.red[700]!,
      width: 2.5,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 10 * 7.5,
      child: TextFormField(
        controller: textEditingController,
        cursorColor: Colors.grey[700],
        decoration: InputDecoration(
          border: border,
          disabledBorder: border,
          enabledBorder: border,
          focusedBorder: focusedBorder,
          errorBorder: errorBorder,
          focusedErrorBorder: errorBorder,
          icon: icon,
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey[700])
        ),
      ),
    );
  }
}

class _CustomAnimatedButton extends StatefulWidget {
  _CustomAnimatedButton();
  bool loading = false;
  @override
  State<_CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<_CustomAnimatedButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.loading = !widget.loading;
        });
      },
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          alignment: Alignment.center,
          height: 50,
          width: widget.loading ? 50 : 300,
          decoration: BoxDecoration(
            color: widget.loading ? Colors.grey : Colors.grey[900],
            borderRadius: BorderRadius.circular(widget.loading ? 50 : 15),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 750),
            child: widget.loading
                ? const Padding(
                  padding:  EdgeInsets.all(12),
                  child:  CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 5,
                  ),
                )
                : const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
          )),
    );
  }
}

class GlassMorphicLayer extends StatelessWidget {
  const GlassMorphicLayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 55,
          sigmaY: 55,
        ),
        child: Container(
          alignment: Alignment.center,
          color: Colors.white.withOpacity(0),
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
        ),
      ),
    );
  }
}

class AnimatedCircleBackground extends StatelessWidget {
  const AnimatedCircleBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dHeight = MediaQuery.sizeOf(context).height;
    final dWidth = MediaQuery.sizeOf(context).width;

    return Container(
      color: Colors.white,
      height: dHeight,
      width: dWidth,
      child: Stack(
        children: [
          Positioned(
            top: dHeight / 10 - 40,
            child: const AnimatedCustomContainer(
              color: Color.fromARGB(
                35,
                242,
                0,
                87,
              ),
              interval: .1,
              size: 60,
            ),
          ),
          Positioned(
            top: dHeight / 10 * 3.5,
            right: dWidth / 10 * 1.5,
            child: const AnimatedCustomContainer(
              color: Color.fromARGB(
                255,
                231,
                240,
                255,
              ),
              interval: .6,
              size: 43,
            ),
          ),
          Positioned(
            bottom: dHeight / 10 * .5,
            left: dWidth / 10 * 1.5,
            child: const AnimatedCustomContainer(
              color: Color.fromARGB(
                255,
                224,
                255,
                221,
              ),
              interval: .4,
            ),
          )
        ],
      ),
    );
  }
}

class AnimatedCustomContainer extends StatefulWidget {
  const AnimatedCustomContainer({
    super.key,
    required this.color,
    required this.interval,
    this.size = 50,
  });
  final Color color;
  final double interval;
  final double size;

  @override
  State<AnimatedCustomContainer> createState() =>
      _AnimatedCustomContainerState();
}

class _AnimatedCustomContainerState extends State<AnimatedCustomContainer>
    with SingleTickerProviderStateMixin {
  late Animation<double> scaleAnimation;
  late AnimationController controller;
  @override
  void initState() {
    initializeAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child:
          // Text("hiii")

          Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  void initializeAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2200,
      ),
    );
    scaleAnimation = Tween<double>(begin: 3, end: 7).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          widget.interval,
          1,
          curve: Curves.easeInOutBack,
        ),
        reverseCurve: Interval(
          widget.interval,
          1,
          curve: Curves.easeInOutBack,
        ),
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }
}
