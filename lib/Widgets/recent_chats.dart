import 'package:ChatUI/models/message_model.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
        height: 200,
        color: Colors.blueAccent,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: favorites.length, // length of the list, optional
          itemBuilder: (BuildContext ctxt, int index) {
            CircleAvatar(
              child: Image.asset(favorites[index].imageUrl),
            );
          },
        ));
  }
}
