import 'package:core_flutter_exam/view/item/item.dart';

import 'package:core_flutter_exam/view/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context) => Home_screen(),
      'add':(context) => ItemScreen(),

    },
  ));
}