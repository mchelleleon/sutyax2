import 'package:shared_preferences/shared_preferences.dart';

instruccionesPasadas (String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}