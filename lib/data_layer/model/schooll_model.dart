

import 'dart:convert';




class SchoolModel {
    SchoolModel({
        this.schoolName,
        this.num0FClasses,
        this.detailsOfClasses,
    });

    String? schoolName;
    int? num0FClasses;
    List<DetailsOfClass>? detailsOfClasses;

    factory SchoolModel.fromJson(Map<String, dynamic> json) => SchoolModel(
        schoolName: json["school_name"],
        num0FClasses: json["num_0f_classes"],
        detailsOfClasses: json["details_of_Classes"] == null ? [] : List<DetailsOfClass>.from(json["details_of_Classes"]!.map((x) => DetailsOfClass.fromJson(x))),
    );


SchoolModel schoolModelFromJson(String str) => SchoolModel.fromJson(json.decode(str));


}

class DetailsOfClass {
    DetailsOfClass({
        this.className,
        this.classTeacher,
        this.totalnumberOfStudents,
        this.studentsDetails,
    });

    String? className;
    String? classTeacher;
    int? totalnumberOfStudents;
    List<StudentsDetail>? studentsDetails;

    factory DetailsOfClass.fromJson(Map<String, dynamic> json) => DetailsOfClass(
        className: json["class"],
        classTeacher: json["class_teacher"],
        totalnumberOfStudents: json["totalnumber_of_students"],
        studentsDetails: json["students_details"] == null ? [] : List<StudentsDetail>.from(json["students_details"]!.map((x) => StudentsDetail.fromJson(x))),
    );


}

class StudentsDetail {
    StudentsDetail({
        this.name,
        this.place,
        this.rollNum,
        this.marksList,
    });

    String? name;
    String? place;
    dynamic rollNum;
    List<MarksList>? marksList;

    factory StudentsDetail.fromJson(Map<String, dynamic> json) => StudentsDetail(
        name: json["name"],
        place: json["place"],
        rollNum: json["roll_num"],
        marksList: json["marks_list"] == null ? [] : List<MarksList>.from(json["marks_list"]!.map((x) => MarksList.fromJson(x))),
    );


}

class MarksList {
    MarksList({
        this.subject,
        this.marks,
    });

    String? subject;
    int? marks;

    factory MarksList.fromJson(Map<String, dynamic> json) => MarksList(
        subject: json["subject"]!,
        marks: json["marks"],
    );


}


