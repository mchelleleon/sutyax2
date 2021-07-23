import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suutyaax/registro/obtenerAcciones.dart';

import '../../main.dart';
import '../seleccionRubros.dart';

Future<void> dialogoRegistroCorrecto(context,String iddocumento, String bandera,int numeroDeAcciones) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      if (Platform.isIOS)
      {
        return CupertinoAlertDialog(
          title: new Text("Registro exitoso."),
          content: new Text("¿Desea continuar con la configuración de su cuenta?.",textAlign: TextAlign.start,),
          actions: [
            TextButton(
                child: Text("Aceptar"),
                onPressed: () {
                  if (bandera == '1')
                    {
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                          SeleccionRubros(iddocumento)), (Route<dynamic> route) => false);
                    }
                  else
                    {
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                          ObtenerAcciones(iddocumento,numeroDeAcciones,0)), (Route<dynamic> route) => false);
                    }
                }),

            TextButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      MyApp()), (Route<dynamic> route) => false);
                }),
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
                Text("¿Desea continuar con la configuración de su cuenta?."),
              ],
            ),
          ),
          actions: [
            TextButton(
                child: Text("Aceptar"),
                onPressed: () {
                  if (bandera == '1')
                  {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        SeleccionRubros(iddocumento)), (Route<dynamic> route) => false);
                  }
                  else
                  {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        ObtenerAcciones(iddocumento,numeroDeAcciones,0)), (Route<dynamic> route) => false);
                  }
                }
                ),
            TextButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      MyApp()), (Route<dynamic> route) => false);
                }),
          ],
        );
      }
    },
  );
}