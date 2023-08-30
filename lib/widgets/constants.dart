import 'package:flutter/material.dart';

Widget deflutText({required String text}) => Text(
      text,
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );

class AppConst {
  static const Color kMainColor = Color.fromARGB(255, 204, 177, 252);
  static const Color backGroud = Color.fromARGB(255, 230, 230, 232);
  static const BoxShadow defultBoxShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.25),
    offset: Offset(0, 4),
    blurRadius: 4,
    spreadRadius: 0,
  );
}

// https://newsapi.org/v2/top-headlines?country=eg&apiKey=1892de611537491eae15e337592e5723&category=business