import 'package:flutter/material.dart';

import '../model/schooll_model.dart';

enum PageState { schoolView, classesView, studentsView, studentDetailView }

class AppState {
  
//  static  ValueNotifier<PageState> stateNotifier = ValueNotifier(PageState.schoolView); 

  static  DetailsOfClass? classDetail;
  static StudentsDetail? studentDetail;

  static int? index;

  
  
}
