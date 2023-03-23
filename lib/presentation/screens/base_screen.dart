import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/presentation/widgets/animated_snackbar.dart';

import '../../cubit/navigation_cubit/navigation_cubit.dart';

class BaseScreen extends StatefulWidget {
  BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

 

 

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationCubit, NavigationState>(
      listener: (context, state) {
        if (state is NavigationFailure) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
         
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: AnimatedSnackbar(),
              backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
              duration: Duration(milliseconds: 2000),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is NavigationInitial) {
          return state.initialScreen;
        }
        if (state is NavigationLoading) {
          return Scaffold(
            key: _scaffoldKey,
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
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
