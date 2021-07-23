import 'package:cloud_firestore/cloud_firestore.dart';

import 'dialogos/dialogoCorrecto.dart';
import 'dialogos/dialogoErrorGeneral.dart';

Future<void> registrarRubros(String numCategoria,categoria, String iddocumento,String bandera,int rubrosSeleccionados,context) {
  CollectionReference users = FirebaseFirestore.instance.collection('usuarios');

  return users
      .doc(iddocumento)
      .update({
    numCategoria: categoria,
    "rubros" : true,
  })
      .then((value) => dialogoRegistroCorrecto(context,iddocumento,bandera,rubrosSeleccionados))
      .catchError((error) => dialogoErrorGeneral(context));
}