import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List songDetails = [
  'Moon River',
  'Summer Love',
  'Midnight Sun',
  'Ocean Blue',
  'Thunder Road',
  'Golden Days',
  'Wild Heart',
  'Crystal Sky',
  'Electric Dreams',
  'Silent Storm',
];

class SlidableAnimationScreen extends StatefulWidget {
  const SlidableAnimationScreen({super.key});

  @override
  State<SlidableAnimationScreen> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlidableAnimationScreen> {
  late ScrollController scontroller = ScrollController();

  List<Color> colorsList = [
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.purple
  ];
  int indexx = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slide Transitions"),
      ),
      body: Center(
        child: Column(
          children: [
            _CustomSlidable(),
            const SizedBox(
              height: 100,
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              child: Container(
                key: UniqueKey(),
                height: 30,
                width: 100,
                color: colorsList[indexx],
              ),
            ),
            SizedBox(
              height: 200,
              child: Text(songDetails[0]),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                indexx++;
                if (indexx == colorsList.length) indexx = 0;
              });
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: FittedBox(
                child: Text("end"),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              colorsList.shuffle();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: FittedBox(
                child: Text("start"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomSlidable extends StatelessWidget {
  _CustomSlidable({
    Key? key,
  }) : super(key: key);

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 280,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: SizedBox(
          // height: 50,
          // width: 180,
          child: PageView.builder(
            onPageChanged: (value) {
           
              
            },
            controller: controller,
            pageSnapping: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 50,
                width: 180,
                child: Center(
                  child: Text(
                    songDetails[index],
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: index % 2 == 0 ? Colors.green : Colors.deepPurple,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
