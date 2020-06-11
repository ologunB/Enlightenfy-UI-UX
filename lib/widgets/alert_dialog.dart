import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Querying the environment via [Plattform] throws and exception on Flutter web
// This extension adds a new [isWeb] getter that should be used
// before checking for any of the other environments

Future<bool> showAlertDialog({
  @required BuildContext context,
  @required String title,
  @required String content,
  String cancelActionText,
  Function onOK,
  Function onCancel,
  @required String defaultActionText,
}) async {
  return await showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title, style: TextStyle(fontSize: 16, color: Colors.red)),
      content: Text(content, style: const TextStyle(fontSize: 16)),
      actions: <Widget>[
        if (cancelActionText != null)
          CupertinoDialogAction(
            child: Text(cancelActionText),
            onPressed: () => onCancel(),
          ),
        CupertinoDialogAction(
          child: Text(defaultActionText),
          onPressed: () => onOK(),
        ),
      ],
    ),
  );
}
