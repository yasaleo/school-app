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
            builder: (BuildContext context, SState state, _) {
              return buildScreens(st: state,model: data);
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget buildScreens({required SState st, required SchoolModel model}) {
    switch (st) {
      case SState.classesView:
        return ClassesScreen();
        case SState.studentsView:
        return ClassDetailScreen( );
        case SState.studentDetailView:
        return StudentDetailScreen();
      default:{
        return const HomeScreen();
      }
    }
  }
}
