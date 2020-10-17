import 'package:ChatUI/models/message_model.dart';
import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  final Message message;
  final bool isMe;

  MessageView(this.message, this.isMe);

  @override
  Widget build(BuildContext context) {
    final Container msg = Container(
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
          color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
          borderRadius: isMe
              ? BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                )
              : BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0))),
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : EdgeInsets.only(top: 8.0, bottom: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
      child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message.time,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              message.text,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600),
            )
          ]),
    );

    if (isMe) {
      return msg;
    }

    return Row(
      children: [
        msg,
        IconButton(
            icon: message.isLiked
                ? Icon(Icons.favorite_border)
                : Icon(Icons.favorite),
            color: message.isLiked
                ? Colors.blueGrey
                : Theme.of(context).primaryColor,
            onPressed: () {})
      ],
    );
  }
}
