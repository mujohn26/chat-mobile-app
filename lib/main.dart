import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_chat/components/bottom_navigation.dart';
void main() {
  runApp( Homepage());
}


class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Chat",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavigation(),
    );
  }
}

