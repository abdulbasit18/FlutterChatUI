import 'package:ChatUI/Widgets/category_selector.dart';
import 'package:ChatUI/Widgets/recent_chats.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            focusColor: Colors.white,
            iconSize: 30.0,
            onPressed: () {}),
        title: Text(
          'Chats',
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              focusColor: Colors.white,
              iconSize: 30.0,
              onPressed: () {})
        ],
      ),
      body: Column(
        children: [
          CategorySelector(),
          RecentChats()
        ],
      ),
    );
  }
}
