import 'package:flutter/material.dart';

class MouseAnimatedContainer extends StatefulWidget {
  const MouseAnimatedContainer({ Key? key }) : super(key: key);

  @override
  _MouseAnimatedContainerState createState() => _MouseAnimatedContainerState();
}

class _MouseAnimatedContainerState extends State<MouseAnimatedContainer> {

  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          _isHover = true;
        });
        print('Mouse entered');
      },
      onExit: (event) {
        setState(() {
          _isHover = false;
        });
        print('Mouse exited');
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: 200,
        height: _isHover ? 100 : 80,
        color: _isHover ? Colors.blue : Colors.red,
      ),
    );
  }
}