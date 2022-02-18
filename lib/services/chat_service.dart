import 'package:chat_app/models/mensajes_response.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:chat_app/global/environment.dart';
import 'package:chat_app/models/usuario.dart';


class ChatService with ChangeNotifier {

  late Usuario usuarioPara;

  Future<List<Mensaje>> getChat ( String usuarioID ) async {

    final _token = await (AuthService.getToken());
    final uri = Uri.parse('${Environment}/mensajes/$usuarioID');

    final resp = await http.get( uri,
      headers: {
        'Content-Type': 'application/json',
        'x-token': _token.toString()
      }
    );

    final mensajesResp = mensajesResponseFromJson( resp.body );

    return mensajesResp.mensajes;

  }

}