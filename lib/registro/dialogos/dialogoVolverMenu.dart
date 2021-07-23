import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../main.dart';

Future<void> dialogoVolverMenu(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      if (Platform.isIOS)
      {
        return CupertinoAlertDialog(
          title: new Text("Registro exitoso."),
          content: new Text("Su registro se ha completado con éxito, por favor vuelva al menú e inicie sesión.",textAlign: TextAlign.start,),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("Aceptar"),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                    MyApp()), (Route<dynamic> route) => false);
              },
            ),
          ],
        );
      }
      else{
        return AlertDialog(
          title: Text("Registro exitoso."),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(''),
                Text("Su registro se ha completado con éxito, por favor vuelva al menú e inicie sesión."),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text("Aceptar"),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                    MyApp()), (Route<dynamic> route) => false);
              },
            ),
          ],
        );
      }
    },
  );
}