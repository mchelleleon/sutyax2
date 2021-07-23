import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:suutyaax/registro/dialogos/dialogoVolverMenu.dart';
import 'dialogos/dialogoErrorGeneral.dart';

Future<void> registrarAcciones(String iddocumento,context) {
  CollectionReference users = FirebaseFirestore.instance.collection('usuarios');

  return users
      .doc(iddocumento)
      .update({
    "Acciones" : true,
  })
      .then((value) => dialogoVolverMenu(context))
      .catchError((error) => dialogoErrorGeneral(context));
}