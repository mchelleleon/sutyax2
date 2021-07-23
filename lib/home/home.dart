import 'package:flutter/material.dart';
import 'package:suutyaax/home/pages/PaginaGrupos.dart';
import 'package:suutyaax/home/pages/PaginaHome.dart';
import 'package:suutyaax/home/pages/PaginaPerfil.dart';
import 'package:suutyaax/models/DbSuuTyaax.dart';
import 'package:suutyaax/models/Usuario.dart';
import 'package:suutyaax/services/Usuario_Service.dart';

void main() => runApp(PageNavegation());

//DEFINICION DE COLORES DE PIMA
const verdePima = Color(0xffA0D041);
const verdePantano = Color(0xff4F6228);

class PageNavegation extends StatefulWidget {
  @override
  _PageNavegationState createState() => _PageNavegationState();
}

class _PageNavegationState extends State<PageNavegation> {
  UsuarioService _usuarioService = UsuarioService();
  int _pageCurrent = 0;

  List<Widget> _listPaginas = [
    PaginaHome(),
    PaginaGrupos(),
    PaginaPerfil()
  ];

  Future<Usuario> getUserSession() async{
    var loggin = await DbSuuTyaax.getLogginActual();
    var userSesion = await _usuarioService.getById(loggin.idUsuario);
    return userSesion;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Suutyaax App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Suutyaax'),
          backgroundColor: verdePantano,
        ),
        body: _listPaginas[_pageCurrent],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _pageCurrent = index;
            });
          },
          backgroundColor: verdePima,
          selectedItemColor: Colors.white,
          currentIndex: _pageCurrent,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "Grupal"),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle), label: "Perfil")
          ],
        ),
      ),
    );
  }
}






