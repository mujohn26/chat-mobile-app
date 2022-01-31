import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_chat/screens/messages/messages_screen.dart';

class BottomNavigation extends StatelessWidget {

  BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        key: const Key("bottom-navigation-bar"),
        backgroundColor: Colors.white,
        activeColor: const Color(0xFF00b7bc),
        inactiveColor: const Color(0xffcfcedc),
        border: const Border(),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_off_outlined),
            label: 'Group',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                  child: MessagesScreen());
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                  child: MessagesScreen());
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(child: MessagesScreen());
            });

          default:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                  child: MessagesScreen());
            });
        }
      },
    );
  }
}
