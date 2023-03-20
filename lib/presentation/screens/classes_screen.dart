import 'package:flutter/material.dart';
import 'package:school_app/data_layer/model/schooll_model.dart';

import '../widgets/class_card.dart';

class ClassesScreen extends StatelessWidget {
   ClassesScreen({
    
    super.key,
    required this.classesList
    });

  List<DetailsOfClass> classesList;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = Theme.of(context).textTheme.titleMedium!.copyWith(
        fontSize: 20, fontWeight: FontWeight.normal, color: Colors.green[900]);
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        centerTitle: false,
        title: Hero(
            tag: "tag-home",
            child: Text(
              "Classes",
              style: style,
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              maxCrossAxisExtent: 220,
                childAspectRatio: 1/.9
            ),
            itemBuilder: (context, index) {

              return  ClassCard(
                classDetail: classesList[index],
                index: index,
              );
            },
            itemCount: classesList.length,
          ),
        ),
      ),
    );
  }
}


