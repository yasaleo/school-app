import 'package:flutter/material.dart';

import 'package:school_app/presentation/widgets/size_transform_widget.dart';

class TransformTextScreen extends StatelessWidget {
  const TransformTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text("Animation"),
      // ),
      body:  Center(
        child:  CustomAnimatedSizeWidget(),
      ),
    );
  }
}
