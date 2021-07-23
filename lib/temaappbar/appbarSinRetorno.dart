import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const verdePantano = Color(0xff4F6228); //colo principal de la aplicacion
const verdePima = Color(0xffA0D041);

Widget temaappbarSinRetorno (String titulo, context){
  return AppBar(
    title: Text(titulo,
        textAlign: TextAlign.center,
        style: TextStyle(color: Platform.isIOS == true ? Colors.transparent : Colors.black,
            fontSize: 23,fontWeight: FontWeight.w600)),
    backgroundColor: Platform.isIOS == true ? verdePantano : verdePantano,
    elevation: 0,
  );
}