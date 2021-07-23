import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:suutyaax/models/Usuario.dart';
import 'package:suutyaax/registro/dialogos/dialogoErrorGeneral.dart';
import 'package:suutyaax/services/Usuario_Service.dart';

import 'dialogos/dialogoCorrecto.dart';

Future <void> registrarPrincipales (String nombre, String apellidos, String correo, String contrasena, String empresa, String bandera, context) async{
  UsuarioService usuarioService = UsuarioService();
      Usuario usuario = Usuario(nombre: nombre, apellidos: apellidos, email: correo, password: contrasena, empresa: empresa, rubros: false, acciones: false);
      await usuarioService.insert(usuario)
      .then((value) => dialogoRegistroCorrecto(context,correo,bandera,null)) // manda un dialogo diciendo que el correo se ha registrado correctamente
      .catchError((error) => dialogoErrorGeneral(context)); //dialogo por si ha ocurrido un error al registar al usuario
}