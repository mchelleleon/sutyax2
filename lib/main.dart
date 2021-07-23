import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:suutyaax/infoGuardada/guardar_info.dart';
import 'package:suutyaax/login/login.dart';

import 'infoGuardada/regresar_login.dart';

Future<void> main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget{

  @override
  DesplegarInfo createState() => DesplegarInfo();
}

//Pantallas para desplegar la informacion general del proyecto

class DesplegarInfo extends State<MyApp>{

  void initState (){
    super.initState();
    regresarvalores(context);
  }

  @override
  Widget build(BuildContext context) {

    final double alturageneral = MediaQuery.of(context).size.height;
    final double anchogeneral = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: alturageneral,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container( //primer letrero de informacion
              width: anchogeneral,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bosque1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: alturageneral/20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: new Text('Omitir', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600)
                          ),
                          onPressed: (){
                            instruccionesPasadas('Confirmado');
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) =>
                                    LoginPrincipal()), (
                                Route<dynamic> route) => false);
                          },
                        )
                      ],
                    ),
                    Container(
                      height: alturageneral/6,
                      child: Text ('1. MOTIVACIÓN',
                          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700)),
                    ),
                    Container(
                      width: anchogeneral/1.5,
                      child: Text("Plantear una MOTIVACIÓN que tenga como objetivo inspirarte todos los días para "
                          "cumplir tus objetivos sustentables tanto en tu persona como en tu entorno. ",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
              )
            ),
            Container( //Segundo letrero de instrucciones
                width: anchogeneral,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bosque2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: alturageneral/20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: new Text('Omitir', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600)
                            ),
                            onPressed: (){
                              instruccionesPasadas('Confirmado');
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) =>
                                      LoginPrincipal()), (
                                  Route<dynamic> route) => false);
                            },
                          )
                        ],
                      ),
                      Container(
                        height: alturageneral/5,
                        width: anchogeneral/1.5,
                        child: Text ('2. ESTABLECER TUS METAS SUSTENTABLES',
                            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700)),
                      ),
                      Container(
                        width: anchogeneral/1.5,
                        child: Column(
                          children: <Widget>[
                            Text("A corto: 3 meses.",
                                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                            Text("Mediano: 6 meses.",
                                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                            Text("Y largo plazo: 1 año.",
                                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                            Text (""),
                            Text("Que te propongas en tu casa, trabajo, comunidad y transporte para lograr vivir sustentablemente.",
                                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            ),
            Container( //tercer letrero de informacion
                width: anchogeneral,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bosque4.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: alturageneral/20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: new Text('Omitir', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600)
                            ),
                            onPressed: (){
                              instruccionesPasadas('Confirmado');
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) =>
                                      LoginPrincipal()), (
                                  Route<dynamic> route) => false);
                            },
                          )
                        ],
                      ),
                      Container(
                        height: alturageneral/6,
                        child: Text ('3. EVALUAR',
                            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700)),
                      ),
                      Container(
                        width: anchogeneral/1.5,
                        child: Column(
                          children: <Widget>[
                            Text("EVALUAR el avance de tus metas:  se tiene que evaluar con los colores:",
                                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                            Text (""),
                            Text("- Verde.",
                                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                            Text("- Naranja.",
                                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                            Text("- Rojo.",
                                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                            Text (""),
                            Text("Según el progreso de cada acción planteada. ",
                                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                          ],
                        )
                      ),
                    ],
                  ),
                )
            ),
            Container( //ultimo letrero de informacion
                width: anchogeneral,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bosque6.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: alturageneral/10,
                      ),
                      Container(
                        height: alturageneral/5,
                        width: anchogeneral/1.5,
                        child: Text ('4. MEDIR EL PROGRESO EN EQUIPO',
                            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700)),
                      ),
                      Container(
                          width: anchogeneral/1.5,
                          child: Column(
                            children: <Widget>[
                              Text("De la misma forma que el individual. De esta forma se puede realizar una discusión constructivas "
                                  "sobre las acciones y beneficios de cada uno.",
                                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                            ],
                          )
                      ),
                      Container(
                        height: alturageneral/20,
                      ),
                      Container(
                        child: MaterialButton(
                          minWidth: 100.0,
                          height: 40.0,
                          onPressed: () {
                            instruccionesPasadas('Confirmado'); //Se guarda la info para que no vuelvan a aparecer las instrucciones
                            Navigator.of(context).pushAndRemoveUntil( //Me lleva al login
                                MaterialPageRoute(builder: (context) =>
                                    LoginPrincipal()), (
                                Route<dynamic> route) => false);
                          },
                          color: Colors.white,
                          child: Text('Empecemos', style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      )
    );
  }
}
