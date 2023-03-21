import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/data_layer/services/services.dart';
import 'package:school_app/presentation/screens/class_detail_screen.dart';
import 'package:school_app/presentation/screens/home_screen.dart';
import 'package:school_app/presentation/screens/student_detail_screen.dart';

import '../../cubit/navigation_cubit/navigation_cubit.dart';
import '../../data_layer/model/schooll_model.dart';
import '../../data_layer/state/app_state.dart';
import 'classes_screen.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        if (state is NavigationInitial) {
          return state.initialScreen;
        }
        if (state is NavigatedScreens) {
         
          return state.screen;
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

  }
}



