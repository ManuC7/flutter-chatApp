import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {

  final void Function() onPressed;
  final String text;

  const BlueButton({ 
    Key? key, 
     
    required this.text, 
    required this.onPressed 
    }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 2,
              primary: Colors.blue, // background
              onPrimary: Colors.white,
              shape: StadiumBorder(), // foreground
            ),
            onPressed: onPressed,
            // onPressed: (){},
            child: Container(
              height: 55,
              width: double.infinity,
              child: Center(
                child: Text(text))),
          );
  }
}