import 'dart:math';

import 'package:flutter/material.dart';


// dibujamos un circulo completo de la clase customCLip

class CustomClip extends CustomClipper<Path> {

  final double progress;

  

  CustomClip(this.progress);

  // Función para calcular el ángulo de inicio y barrido para los arcos de la animación
  // List<Map<String, double>> calcularAngulos(int conoInicio, double progress) {
  //   print(pi / 180);
  //   List<Map<String, double>> angulos = [];

  //   // Ángulo de inicio para el primer arco en cada cono
  //   double startAngle1 = conoInicio * (pi / 180);  // Convertir a radianes
  //   double sweepAngle1 = (-pi / 2);  // Barrido de 90 grados

  //   // Ángulo de inicio y barrido para el segundo arco
  //   double startAngle2 = (conoInicio + 90) * (pi / 180);  // 90 grados más que el primer arco
  //   double sweepAngle2 = (-pi / 2) * progress;  // Barrido de 90 grados

  //   // Ángulo de inicio y barrido para el tercer arco
  //   double startAngle3 = (conoInicio) * (pi / 180);  // 180 grados más que el primer arco
  //   double sweepAngle3 = (-pi / 2) * progress;  // Barrido de 90 grados

  //   angulos.add({'startAngle': startAngle1, 'sweepAngle': sweepAngle1});
  //   angulos.add({'startAngle': startAngle2, 'sweepAngle': sweepAngle2});
  //   angulos.add({'startAngle': startAngle3, 'sweepAngle': sweepAngle3});

  //   return angulos;
  // }

  verificarSumasRestas(double datos){
    if(datos > 360){
      return datos - 360;
    }else if(datos < 0){
      return datos + 360;
    }else{
      return datos;
    }
  }

  calcularAngulos(int inicio, double progress){
    List<Map<String, double>> angulos = [];

    double startAngle1 = ( inicio *  ( 2 * pi ) ) / 360;  // Convertir a radianes
    double sweepAngle1 = (-pi / 2);  // Barrido de 90 grados

    double startAngle2 = (( inicio - 90 ) * ( 2 * pi )) / 360;  // 90 grados más que el primer arco

    // es el inicio del segundo arco más 135 grados
    double sweepAngle2 = (( inicio - 155 * ( 2 * pi )) / 360)  * progress;  // Barrido de 135 grados

    double startAngle3 = startAngle1;
    // es el inicio del primer arco menos 135 grados
    double sweepAngle3 = (( inicio + 115  * ( 2 * pi )) / 360)  * progress;  // Barrido de 135 grados

    angulos.add({'startAngle': startAngle1, 'sweepAngle': sweepAngle1});
    angulos.add({'startAngle': startAngle2, 'sweepAngle': sweepAngle2});
    angulos.add({'startAngle': startAngle3, 'sweepAngle': sweepAngle3});

    return angulos;
  }

  @override
  Path getClip(Size size) {

    final path = Path();

    double width = size.width;
    double height = size.height;

    double startAngle = pi / 4;  // Ángulo de inicio para el primer arco (45 grados)

    List<Map<String, double>> angles = calcularAngulos(135, progress);
    
    // path.moveTo(width / 2, height / 2);
    path.moveTo(width / 2, height / 2);

    final puntoCentral = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2);    

    // path.arcTo(
    //   puntoCentral,
    //   (pi/4), // pi/2 para dibujar un cuarto de círculo
    //   ((-pi / 2) * 2.5) * progress, // -pi/2 para dibujar un cuarto de círculo
    //   true,
    // );


    // path.arcTo(
    //   puntoCentral,
    //   pi / 4, // pi/2 para dibujar un cuarto de círculo
    //   (-pi / 2), // -pi/2 para dibujar un cuarto de círculo
    //   true,
    // );
    // path.lineTo((size.width / 2) , (size.height / 2));

    // path.arcTo(
    //   puntoCentral,
    //   -pi / 4 , // Ángulo de inicio para el segundo arco (135 grados)
    //   (-pi / 4 - pi / 2) * progress, // Ángulo de barrido para el segundo arco (90 grados)
    //   true,
    // );
    // path.lineTo((size.width / 2), (size.height / 2));

