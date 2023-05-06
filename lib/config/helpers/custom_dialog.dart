import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

customDialog(String title, String content, context) {
  if (Platform.isIOS) {
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
      ),
    );
  }
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(content),
    ),
  );
}
