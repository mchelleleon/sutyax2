import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> dialogoErrorCorreo(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      if (Platform.isIOS)
      {
        return CupertinoAlertDialog(
          title: new Text("Este correo ya está registrado."),
          content: new Text("Por favor ingrese un correo distinto.",textAlign: TextAlign.start,),
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
          title: Text("Este correo ya está registrado."),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(''),
                Text("Por favor ingrese un correo distinto."),
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