import 'package:flutter/material.dart';
import 'package:school_app/data_layer/model/schooll_model.dart';
import 'package:school_app/presentation/screens/class_detail_screen.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300],
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return StudentCard(
            studentDetail: StudentsDetail(name: "Name", rollNum: index),
            
          );
        },
        itemCount: 20,
      ),
    );
  }
}
