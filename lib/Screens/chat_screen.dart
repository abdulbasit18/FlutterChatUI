import 'package:ChatUI/models/message_model.dart';
import 'package:ChatUI/models/user_model.dart';
import 'package:ChatUI/widgets/message_view.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen(this.user);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _composeView() {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      color: Colors.white,
      height: 70.0,
      child: Row(
        children: [
          IconButton(
              iconSize: 30.0,
              color: Theme.of(context).primaryColor,
              icon: Icon(Icons.photo),
              onPressed: () {}),
          Expanded(
              child: TextField(
            decoration:
                InputDecoration.collapsed(hintText: 'Send a message.....'),
          )),
          IconButton(
              iconSize: 25.0,
              color: Theme.of(context).primaryColor,
              icon: Icon(Icons.send),
              onPressed: () {})
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
          title: Text(
            widget.user.name,
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_horiz),
              iconSize: 30.0,
              onPressed: () {},
            )
          ],
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(children: [
            Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0))),
                    child: Container(
                      child: ListView.builder(
                          reverse: true,
                          padding: EdgeInsets.only(top: 15.0),
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final Message message = messages[index];
                            final bool isMe =
                                message.sender.id == currentUser.id;
                            return MessageView(message, isMe);
                          }),
                    ),
                  )),
            ),
            _composeView()
          ]),
        ));
  }
}
