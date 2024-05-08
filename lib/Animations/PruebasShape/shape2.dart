
import 'package:flutter/material.dart';
import 'package:prueba/Animations/PruebasShape/CustomClipper/ShapeCustom.dart';

class Shape2 extends StatefulWidget {
  const Shape2({Key? key}) : super(key: key);

  @override
  _Shape2State createState() => _Shape2State();
}

class _Shape2State extends State<Shape2> with TickerProviderStateMixin {

  bool onButton = false;

  late List<AnimationController> _controllers;
  late int _hoveredCircleIndex;

  List<int> inicio = [45, 135, 225, 315];

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(4, (index) => createController());
    _hoveredCircleIndex = -1;
  }

  AnimationController createController() {
    return AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: List.generate(
              4,
              (index) {
                return MouseRegion(
                  onEnter: (event) {
                    _onMouseEnter(index);
                  },
                  onExit: (event) {
                    _onMouseExit(index);
                  },
                  child: AnimatedBuilder(
                    animation: _controllers[index],
                    builder: (context, child) {
                      return ClipPath(
                        clipper: CustomClip(
                          inicio: inicio[index],
                          progress: _controllers[index].value,
                        ),
                        child: Container(
                          color: _getColor(index),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onButton = !onButton;
          _controllers.forEach((controller) {
            onButton ? controller.forward() : controller.reverse();
          });
        },
        
        child: const Icon(Icons.change_circle),
      ),
    );
  }

  void _onMouseEnter(int index) {
    if (_hoveredCircleIndex != index) {
      _hoveredCircleIndex = index;
      _controllers[index].forward();
    }
  }

  void _onMouseExit(int index) {
    if (_hoveredCircleIndex == index) {
      _controllers[index].reverse();
      _hoveredCircleIndex = -1;
    }
  }

  Color _getColor(int index) {
    switch (index) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.green;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.yellow;
      default:
        return Colors.transparent;
    }
  }

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }
}
