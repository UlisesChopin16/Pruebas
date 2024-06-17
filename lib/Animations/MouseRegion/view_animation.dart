import 'package:flutter/material.dart';
import 'package:prueba/Animations/MouseRegion/mouse_animated_container.dart';

class ViewAnimation extends StatelessWidget {
const ViewAnimation({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MouseAnimatedContainer(),
            MouseAnimatedContainer(),
            MouseAnimatedContainer(),
            MouseAnimatedContainer(),
            MouseAnimatedContainer(),
          ],
        ),
      ),
    );
  }
}