    // path.arcTo(
    //   puntoCentral,
    //   (pi / 4), // pi/2 para dibujar un cuarto de círculo
    //   ((pi / 2) * 1.5) * progress, // -pi/2 para dibujar un cuarto de círculo
    //   true,
    // );
    // path.lineTo((size.width / 2), (size.height / 2));





    path.arcTo(
      puntoCentral,
      angles[0]['startAngle']!, // pi/2 para dibujar un cuarto de círculo
      angles[0]['sweepAngle']!, // -pi/2 para dibujar un cuarto de círculo
      true,
    );
    path.lineTo((size.width / 2) , (size.height / 2));

    path.arcTo(
      puntoCentral,
      angles[1]['startAngle']!, // Ángulo de inicio para el segundo arco (135 grados)
      angles[1]['sweepAngle']!, // Ángulo de barrido para el segundo arco (90 grados)
      true,
    );
    path.lineTo((size.width / 2), (size.height / 2));

    path.arcTo(
      puntoCentral,
      angles[2]['startAngle']!, // pi/2 para dibujar un cuarto de círculo
      angles[2]['sweepAngle']!, // -pi/2 para dibujar un cuarto de círculo
      true,
    );
    path.lineTo((size.width / 2), (size.height / 2));





    // path.arcTo(
    //   puntoCentral,
    //   -pi / 4, // Ángulo de inicio para el primer arco (45 grados)
    //   (-pi / 2) , // Ángulo de barrido para el primer arco (90 grados)
    //   true,
    // );
    // path.lineTo((size.width / 2), (size.height / 2));
    // path.arcTo(
    //   puntoCentral,
    //   -pi / 4 - pi / 2, // Ángulo de inicio para el segundo arco (135 grados)
    //   (-pi / 2) * progress, // Ángulo de barrido para el segundo arco (90 grados)
    //   true,
    // );
    // path.lineTo((size.width / 2), (size.height / 2));
    // path.arcTo(
    //   puntoCentral,
    //   -pi / 4 - 2 * pi / 2, // Ángulo de inicio para el tercer arco (225 grados)
    //   (-pi / 2) * progress, // Ángulo de barrido para el tercer arco (90 grados)
    //   true,
    // );
    // path.lineTo((size.width / 2) , (size.height / 2));

    // path.lineTo(width, 0);
    // path.lineTo(width, height);



    // path.lineTo(width, 0);
    // path.lineTo(0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClip oldClipper) {
    return true;
  }
}








// import 'package:flutter/material.dart';

class Shape1 extends StatefulWidget {
  const Shape1({Key? key}) : super(key: key);

  @override
  _ShapeState createState() => _ShapeState();
}

class _ShapeState extends State<Shape1> with SingleTickerProviderStateMixin {
  bool isCircle = true;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MouseRegion(
          onEnter: (_) {
            _controller.forward();
          },
          onExit: (_) {
            _controller.reverse();
          },
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              // print(_controller.value);
              return SizedBox(
                width: 200,
                height: 200,
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: CustomClip(_controller.value),
                      child: Container(
                        decoration: const BoxDecoration(
                          // color: Colors.blue,
                          image: DecorationImage(
                            image: NetworkImage('https://c4.wallpaperflare.com/wallpaper/817/500/937/captain-america-avengers-infinity-war-5k-steve-rogers-wallpaper-preview.jpg',),
                            fit: BoxFit.cover,
                          )
                          // borderRadius: BorderRadius.circular(200),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isCircle = !isCircle;
            !isCircle ? _controller.forward() : _controller.reverse();
          });
        },
        child: const Icon(Icons.change_circle),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// class CustomClip extends CustomClipper<Path> {
//   final double progress;

//   CustomClip(this.progress);

//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.moveTo(size.width / 2, size.height / 2);
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height * progress);
//     path.lineTo(0, size.height);
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
