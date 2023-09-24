import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petition_ha/amansCreate/service_aman.dart';
import 'package:petition_ha/widgets/appBar.dart';

import '../../service/api_service.dart';
import 'chat_message.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> messages = [];
  TextEditingController _textController = TextEditingController();

  Future<void> _addMessage(String text) async {
    setState(() {
      messages.add(ChatMessage(
        text: text,
        isUser: true,
      ));
      _textController.clear();
    });

    var response = await ServiceAman().postSendQuestion(text);
    var data = json.decode(response.body);
    String botResponse = data['response'];

    setState(() {
      messages.add(ChatMessage(
        text: botResponse,
        isUser: false,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return messages[index];
              },
            ),
          ),
          Divider(height: 1.0.h),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).primaryColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _addMessage,
                decoration:
                    InputDecoration.collapsed(hintText: 'Введите сообщение'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _addMessage(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
