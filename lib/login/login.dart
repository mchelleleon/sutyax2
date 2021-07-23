import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suutyaax/home/home.dart';
import 'package:suutyaax/models/DbSuuTyaax.dart';
import 'package:suutyaax/models/Loggin.dart';
import 'package:suutyaax/models/Usuario.dart';
import 'package:suutyaax/registro/datosPrincipales.dart';
import 'package:sqflite/sqflite.dart';
import 'package:suutyaax/registro/dialogos/dialogoErrorLogin.dart';
import 'package:suutyaax/registro/dialogos/dialogoErrorLoginEmail.dart';
import 'package:suutyaax/services/Usuario_Service.dart';


//DEFINICION DE COLORES DE PIMA
const verdePima = Color(0xffA0D041);
const verdePantano = Color(0xff4F6228);


class LoginPrincipal extends StatefulWidget{

  @override
  LoginElementos createState() => LoginElementos();
}

class LoginElementos extends State<LoginPrincipal>{
  UsuarioService _usuarioService = UsuarioService();
  //bandera para mostrar contraseña
  int mostrarContra = 0;

  //declaracion de los controladores de los campos de texto
  TextEditingController controladorcorreo = new TextEditingController();
  String valorCorreo;
  TextEditingController controladorcontra = new TextEditingController();
  String valorContra;

  //funcion del boton de iniciar sesion
  Future<void> iniciarSesion() async {
    print ("Se presiono el boton de ingresar");
    var email = controladorcorreo.text;
    var password = controladorcontra.text;
    var user = await _usuarioService.getByEmail(email);

    if(user != null){
      if(user.password == password){
        await DbSuuTyaax.deleteAllLoggin();
        //registramos el logeo a nivel local
        var uuid = UniqueKey();
        var date = new DateTime.now().millisecondsSinceEpoch.toString();
        Loggin loggin = Loggin(idLoggin: 0, idUsuario: user.idUsuario, token: uuid.toString(), dateLoggin: date);
        await DbSuuTyaax.insertLoggin(loggin);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) =>
                PageNavegation()), (
            Route<dynamic> route) => false);
        print("login correcto");
      }else{
        dialogoErrorLogin(context);
      }
    }else{
      dialogoErrorLoginEmail(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    //variables que sacan el ancho y alto de la pantalla del dispositivo
    final double alturageneral = MediaQuery.of(context).size.height;
    final double anchogeneral = MediaQuery.of(context).size.width;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Container(
              //color: Colors.black, // para que la pantalla sea color negro
              width: anchogeneral,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fondologin.png'), // aqui se le agrega la imagen de fondo a la pantalla de login
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        new Image.asset('assets/logo.png', //Logo de la aplicacion
                          width: alturageneral/2.5, //ancho de la imagen
                          height: alturageneral/2.5,//largo de la imagen, se ponen las mismas cantidades para que quede cuadrada
                        ),
                        //Campo para introducir correo
                        Container (
                          width: MediaQuery.of(context).size.width/1.2,
                          padding: EdgeInsets.only(
                              top: 4, left: 16, right: 16, bottom: 4
                          ),
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            color: Colors.white,
                          ),
                          child: TextField(
                            cursorColor: verdePima,
                            controller: controladorcorreo,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Correo electrónico'
                            ),
                            onChanged: (value){
                              setState(() {
                                valorCorreo = value;
                              });
                            },
                          ),
                        ),
                        //Separador entre campos
                        Container(
                          height: alturageneral/20,
                        ),
                        //Campo para introducir la contraseña
                        Row(
                          children: <Widget>[
                            Container(
                              width: anchogeneral/12,
                            ),
                            Container (
                              width: MediaQuery.of(context).size.width/1.5,
                              padding: EdgeInsets.only(
                                  top: 4, left: 16, right: 16, bottom: 4
                              ),
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.all(Radius.circular(7)),
                                color: Colors.white,
                              ),
                              child: TextField(
                                cursorColor: verdePima,
                                obscureText: mostrarContra == 0 ? true : false,
                                controller: controladorcontra,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Contraseña'
                                ),
                                onChanged: (value){
                                  setState(() {
                                    valorContra = value;
                                  });
                                },
                              ),
                            ),
                            Container (
                              width: MediaQuery.of(context).size.width/6,
                              padding: EdgeInsets.only(
                                  top: 4, left: 5, right: 5, bottom: 4
                              ),
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.all(Radius.circular(7)),
                                color: verdePantano,
                              ),
                              child: IconButton(
                                icon: mostrarContra == 0 ? const Icon(Icons.remove_red_eye_outlined): const Icon(Icons.remove_red_eye),
                                onPressed: (){
                                  setState(() {
                                    mostrarContra == 0 ? mostrarContra = 1 : mostrarContra = 0;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),

                        //Espaciado entre el campo de contraseña y boton para iniciar sesion
                        Container(
                          height: alturageneral/20,
                        ),
                        MaterialButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(7.0)
                          ),
                          padding: EdgeInsets.all(15),
                          height: alturageneral/20,
                          onPressed: valorContra == null || valorContra.isEmpty ||
                              valorCorreo == null || valorCorreo.isEmpty
                              ? null : iniciarSesion,
                          color: valorContra == null || valorContra.isEmpty ||
                              valorCorreo == null || valorCorreo.isEmpty
                              ? Colors.black38 : verdePantano,
                          child: Text('Ingresar',
                              style: TextStyle(fontSize: 20,
                                  color: valorContra == null || valorContra.isEmpty ||
                                      valorCorreo == null || valorCorreo.isEmpty
                                      ? Colors.transparent : Colors.white,
                                  fontWeight: FontWeight.w400)
                          ),
                        ),
                        Container(
                          height: alturageneral/20,
                        ),
                        TextButton(
                          child: new Text('¿Eres nuevo? Regístrate ', style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w800)
                          ),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DatosPrincipales()),
                            );
                            //Aqui ya me llevara a otra pagina para empezar el registro
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
        )
    );
  }
}