import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);


const KTextFieldInputDecoration = InputDecoration(
  hintText: null ,
  hintStyle: TextStyle(
    color: Colors.grey,
  ),

  contentPadding:
  EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

const Color KPrimaryColor = Color(0xffd82435);
const Color firstcolor = Color(0xff3a5a40);
const Color secondcolor = Color(0xff344e41);


const String KimageTest ='https://images.zyda.co/cdn-cgi/image/width=640,f=auto,metadata=none/images/581371/image_urls/original/5dc63108c4f24c392a787887b618903751e3e56d.?1695042654';