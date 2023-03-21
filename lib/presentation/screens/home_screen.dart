import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/data_layer/services/services.dart';
import 'package:school_app/data_layer/state/app_state.dart';

import 'package:school_app/presentation/widgets/animated_number.dart';
import 'package:school_app/presentation/widgets/constants.dart';

import '../../cubit/navigation_cubit/navigation_cubit.dart';
import '../../data_layer/model/schooll_model.dart';
import '../widgets/animated_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle style = Theme.of(context).textTheme.titleMedium!.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Colors.green[900],
        );
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: Services().loadData(),
            builder:
                (BuildContext context, AsyncSnapshot<SchoolModel> snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.green[400],
                  ),
                );
              }

              if (snapShot.hasData &&
                  snapShot.connectionState == ConnectionState.done) {
                final schoolDetails = snapShot.requireData;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.school_outlined,
                      size: 60,
                      color: Colors.green,
                    ),
                    AnimatedText(
                      content: schoolDetails.schoolName!,
                    ),
                    height10,
                    const Text(
                      "Number of Classes",
                      style: TextStyle(fontSize: 18),
                    ),
                    const Icon(Icons.arrow_drop_down),
                    CustomAnimatedNumber(
                      num: schoolDetails.num0FClasses!,
                    ),
                    height10,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, elevation: 10),
                      onPressed: () {
                        
                         BlocProvider.of<NavigationCubit>(context).navigateTo(PageState.classesView);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "View All ",
                            style: TextStyle(color: Colors.green[800]),
                          ),
                          const Icon(
                            Icons.arrow_circle_right_outlined,
                          )
                        ],
                      ),
                    ),
                    height10,
                    Hero(
                      tag: "tag-home",
                      transitionOnUserGestures: true,
                      child: Text(
                        "Classes",
                        style: style,
                      ),
                    )
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.green[400],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
