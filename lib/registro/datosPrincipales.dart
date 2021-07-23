import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suutyaax/models/DbSuuTyaax.dart';
import 'package:suutyaax/models/Usuario.dart';
import 'package:suutyaax/registro/registrarPrincipales.dart';
import 'package:suutyaax/services/Usuario_Service.dart';
import 'package:suutyaax/temaappbar/appbarRegistro.dart';
import 'dialogos/dialogoErrorCorreo.dart';
import 'dialogos/dialogoErrorGeneral.dart';
import 'dialogos/dialogoRevisando.dart';

const verdePima = Color(0xffA0D041);
const verdePantano = Color(0xff4F6228);

class DatosPrincipales extends StatefulWidget{

  final empresas = FirebaseFirestore.instance.collection("empresas");
  @override
  DatosprincipalesElementos createState() => DatosprincipalesElementos();
}

class DatosprincipalesElementos extends State<DatosPrincipales>{
  UsuarioService _usuarioService = UsuarioService();
  //Controladores de datos
  TextEditingController controladornombre = new TextEditingController();
  String valorNombre;
  TextEditingController controladorapellidos = new TextEditingController();
  String valorApellidos;
  TextEditingController controladorcorreo = new TextEditingController();
  String valorCorreo;
  TextEditingController controladorcontra = new TextEditingController();
  String valorContra;

  var nombreEmpresa;
  var defaultNombre = true;
  int mostrarContra = 0;
  int correoexistente = 0;

  @override
  Widget build(BuildContext context) {

    //medidas de la pantalla
    final double alturageneral = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: temaappbarRegistro("Registro",context),
      body: Container(
        color: verdePantano,
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children:<Widget>[
            Container ( // Contenedor de Text Field Nombre
              width: MediaQuery.of(context).size.width/1.2,
              padding: EdgeInsets.only(
                  top: 3, left: 10, right: 10, bottom: 3
              ),
              decoration: BoxDecoration (
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
              ),
              child: TextField( //TextField para el Nombre
                cursorColor: verdePima,
                controller: controladornombre,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Nombre.',
                    hintText: 'Nombre.'
                ),
                onChanged: (value){
                  setState(() {
                    valorNombre = value;
                  });
                },
              ),
            ),
            //Separacion entre campos
            Container(
              height: alturageneral/20,
            ),
            Container ( // Contenedor de Text Field Apellidos
              width: MediaQuery.of(context).size.width/1.2,
              padding: EdgeInsets.only(
                  top: 3, left: 10, right: 10, bottom: 3
              ),
              decoration: BoxDecoration (
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
              ),
              child: TextField( //TextField para el Nombre
                cursorColor: verdePima,
                controller: controladorapellidos,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Apellidos.',
                    hintText: 'Apellidos.'
                ),
                onChanged: (value){
                  setState(() {
                    valorApellidos = value;
                  });
                },
              ),
            ),
            //Separacion entre campos
            Container(
              height: alturageneral/20,
            ),
            //Separacion entre campos
            Container ( // Contenedor de Text Field Correo
              width: MediaQuery.of(context).size.width/1.2,
              padding: EdgeInsets.only(
                  top: 3, left: 10, right: 10, bottom: 3
              ),
              decoration: BoxDecoration (
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
              ),
              child: TextField( //TextField para el Nombre
                cursorColor: verdePima,
                controller: controladorcorreo,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Correo electrónico.',
                    labelStyle: TextStyle(color: correoexistente == 1 ? Colors.red : null),
                    hintText: 'Correo electrónico.'
                ),
                onChanged: (value){
                  setState(() {
                    correoexistente = 0;
                    valorCorreo = value;
                  });
                },
              ),
            ),
            //Separacion entre campos
            Container(
              height: alturageneral/20,
            ),
            //Seperacion entre campos
            Row( //row para la contraseña
              children: <Widget>[
                Container (
                  width: MediaQuery.of(context).size.width/1.4,
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
                        hintText: 'Contraseña.',
                        labelText: 'Contraseña.',
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
            //Separacion de contenedores
            Container(
              height: alturageneral/20,
            ),
            //Separacion de contenedores
            Container ( // Contenedor de la lista desplegable
              width: MediaQuery.of(context).size.width/1.2,
              padding: EdgeInsets.only(
                  top: 3, left: 10, right: 10, bottom: 3
              ),
              decoration: BoxDecoration (
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Seleccione su empresa", style: TextStyle(fontSize: 15.0)),
                  StreamBuilder<QuerySnapshot>(
                    stream: widget.empresas
                        .orderBy('Nombre')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) return Container();
                      if (defaultNombre) {
                        nombreEmpresa = snapshot.data.docs[0].get('Nombre'); //Pone la primer empresa de la lista como predeterminado
                      }
                      return DropdownButton(
                        focusColor: Colors.white,
                        isExpanded: false,
                        value: nombreEmpresa,
                        items: snapshot.data.docs.map((value) {
                          return DropdownMenuItem(
                            value: value.get('Nombre'),
                            child: Text('${value.get('Nombre')}'),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(
                                () {
                              nombreEmpresa = value;
                              //Ya no pone la primer empresa de la lista como predefinida
                              defaultNombre = false;
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              )
            ),
            //Separacion de contenedores
            Container(
              height: alturageneral/20,
            ),

            Container(
              height: alturageneral/20,
            ),
            //Separacion de contenedores
            MaterialButton( //boton de siguiente
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(7.0)
              ),
              padding: EdgeInsets.all(15),
              height: alturageneral/20,
              onPressed: valorContra == null || valorContra.isEmpty ||
                  valorCorreo == null || valorCorreo.isEmpty ||
                  valorNombre == null || valorNombre.isEmpty ||
                  valorApellidos == null || valorApellidos.isEmpty
                  ? null : registroUsuario,
              color: valorContra == null || valorContra.isEmpty ||
                  valorCorreo == null || valorCorreo.isEmpty ||
                  valorNombre == null || valorNombre.isEmpty ||
                  valorApellidos == null || valorApellidos.isEmpty
                  ? Colors.black38 : verdePima,
              child: Text('Siguiente',
                  style: TextStyle(fontSize: 20,
                      color: valorContra == null || valorContra.isEmpty ||
                          valorCorreo == null || valorCorreo.isEmpty ||
                          valorNombre == null || valorNombre.isEmpty ||
                          valorApellidos == null || valorApellidos.isEmpty
                          ? Colors.transparent : Colors.white,
                      fontWeight: FontWeight.w400)
              ),
            ),
          ],
        ),
      ),
    );
  }

  //funcion que registra al usuario en la base de datos

  void registroUsuario() async{
    cargandoInformacion(context);

    var userEmail = await _usuarioService.getByEmail(valorCorreo);
    if(userEmail == null){ //verificamos que no exista ese correo
      registrarPrincipales(valorNombre, valorApellidos, valorCorreo, valorContra, nombreEmpresa,'1',context);
    }else{
      dialogoErrorCorreo(context);
    }
  }


}