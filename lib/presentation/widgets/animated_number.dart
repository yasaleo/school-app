import 'package:flutter/material.dart';

class CustomAnimatedNumber extends StatefulWidget {
   CustomAnimatedNumber({
    super.key,
    required this.num
    });

  int num ;

  @override
  State<CustomAnimatedNumber> createState() => _AnimatedNumberState();
}

class _AnimatedNumberState extends State<CustomAnimatedNumber> {
  
  String number = '0';

  @override
  void initState() {
    numberLogic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Text(
          number,
          key: Key(number),
          style: TextStyle(
              fontSize: 40,
              color: Colors.green[900],
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  void numberLogic() async {
    for (var i = 0; i <= widget.num; i++) {
      await Future.delayed(
        const Duration(milliseconds: 150),
      );
      setState(() {
        number = i.toString();
      });
    }
  }
}
