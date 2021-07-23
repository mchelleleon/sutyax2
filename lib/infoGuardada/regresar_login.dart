import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suutyaax/home/home.dart';
import 'package:suutyaax/login/login.dart';
import 'package:suutyaax/models/DbSuuTyaax.dart';

Future<String> regresarvalores(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("token");
  if (token == 'Confirmado')
  {
    var loggin = await DbSuuTyaax.getLogginActual();
    if(loggin != null){ //existe logeo
      print(loggin.idUsuario);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) =>
              PageNavegation()), (
          Route<dynamic> route) => false);
    }else{
      //no existe logeo
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) =>
              LoginPrincipal()), (
          Route<dynamic> route) => false);
    }

  }
  return token;
}