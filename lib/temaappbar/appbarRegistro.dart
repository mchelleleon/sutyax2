import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const verdePantano = Color(0xff4F6228); //colo principal de la aplicacion
const verdePima = Color(0xffA0D041);

Widget temaappbarRegistro (String titulo, context){
  return AppBar(
    leading: IconButton(
      icon: Icon(Platform.isIOS == true ? Icons.arrow_back_ios : Icons.arrow_back, color: Platform.isIOS == true ? Colors.black : Colors.white),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
    title: Text(titulo,
        textAlign: TextAlign.center,
        style: TextStyle(color: Platform.isIOS == true ? Colors.transparent : Colors.black,
            fontSize: 23,fontWeight: FontWeight.w600)),
    backgroundColor: Platform.isIOS == true ? verdePantano : verdePantano,
    elevation: 0,
  );
}