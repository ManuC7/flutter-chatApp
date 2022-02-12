import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/usuarios_page.dart';

class LoadingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState( context ),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {  
        return Center(
          child: Text('Loading...'),
           );
           },
      ),
   );
  }

  Future checkLoginState( BuildContext context) async {
    final authservice = Provider.of<AuthService>( context, listen: false );

    final autenticado = await authservice.isLoggedIn();

  if ( autenticado ) {
    Navigator.pushReplacement(
        context, 
        PageRouteBuilder(
          pageBuilder: ( _, __, ___ ) => UsuariosPage(),
          transitionDuration: Duration(milliseconds: 0)
        )
      );
    } else {
      Navigator.pushReplacement(
        context, 
        PageRouteBuilder(
          pageBuilder: ( _, __, ___ ) => LoginPage(),
          transitionDuration: Duration(milliseconds: 0)
        )
      );
    }

  }

}