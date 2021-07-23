import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> dialogoErrorLoginEmail(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      if (Platform.isIOS)
      {
        return CupertinoAlertDialog(
          title: new Text("Error de credenciales."),
          content: new Text("Esta ingresando un email no existente",textAlign: TextAlign.start,),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
      else{
        return AlertDialog(
          title: Text("Error de credenciales"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Esta ingresando un email no registrado'),
                Text("Por favor vuelva a intentarlo"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    },
  );
}