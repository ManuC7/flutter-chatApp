
import 'package:chat_app/models/usuarios_response.dart';
import 'package:http/http.dart' as http;

import 'package:chat_app/global/environment.dart';
import 'package:chat_app/models/usuario.dart';

import 'package:chat_app/services/auth_services.dart';

class UsuariosService {

  Future<List<Usuario>> getUsuarios() async {



    try{

      final _token = await (AuthService.getToken());

      final uri = Uri.parse('${ Environment.apiUrl }/usuarios');

      final resp = await http.get(uri, 
      headers: {
        'Content-Type': 'application/json',
        'x-token': _token.toString()
        }
      );

      final usuariosResponse = usuariosResponseFromJson( resp.body );

      return usuariosResponse.usuarios;


    }
    catch (e){
      return [];
    }

  }
}