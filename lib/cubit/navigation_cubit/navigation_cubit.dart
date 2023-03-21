
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:school_app/data_layer/state/app_state.dart';
import 'package:school_app/presentation/screens/home_screen.dart';

import '../../presentation/screens/class_detail_screen.dart';
import '../../presentation/screens/classes_screen.dart';
import '../../presentation/screens/student_detail_screen.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super( NavigationInitial(
          initialScreen: const HomeScreen(),
        ));

  navigateTo(PageState st) {
   
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
          emit( NavigatedScreens(screen: const HomeScreen()));
          return;
        }
    }
  }
}
