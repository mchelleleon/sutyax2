import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suutyaax/registro/registrarRubros.dart';
import 'package:suutyaax/services/Usuario_Service.dart';
import 'package:suutyaax/temaappbar/appbarSinRetorno.dart';
import 'dialogos/dialogoErrorGeneral.dart';
import 'dialogos/dialogoRevisando.dart';

const verdePima = Color(0xffA0D041);
const verdePantano = Color(0xff4F6228);

class SeleccionRubros extends StatefulWidget{
  //valores que se recibiran de la seccion anterior
  final String correo;
  SeleccionRubros(this.correo);

  @override
  SeleccionRubrosElementos createState() => SeleccionRubrosElementos();
}

class SeleccionRubrosElementos extends State<SeleccionRubros>{
  UsuarioService _usuarioService = UsuarioService();
  int casaSustentableSelec = 0;
  int trabajoSustentableSelec = 0;
  int transporteSustentableSelec = 0;
  int vidaSustentableSelec = 0;
  int compartoSustentableSelec = 0;
  int rubrosSeleccionados = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: temaappbarSinRetorno("Registro",context),
      body: Container(
        color: verdePantano,
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children:<Widget>[
            Column(
              children:<Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.3,
                    child: Text ("Seleccione los rubros en los que desea participar.",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color:Colors.white),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/30,
                ),
                Row( //Empieza primer linea
                  mainAxisAlignment: MainAxisAlignment.center, //Mantiene centrada la fila
                  children: <Widget>[
                    //Mi casa sustentable
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Material(
                            elevation: 5.0, //Efecto de elevación del botton
                            borderRadius: BorderRadius.circular(100), //Bordeado del botton
                            clipBehavior: Clip.hardEdge,
                            color: casaSustentableSelec == 0 ? Colors.white70  : Colors.amber,
                            child: Stack(
                              alignment: Alignment.bottomCenter, //Mantiene centrado el botton
                              fit: StackFit.passthrough, //
                              children: [
                                Ink.image(
                                  image: AssetImage('assets/DiseñoMicasasustentable.png'), //Imagen
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width/2.7, //Anchura
                                  height: MediaQuery.of(context).size.height/4.8, //Altura
                                  child: InkWell(onTap: () {
                                    setState(() {
                                      casaSustentableSelec == 1 ? casaSustentableSelec = 0 : casaSustentableSelec = 1;
                                      casaSustentableSelec == 1 ? rubrosSeleccionados ++ : rubrosSeleccionados --;
                                    });
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    //mi Trabajo Sustentable
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Material(
                            elevation: 5.0, //Efecto de elevación del botton
                            borderRadius: BorderRadius.circular(100), //Bordeado del botton
                            clipBehavior: Clip.hardEdge,
                            color: trabajoSustentableSelec == 0 ? Colors.white70  : Colors.amber,
                            child: Stack(
                              alignment: Alignment.bottomCenter, //Mantiene centrado el botton
                              fit: StackFit.passthrough, //
                              children: [
                                Ink.image(
                                  image: AssetImage('assets/Mitrabajosustentable.png'), //Imagen
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width/2.7, //Anchura
                                  height: MediaQuery.of(context).size.height/4.8, //Altura
                                  child: InkWell(onTap: () {
                                    setState(() {
                                      trabajoSustentableSelec == 1 ? trabajoSustentableSelec = 0 : trabajoSustentableSelec = 1;
                                      trabajoSustentableSelec == 1 ? rubrosSeleccionados ++ : rubrosSeleccionados --;
                                    });
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ), //Termina primera fila
                Row( //Empieza segunda linea
                  mainAxisAlignment: MainAxisAlignment.center, //Mantiene centrada la fila
                  children: <Widget>[
                    //Mi transporte sustentable
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Material(
                            elevation: 5.0, //Efecto de elevación del botton
                            borderRadius: BorderRadius.circular(100), //Bordeado del botton
                            clipBehavior: Clip.hardEdge,
                            color: transporteSustentableSelec == 0 ? Colors.white70  : Colors.amber,
                            child: Stack(
                              alignment: Alignment.bottomCenter, //Mantiene centrado el botton
                              fit: StackFit.passthrough, //
                              children: [
                                Ink.image(
                                  image: AssetImage('assets/Mitransportesustentable.png'), //Imagen
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width/2.7, //Anchura
                                  height: MediaQuery.of(context).size.height/4.8, //Altura
                                  child: InkWell(onTap: () {
                                    setState(() {
                                      transporteSustentableSelec == 1 ? transporteSustentableSelec = 0 : transporteSustentableSelec = 1;
                                      transporteSustentableSelec == 1 ? rubrosSeleccionados ++ : rubrosSeleccionados --;
                                    });
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    //mi vida Sustentable
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Material(
                            elevation: 5.0, //Efecto de elevación del botton
                            borderRadius: BorderRadius.circular(100), //Bordeado del botton
                            clipBehavior: Clip.hardEdge,
                            color: vidaSustentableSelec == 0 ? Colors.white70  : Colors.amber,
                            child: Stack(
                              alignment: Alignment.bottomCenter, //Mantiene centrado el botton
                              fit: StackFit.passthrough, //
                              children: [
                                Ink.image(
                                  image: AssetImage('assets/Mividasustentable.png'), //Imagen
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width/2.7, //Anchura
                                  height: MediaQuery.of(context).size.height/4.8, //Altura
                                  child: InkWell(onTap: () {
                                    setState(() {
                                      vidaSustentableSelec == 1 ? vidaSustentableSelec = 0 : vidaSustentableSelec = 1;
                                      vidaSustentableSelec == 1 ? rubrosSeleccionados ++ : rubrosSeleccionados --;
                                    });
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),//Termina la segunda fila
                Row( //Empieza ultima linea
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Comparto Mi sustentabilidad
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Material(
                            elevation: 5.0, //Efecto de elevación del botton
                            borderRadius: BorderRadius.circular(100), //Bordeado del botton
                            clipBehavior: Clip.hardEdge,
                            color: compartoSustentableSelec == 0 ? Colors.white70  : Colors.amber,
                            child: Stack(
                              alignment: Alignment.bottomCenter, //Mantiene centrado el botton
                              fit: StackFit.passthrough, //
                              children: [
                                Ink.image(
                                  image: AssetImage('assets/Compartomisustentabilidad.png'), //Imagen
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width/2.7, //Anchura
                                  height: MediaQuery.of(context).size.height/4.8, //Altura
                                  child: InkWell(onTap: () {
                                    setState(() {
                                      compartoSustentableSelec == 1 ? compartoSustentableSelec = 0 : compartoSustentableSelec = 1;
                                      compartoSustentableSelec == 1 ? rubrosSeleccionados ++ : rubrosSeleccionados --;
                                    });
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column( //Boton de siguiente
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: MaterialButton( //boton de siguiente
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(7.0)
                            ),
                            padding: EdgeInsets.all(15),
                            height: MediaQuery.of(context).size.height/20,
                            onPressed: rubrosSeleccionados == 0
                                ? null : siguienteListas,
                            color: rubrosSeleccionados == 0
                                ? Colors.black38 : verdePima,
                            child: Text('Siguiente',
                                style: TextStyle(fontSize: 20,
                                    color: rubrosSeleccionados == 0
                                        ? Colors.transparent : Colors.white,
                                    fontWeight: FontWeight.w400)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),//termina la ultima fila
              ],
            ),
          ],
        ),
      ),
    );
  }
  //funcion que llenara los rubros que se hayan selecionado
  void siguienteListas() async{
    cargandoInformacion(context); //dialogo de espera
    var usuario = await _usuarioService.getByEmail(widget.correo);
    if (usuario != null)
    {
      for (int i = 0; i < rubrosSeleccionados; i++)
      {
        String nombreCategoria = "Categoria" + i.toString();
        if (casaSustentableSelec == 1) {
          registrarRubros(nombreCategoria, "Casa Sustentable", usuario.idUsuario, '2',rubrosSeleccionados,context);
          setState(() {
            casaSustentableSelec = 2;
          });
        }
        else if(trabajoSustentableSelec == 1) {
          registrarRubros(nombreCategoria, "Trabajo sustentable", usuario.idUsuario, '2',rubrosSeleccionados,context);
          setState(() {
            trabajoSustentableSelec = 2;
          });
        }
        else if(transporteSustentableSelec == 1) {
          registrarRubros(nombreCategoria, "Transporte sustentable", usuario.idUsuario, '2',rubrosSeleccionados, context);
          setState(() {
            transporteSustentableSelec = 2;
          });
        }
        else if(vidaSustentableSelec == 1) {
          registrarRubros(nombreCategoria, "Vida sustentable", usuario.idUsuario, '2',rubrosSeleccionados,context);
          setState(() {
            vidaSustentableSelec = 2;
          });
        }
        else {
          registrarRubros(nombreCategoria, "Compartiendo mi sustentabilidad", usuario.idUsuario, '2',rubrosSeleccionados,context);
          setState(() {
            compartoSustentableSelec = 2;
          });
        }
      }
    }
    else //Por si cualquier falla se presenta de conexion
        {
      dialogoErrorGeneral(context);
    }
  }

}

