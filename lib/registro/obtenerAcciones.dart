import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suutyaax/registro/dialogos/dialogoErrorGeneral.dart';
import 'package:suutyaax/registro/dialogos/dialogoRevisando.dart';
import 'package:suutyaax/registro/registroAcciones.dart';


const verdePima = Color(0xffA0D041);
const verdePantano = Color(0xff4F6228);

class ObtenerAcciones extends StatefulWidget{
  final String idDocumento;
  final int numeroDeAcciones;
  final int repeticiones;
  ObtenerAcciones(this.idDocumento,this.numeroDeAcciones,this.repeticiones);
  @override
  ObtenerAccionesState createState () => ObtenerAccionesState();
}

class ObtenerAccionesState extends State<ObtenerAcciones> {

  @override
  void initState() {
    super.initState();
    contenidoAcciones();
  }

  String nombreColeccion = "casaSustentable"; //nombre que se le dara a la nueva coleccion
  var store = FirebaseFirestore.instance.collection('casaSustentable');
  // ignore: deprecated_member_use
  var seleccionado = new List(7);
  int cantidadSeleccionados = 0;
  List<QueryDocumentSnapshot> listadoAcciones;

  void contenidoAcciones (){
    String nombreCategoria = "categoria" + widget.repeticiones.toString();
    print (nombreCategoria);
    print (widget.idDocumento);

    for (int i = 0; i < 7; i++)
    {
      seleccionado[i] = 0;
    }

    FirebaseFirestore.instance
        .collection('usuarios')
        .doc(widget.idDocumento)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print (documentSnapshot[nombreCategoria]);
        if(documentSnapshot[nombreCategoria] == "Casa Sustentable")
        {
          setState(() {
            store = FirebaseFirestore.instance.collection('casaSustentable');
            nombreColeccion = 'casaSustentable';
          });
        }
        else if(documentSnapshot[nombreCategoria] == "Trabajo sustentable")
        {
          setState(() {
            store = FirebaseFirestore.instance.collection('trabajoSustentable');
            nombreColeccion = 'trabajoSustentable';
          });
        }
        else if(documentSnapshot[nombreCategoria] == "Transporte sustentable")
        {
          setState(() {
            store = FirebaseFirestore.instance.collection('transporteSustentable');
            nombreColeccion = 'transporteSustentable';
          });
        }
        else if(documentSnapshot[nombreCategoria] == "Vida sustentable")
        {
          setState(() {
            store = FirebaseFirestore.instance.collection('vidaSustentable');
            nombreColeccion = 'vidaSustentable';
          });
        }
        else
        {
          setState(() {
            store = FirebaseFirestore.instance.collection('compartiendoMiSustentabilidad');
            nombreColeccion = 'compartiendoMiSustentabilidad';
          });
        }
      }
    });

  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
        color: verdePantano,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: store
                      .snapshots(),
                  builder: (context, snapshot){
                    if (snapshot.hasData){
                      listadoAcciones = snapshot.data.docs;
                      return ListView.builder(
                        itemCount: listadoAcciones.length,
                        itemBuilder: (context, index){
                          return Container(
                            color: seleccionado[index] == 0 ? Colors.white : Colors.amber,
                            child: GestureDetector(
                              onTap: ()
                              {
                                setState(() {
                                  if (seleccionado[index]== 1)
                                  {
                                    seleccionado[index] = 0;
                                    cantidadSeleccionados = cantidadSeleccionados - 1;
                                  }
                                  else
                                    {
                                      seleccionado[index] = 1;
                                      cantidadSeleccionados = cantidadSeleccionados + 1;
                                    }

                                });
                              },
                              child: Card(
                                color: seleccionado[index] == 0 ? Colors.white : Colors.amber,
                                child: new ListTile(
                                  title: Text("${listadoAcciones[index]['accion']}",
                                      style: TextStyle(fontSize: 25.0)) ,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Center (
                      child: Platform.isIOS ? CupertinoActivityIndicator(
                          radius: 15):
                      new CircularProgressIndicator(),
                    );
                  }
              ),
            ),
            MaterialButton( //boton de siguiente
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(7.0)
              ),
              padding: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height/20,
              onPressed: cantidadSeleccionados == 0
                  ? null : registroAcciones,
              color: cantidadSeleccionados == 0
                  ? Colors.black38 : verdePima,
              child: Text('Siguiente',
                  style: TextStyle(fontSize: 20,
                      color: cantidadSeleccionados == 0
                          ? Colors.transparent : Colors.white,
                      fontWeight: FontWeight.w400)
              ),
            ),
          ],
        ),
      ),
    );
  }

  void registroAcciones (){

    cargandoInformacion(context); //dialogo que muestra que se esta cargando la informacion
    for (int i = 0; i < 7; i++)
      {
        if (seleccionado[i] == 1)
        {
          FirebaseFirestore.instance.collection('usuarios')
              .doc(widget.idDocumento)
              .collection(nombreColeccion)
              .add({
            'Accion': listadoAcciones[i]['accion'] //your data which will be added to the collection and collection will be created after this
          }).then((_){
            print("collection created");
          }).catchError((_){
            dialogoErrorGeneral(context);
          });
        }
      }
    if (widget.repeticiones == widget.numeroDeAcciones -1 )
    {
      registrarAcciones(widget.idDocumento,context);
    }
    else
      {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            ObtenerAcciones(widget.idDocumento,widget.numeroDeAcciones,widget.repeticiones+1)), (Route<dynamic> route) => false);
      }
  }
}