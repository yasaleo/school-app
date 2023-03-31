import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/data_layer/services/services.dart';
import 'package:school_app/data_layer/appstateconstants/app_state.dart';
import 'package:school_app/presentation/screens/slide_animation.dart';
import 'package:school_app/presentation/screens/testScreen.dart';
import 'package:school_app/presentation/screens/transform_text_screen.dart';
import 'package:school_app/presentation/widgets/animated_button.dart';
import 'package:school_app/presentation/widgets/animated_number.dart';
import 'package:school_app/presentation/widgets/animated_painter_widget.dart';
import 'package:school_app/presentation/widgets/constants.dart';
import '../../cubit/navigation_cubit/navigation_cubit.dart';
import '../../data_layer/model/schooll_model.dart';
import '../widgets/animated_text.dart';
import '../widgets/custom_page_transition.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final TextStyle style = Theme.of(context).textTheme.titleMedium!.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Colors.green[900],
        );
    return Scaffold(
      key: _scaffoldKey,
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
                return SingleChildScrollView(
                  child: Column(
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
                          BlocProvider.of<NavigationCubit>(context)
                              .navigateTo(PageState.classesView);
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
                      ),
                      height10,
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, elevation: 10),
                        onPressed: () {
                          BlocProvider.of<NavigationCubit>(context)
                              .throwFailure();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Error ",
                              style: TextStyle(color: Colors.green[800]),
                            ),
                            const Icon(
                              Icons.error_outline_outlined,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      const Center(
                        child: CustomAnimatedButton(),
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                      const Center(
                        child: CustomColorPainterAnimated(),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const TransformTextScreen(),
                            ),
                          );
                        },
                        child: const Text("Animated Text"),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            CustomPageTransition().customScaleRoute(
                              page: const TestScreen(),
                            ),
                          );
                        },
                        child: const Text("Test Screen"),
                      ),
                       const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            CustomPageTransition().customFadeRoute(
                              page: const SlidableAnimationScreen(),
                            ),
                          );
                        },
                        child: const Text("Slidable animation"),
                      ),
                  
                      const SizedBox(
                        height: 150,
                      ),
                    ],
                  ),
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
