import 'package:flutter/material.dart';
import 'package:school_app/data_layer/services/services.dart';
import 'package:school_app/presentation/screens/class_detail_screen.dart';
import 'package:school_app/presentation/screens/home_screen.dart';
import 'package:school_app/presentation/screens/student_detail_screen.dart';

import '../../data_layer/model/schooll_model.dart';
import '../../data_layer/state/app_state.dart';
import 'classes_screen.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Services().loadData(),
      builder: (BuildContext context, AsyncSnapshot<SchoolModel> snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapShot.hasData &&
            snapShot.connectionState == ConnectionState.done) {
              final data = snapShot.requireData;
          return ValueListenableBuilder(
            valueListenable: AppState.stateNotifier,
            builder: (BuildContext context, PageState state, _) {
              return buildScreens(st: state,);
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget buildScreens({required PageState st, }) {
    switch (st) {
      case PageState.classesView:
        return ClassesScreen();
        case PageState.studentsView:
        return ClassDetailScreen( );
        case PageState.studentDetailView:
        return StudentDetailScreen();
      default:{
        return const HomeScreen();
      }
    }
  }
}
