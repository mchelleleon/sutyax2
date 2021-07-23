class Loggin{
  int idLoggin;
  String idUsuario;
  String token;
  String dateLoggin;

  Loggin({this.idLoggin, this.idUsuario, this.token, this.dateLoggin});

  Map<String, dynamic> toMap(){
    return {
      'idLoggin' : idLoggin,
      'idUsuario' : idUsuario,
      'token' : token,
      'dateLoggin' : dateLoggin
    };
  }
}