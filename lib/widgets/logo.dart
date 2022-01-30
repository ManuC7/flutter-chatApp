import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  final String title;

  const Logo({ 
    Key? key, 
    required this.title 
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
         child: Container(
        width: 170,
        margin: EdgeInsets.only( top: 30 ),
        child: Column(          
          children: [
            Image(
              image: AssetImage('assets/tag-logo.png'),
              // height: 150.0,
              // width: 300.0
              ),
            Text( title, style: TextStyle( fontSize: 30),)
          ],
        ),
      ),
    );
  }
}
