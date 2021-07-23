import 'package:flutter/material.dart';
import 'package:suutyaax/login/login.dart';
import 'package:suutyaax/models/DbSuuTyaax.dart';

class PaginaPerfil extends StatelessWidget {
  const PaginaPerfil({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double alturageneral = MediaQuery.of(context).size.height;
    return Center(
        child: MaterialButton(
          padding: EdgeInsets.all(15),
          height: alturageneral/20,
          color: Colors.lightGreen,
          child: Text(
            'Cerrar sesión'
          ),
          onPressed: (){
            DbSuuTyaax.deleteAllLoggin();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) =>
                    LoginPrincipal()), (
                Route<dynamic> route) => false);
            print("Sesión finalizada");
          },
        ));
  }
}