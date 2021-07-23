import 'package:flutter/material.dart';
import 'package:suutyaax/models/DbSuuTyaax.dart';
import 'package:suutyaax/models/Loggin.dart';
import 'package:suutyaax/models/Usuario.dart';
import 'package:suutyaax/services/Usuario_Service.dart';

class PaginaHome extends StatelessWidget {
  const PaginaHome({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    UsuarioService _usuarioSer = UsuarioService();


    return Center(
        child: FutureBuilder<Usuario>(
          future: _usuarioSer.getUsuarioSesion(),
          builder: (context, user){
            if(user.hasData){
              return Text("Hola " + user.data.nombre + " " +user.data.apellidos
              , style: TextStyle(fontSize: 14));
            }else{
              return Text("Cargando...");
            }
          },
        ));
  }
}