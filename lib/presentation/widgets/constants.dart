import 'package:flutter/material.dart';


const height10 = SizedBox(

  height: 10,
);

const width10 = SizedBox(

  height: 10,
);

const divider =  Divider(
                    color: Colors.black54,
                    endIndent: 25,
                    indent: 25,
                  );

ValueNotifier<List<Map<String, dynamic>>> userListNotifier = ValueNotifier([]);

// ValueNotifier<List<UserModel>> allUserNotifier = ValueNotifier([]);

