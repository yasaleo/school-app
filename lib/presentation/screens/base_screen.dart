import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/navigation_cubit/navigation_cubit.dart';

class BaseScreen extends StatelessWidget {
   BaseScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationCubit, NavigationState>(
      listener: (context, state) {
        if (state is NavigationFailure) {
        
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state is NavigationInitial) {
          return state.initialScreen;
        }
        if (state is NavigationLoading) {
          return  Scaffold(
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
