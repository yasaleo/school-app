import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:school_app/data_layer/appstateconstants/app_state.dart';
import 'package:school_app/presentation/screens/home_screen.dart';

import '../../presentation/screens/class_detail_screen.dart';
import '../../presentation/screens/classes_screen.dart';
import '../../presentation/screens/student_detail_screen.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(NavigationInitial(
          initialScreen:  HomeScreen(),
        ));

  navigateTo(PageState st) async {
    emit(NavigationLoading());
    _navigation(st);
  }

  throwFailure()async{
    emit(NavigationLoading());

    await Future.delayed(const Duration(milliseconds: 500));
    emit(NavigationFailure(errorMessage: "oops something went too faaaar"));
    emit(NavigationInitial(initialScreen:  HomeScreen()));
  }

  Future _navigation(PageState st) async {
    await Future.delayed(const Duration(milliseconds: 800));
    switch (st) {
      case PageState.classesView:
        emit(NavigatedScreens(screen: ClassesScreen()));

        return;
      case PageState.studentsView:
        emit(NavigatedScreens(screen: ClassDetailScreen()));
        return;
      case PageState.studentDetailView:
        emit(NavigatedScreens(screen: StudentDetailScreen()));
        return;
      default:
        {
          emit(NavigatedScreens(screen:  HomeScreen()));
          return;
        }
    }
  }
}
