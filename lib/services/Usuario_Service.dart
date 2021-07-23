import 'package:suutyaax/models/DbSuuTyaax.dart';
import 'package:suutyaax/models/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioService{
  CollectionReference usuariosRef = FirebaseFirestore.instance.collection(Usuario.collectionId);

  Future<void> insert(Usuario usuario) async{
    await usuariosRef.add(usuario.toMap());
  }

  Future<Usuario> getById(String idUser) async{
    Usuario usuario;
    DocumentSnapshot documentSnapshot = await usuariosRef.doc(idUser).get();
    if(documentSnapshot.exists){
      usuario = Usuario.fromSnapshot(documentSnapshot.id, documentSnapshot.data());
    }
    return usuario;
  }

  Future<Usuario> getByEmail(String email) async{
    var docuser = await usuariosRef.where('email', isEqualTo: email).get();
    List<Usuario> usuarios = [];
    if(docuser.docs.length > 0){
      docuser.docs.forEach((e)
      {
        usuarios.add(Usuario.fromSnapshot(e.id, e.data()));
      });
      return usuarios.first;
    }else{
      return null;
    }
  }

  Future<Usuario> getUsuarioSesion() async{
    var loggin = await DbSuuTyaax.getLogginActual();
    if(loggin != null){
      return getById(loggin.idUsuario);
    }else{
      return null;
    }
  }

}