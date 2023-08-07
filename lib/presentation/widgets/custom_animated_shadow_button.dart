import 'package:flutter/material.dart';

class CustomAnimatedShadowButton extends StatefulWidget {
  CustomAnimatedShadowButton({super.key, 
    // Key? key,
    required this.content,
  });
  String content;

  @override
  State<CustomAnimatedShadowButton> createState() =>
      _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedShadowButton> {
  bool _iselevated = true;
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (_) => setState(() => _iselevated = true),
      onPointerDown: (_) => setState(() => _iselevated = false),
      child: AnimatedContainer(
      
        duration: const Duration(milliseconds: 160),
        height: 50,
        width: 250,
        decoration: BoxDecoration(
          color: Colors.purple[300],
          borderRadius: BorderRadius.circular(15),
          boxShadow: _iselevated
              ? [
                  const BoxShadow(
                    blurRadius: 0,
                    spreadRadius: 1,
                    color: Colors.black,
                    offset: Offset(5, 4),
                  )
                ]
              : null,
              border: Border.all(
                width: 2,
                
                color: Colors.black
              )
        ),
        child: Center(
          child: FittedBox(

            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                widget.content,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
