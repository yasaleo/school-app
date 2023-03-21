import 'package:flutter/material.dart';

import '../model/schooll_model.dart';

enum SState { schoolView, classesView, studentsView, studentDetailView }

class AppState {
  
 static  ValueNotifier<SState> stateNotifier = ValueNotifier(SState.schoolView); 

  static  DetailsOfClass? classDetail;
  static StudentsDetail? studentDetail;
  
}
