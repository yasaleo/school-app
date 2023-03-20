import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_app/presentation/screens/student_detail_screen.dart';
import 'package:school_app/presentation/widgets/constants.dart';

import '../../data_layer/model/schooll_model.dart';

class ClassDetailScreen extends StatelessWidget {
  ClassDetailScreen(
      {super.key, required this.index, required this.classDetail});
  final DetailsOfClass classDetail;

  int index;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = Theme.of(context).textTheme.titleMedium!.copyWith(
        fontSize: 20, fontWeight: FontWeight.normal, color: Colors.green[900]);

    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Hero(
          tag: "tag-$index",
          child: Text(
            classDetail.className!,
            style: style,
          ),
        ),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return _headerDetails(context);
          }else{
          return StudentCard(
            studentDetail: classDetail.studentsDetails![index-1],
            index: index,
          );}
        },
        itemCount: classDetail.studentsDetails!.length+1,
      )),
    );
  }

  Padding _headerDetails(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Class teacher : ",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Text(
                              classDetail.classTeacher!,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Number of Students : ",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Text(
                              classDetail.totalnumberOfStudents.toString(),
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                height10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("List of Students"),
                    Icon(Icons.arrow_downward_rounded,size: 15,)
                  ],
                )
              ],
            ),
          );
  }
}

class StudentCard extends StatelessWidget {
  StudentCard({
    Key? key,
    required this.studentDetail,
    required this.index,
  }) : super(key: key);

  StudentsDetail studentDetail;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () async {
          await Future.delayed(const Duration(milliseconds: 250));
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => StudentDetailScreen(
                studentDetail: studentDetail,
                index: index,
              ),
            ),
          );
        },
        splashColor: Colors.green,
        radius: 500,
        child: Card(
          elevation: 10,
          color: Colors.transparent,
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green[300],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Roll no:",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Hero(
                        tag: 'studentrollnum$index',
                        child: Text(
                          studentDetail.rollNum.toString(),
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const VerticalDivider(
                    endIndent: 10,
                    thickness: 2,
                    indent: 10,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "Name:",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Hero(
                        tag: 'studentname$index',
                        child: Text(
                          studentDetail.name!,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      )
                    ],
                  ),
                  const Spacer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
