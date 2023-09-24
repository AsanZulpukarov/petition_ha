import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});

  var styleTextCircular = TextStyle(color: Colors.white,fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isUser
              ? Expanded(
                  child: Container(),
                )
              : Container(
                  margin: EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(child: Text('B',style: styleTextCircular,),backgroundColor: Color(0xff1B1F24),),
                ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment:
                  isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    color: isUser ? Theme.of(context).primaryColor : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 16.0,color: isUser ? Colors.white : Color(0xff1B1F24)),
                  ),
                ),
              ],
            ),
          ),
          isUser
              ? Container(
                  margin: EdgeInsets.only(left: 16.0),
                  child: CircleAvatar(child: Text('U',style: styleTextCircular,),backgroundColor: Theme.of(context).primaryColor,),
                )
              : Expanded(
                  child: Container(),
                ),
        ],
      ),
    );
  }
}
