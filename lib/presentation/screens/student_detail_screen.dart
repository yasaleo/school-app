import 'package:flutter/material.dart';
import 'package:school_app/data_layer/state/app_state.dart';
import 'package:school_app/presentation/widgets/constants.dart';

import '../../data_layer/model/schooll_model.dart';

class StudentDetailScreen extends StatelessWidget {
  StudentDetailScreen({
    super.key,
   
  });

 late StudentsDetail studentDetail;
  // int index;

  @override
  Widget build(BuildContext context) {
    studentDetail = AppState.studentDetail!;
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            AppState.stateNotifier.value = PageState.studentsView;
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Student Detail"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                _BasicDetail(
                  studentDetail: studentDetail,
                  // index: index,
                ),
                const SizedBox(
                  height: 25,
                ),
                _MarkTable(
                  markList: studentDetail.marksList!,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MarkTable extends StatelessWidget {
  _MarkTable({
    Key? key,
    required this.markList,
  }) : super(key: key);
  List<MarksList> markList;
  @override
  Widget build(BuildContext context) {
    return DataTable(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.green[300],
      ),
      dataRowHeight: 70,
      horizontalMargin: 60,
      columns:const [
        DataColumn(
          label: Text("Subject"),
        ),
        DataColumn(
          label: Text("Marks"),
        ),
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(
              Text(markList[0].subject!),
            ),
            DataCell(
              Text(markList[0].marks!.toString()),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              Text(markList[1].subject!),
            ),
            DataCell(
              Text(markList[1].marks!.toString()),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              Text(markList[2].subject!),
            ),
            DataCell(
              Text(markList[2].marks!.toString()),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              Text(markList[3].subject!),
            ),
            DataCell(
              Text(markList[3].marks!.toString()),
            ),
          ],
        ),
      ],
    );
  }
}

class _BasicDetail extends StatelessWidget {
  _BasicDetail({
    Key? key,
    required this.studentDetail,
    // required this.index,


  }) : super(key: key);

  StudentsDetail studentDetail;
  // int index;


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[200],
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Student Name :',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(
                  width: 25,
                ),
                Hero(
                  tag: 'studentnameindex',
                  child: Text(
                    studentDetail.name!,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                const Spacer()
              ],
            ),
            height10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Roll no :',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(
                  width: 75,
                ),
                Hero(
                  tag: 'studentrollnumindex',
                  child: Text(
                    studentDetail.rollNum.toString(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                const Spacer()
              ],
            ),
            height10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Place :',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(
                  width: 85,
                ),
                Text(
                  studentDetail.place!,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const Spacer()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
