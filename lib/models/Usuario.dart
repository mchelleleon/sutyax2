class Usuario{
    String idUsuario;
    String nombre;
    String apellidos;
    String email;
    String password;
    String empresa;
    bool acciones;
    bool rubros;

    static const String collectionId = 'usuarios';
    Usuario({this.nombre, this.apellidos, this.email, this.password, this.empresa, this.acciones, this.rubros});

    Map<String, dynamic> toMap(){
      return {
        'nombre' : nombre,
        'apellidos' : apellidos,
        'email' : email,
        'empresa' : empresa,
        'password' : password,
        'acciones' : acciones,
        'rubros' : rubros
      };
    }

    Usuario.fromSnapshot(String idDocument, Map<String, dynamic> usuario):
          idUsuario = idDocument,
          nombre = usuario['nombre'],
          apellidos = usuario['apellidos'],
          email = usuario['email'],
          empresa = usuario['empresa'],
          password = usuario['password'];
}