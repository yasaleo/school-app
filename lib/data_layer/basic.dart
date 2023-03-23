import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';

class CustomDateTime {

  loadData() async{
  final data =await rootBundle.loadString("assets/logout_popup_schedule_enhancement.json");
 
  final listt = jsonDecode(data)["data"] as List;
  

  int requiredIndex =0;

  for (var i = 0; i < listt.length; i++) {
   var day = listt[i]['label'] as String;
    log(listt[i]['label']);

    if (day=="Wednesday") {
      requiredIndex = i;
      break;
    }
    
  }


  log(listt[requiredIndex]['availableTimings'].toString());

  }
}