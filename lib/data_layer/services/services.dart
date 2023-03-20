import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:school_app/data_layer/model/schooll_model.dart';

class Services {
  Future<SchoolModel> loadData()async{
  final data =await rootBundle.loadString("assets/class_details.json");

  
  final details = SchoolModel().schoolModelFromJson(data);
  return details;

  log(details.detailsOfClasses!.first.studentsDetails!.first.marksList!.first.subject.toString());

  }
}