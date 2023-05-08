import 'package:flutter/material.dart';

Future loadingDialog(
    {required String title, required BuildContext context}) async {
  return await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator.adaptive(),
            Text(title),
          ],
        ),
      );
    },
  );
}
