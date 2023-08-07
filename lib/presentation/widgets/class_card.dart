import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/navigation_cubit/navigation_cubit.dart';
import 'package:school_app/data_layer/model/schooll_model.dart';
import 'package:school_app/data_layer/appstateconstants/app_state.dart';

import 'constants.dart';

class ClassCard extends StatelessWidget {
  const ClassCard({
    Key? key,
    required this.classDetail,
    required this.index,
  }) : super(key: key);

  final DetailsOfClass classDetail;
  final int index;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = Theme.of(context).textTheme.titleMedium!.copyWith(
        fontSize: 20, fontWeight: FontWeight.normal, color: Colors.green[900]);

    return InkWell(
      onTap: () async {
        await Future.delayed(const Duration(milliseconds: 300));

        

        // AppState.stateNotifier.value = SState.studentsView;
        BlocProvider.of<NavigationCubit>(context).navigateTo(PageState.studentsView);
        AppState.classDetail =classDetail;
      },
      borderRadius: BorderRadius.circular(15),
      radius: 100,
      splashColor: Colors.green,
      child: Card(
        color: Colors.transparent,
        elevation: 10,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.green[200],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.people_rounded),
                height10,
                Hero(
                  tag: "tag-$index",
                  child: Text(
                    classDetail.className!,
                    style: style,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
