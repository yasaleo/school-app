import 'dart:developer';

import 'package:flutter/material.dart';

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
            SizedBox(
                height: 50,
                width: 100,
                child: PageView.builder(
                  pageSnapping: true,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Text(
                      "Hello $index",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color:
                            index % 2 == 0 ? Colors.green : Colors.deepPurple,
                      ),
                    );
                  },
                )

                // ListView.builder(
                //   physics: ClampingScrollPhysics(),
                //   controller: scontroller,
                //   scrollDirection: Axis.horizontal,
                //   itemCount: 15,

                //   itemBuilder: (BuildContext context, int index) {
                //      return Padding(
                //        padding: const EdgeInsets.all(2),
                //        child: FittedBox(
                //          child: Text(
                //           "Hello $index",
                //           style: TextStyle(
                //             fontSize: 25,
                //             fontWeight: FontWeight.bold,
                //             color: index % 2 == 0 ? Colors.green : Colors.deepPurple,
                //           ),
                //                      ),
                //        ),
                //      );
                //   },
                // ),
                ),
                   AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              child: Container(
                key: UniqueKey(),
                height: 30,
                width: 100,
                color: colorsList[indexx],
              ),
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
