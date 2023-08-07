import 'package:flutter/material.dart';
import 'dart:math';

class ColorAnimationScreen extends StatefulWidget {
  const ColorAnimationScreen({super.key});

  @override
  _ColorAnimationScreenState createState() => _ColorAnimationScreenState();
}

class _ColorAnimationScreenState extends State<ColorAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;

  List<TweenSequenceItem<Color?>> tweenSequenceItems = [];

  // Define a list of random colors to use for the animation
  List<Color> _colors = List.generate(
      5, (_) => Colors.accents[Random().nextInt(Colors.accents.length)]);

  @override
  void initState() {
    super.initState();

    // Create an animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Define a list of tweens to animate between random colors
    List<ColorTween> colorTweens = [];
    for (int i = 0; i < _colors.length - 1; i++) {
      colorTweens.add(ColorTween(begin: _colors[i], end: _colors[i + 1]));
    }

    //

    tweenSequenceItems = List<TweenSequenceItem<Color?>>.generate(
      colorTweens.length - 1,
      (int index) => TweenSequenceItem<Color?>(
        tween: colorTweens[index],
        weight: 1.0,
      ),
    );

    _animation = TweenSequence([...tweenSequenceItems])
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Start the animation
    // _controller.repeat(reverse: true);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Color Animation')),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: _animation.value,
          ),
          child: TextButton(
            onPressed: () {
              // Choose a new set of random colors for the animation

              _colors = List.generate(
                  5,
                  (_) =>
                      Colors.accents[Random().nextInt(Colors.accents.length)]);

              // Define a new list of tweens to animate between the new colors
              List<ColorTween> colorTweens = [];
              for (int i = 0; i < _colors.length - 1; i++) {
                colorTweens
                    .add(ColorTween(begin: _colors[i], end: _colors[i + 1]));
              }

              // Create a new tween sequence from the list of tweens
              _animation = TweenSequence(tweenSequenceItems).animate(
                  CurvedAnimation(
                      parent: _controller, curve: Curves.easeInOut));
              // Restart the animation
              _controller.reset();
              _controller.forward();
              // _controller.repeat(reverse: true);
            },
            child: const Text('Change Color'),
          ),
        ),
      ),
    );
  }
}
