import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> dialogoErrorGeneral(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      if (Platform.isIOS)
      {
        return CupertinoAlertDialog(
          title: new Text("Error."),
          content: new Text("Estamos experimentando problemas por favor vuelva a intentarlo más tarde.",textAlign: TextAlign.start,),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
      else{
        return AlertDialog(
          title: Text("Error."),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(''),
                Text("Estamos experimentando problemas por favor vuelva a intentarlo más tarde."),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    },
  );
}