import 'package:suutyaax/main.dart';
import 'package:suutyaax/models/Loggin.dart';
import 'package:suutyaax/models/Usuario.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbSuuTyaax{
  static Future<Database> _openDB() async{
    return openDatabase(join (await getDatabasesPath(), 'suuTyaax.db'), onCreate: (db, version){
      return db.execute(
        "CREATE TABLE Loggin(idLoggin INTEGER PRIMARY KEY AUTOINCREMENT, idUsuario TEXT, token TEXT, dateLoggin TEXT)",
      );
    }, version: 2);
  }

  static Future<void> insertLoggin(Loggin loggin) async{
      Database db = await _openDB();
      return db.insert("Loggin", loggin.toMap());
  }

  static Future<Loggin> getLogginActual() async{
    Database db = await _openDB();
    final List<Map<String, dynamic>> logginMap = await db.query("Loggin");
    var list = List.generate(logginMap.length, (i) =>
      Loggin(idLoggin: logginMap[i]['idLoggin'],
        idUsuario: logginMap[i]['idUsuario'],
        token: logginMap[i]['token'],
        dateLoggin: logginMap[i]['dateLoggin']
      )
    );
    if(list.length > 0){
      return list.first;
    }else{
      return null;
    }
  }

  static Future<void> deleteAllLoggin() async{
    Database db = await _openDB();
    return db.delete("Loggin");
  }

}