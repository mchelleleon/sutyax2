import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> cargandoInformacion(context) async { //Mensaje emergente que se muestra cuando se estan verificando sus datos
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      if(Platform.isIOS){
        return CupertinoAlertDialog(
          title: new Text("Se están verificando sus datos, esto podría tardar unos minutos."),
          content: CupertinoActivityIndicator(
            radius: 15,
          ),
        );
      }
      else{
        return AlertDialog(
          title: Text("Se están verificando sus datos, esto podría tardar unos minutos.  "),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
              ],
            ),
          ),
          actions: <Widget>[
            CircularProgressIndicator()
          ],
        );
      }
    },
  );
}