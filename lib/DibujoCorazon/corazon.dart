import 'dart:math';

import 'package:flutter/material.dart';



class CorazonView extends StatefulWidget {
  const CorazonView({ Key? key }) : super(key: key);

  @override
  _CorazonState createState() => _CorazonState();
}

class _CorazonState extends State<CorazonView> {

  double width = 0;
  double height = 0;
  
  // metodo para obtener el ancho y alto de la pantalla
  getSize() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  
  double x1 = 0;
  double y1 = 0;

  // Este metodo restara 1 a la variable x1 y y1
  Stream<void> _stream () async* {
    // for (var i = 0; i < 2; i++) {
      await Future.delayed(const Duration(milliseconds: 1000));
      setState(() {
        if (x1 < 400) {
          x1 += 50;
          y1 += 50;
          print('x1: $x1, y1: $y1');
        }
      });
      // yield null;
    // }
  }



  @override
  Widget build(BuildContext context) {
    getSize();
    return Scaffold(
      appBar: AppBar(
          title: const Text('Corazón con CustomPainter'),
        ),
        body: StreamBuilder<void>(
          stream: _stream(),
          builder: (context, snapshot) {
            return Center(
              child: ClipPath(
                clipper: ClipperCorazon(scale: 1),
                child: Container(
                  width: x1,
                  height: y1,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    // image: DecorationImage(
                    //   image: NetworkImage('https://e7.pngegg.com/pngimages/918/108/png-clipart-hello-kitty-my-melody-kuromi-line-hello-kitty-love-heart.png'),
                    //   fit: BoxFit.cover
                    // )
                  ),
                ),
              ),
            );
          }
        ),
    );
  }
}



class ClipperCorazon extends CustomClipper<Path> {
  final double scale;

  ClipperCorazon({this.scale = 1.0});

  @override
  Path getClip(Size size) {
    
    double scaledWidth = size.width * scale;
    double scaledHeight = size.height * scale;

    Path path_0 = Path();
    path_0.moveTo(scaledWidth*0.5017000,scaledHeight*0.9735333);
    path_0.quadraticBezierTo(scaledWidth*0.5028667,scaledHeight*0.9761000,scaledWidth*0.8893333,scaledHeight*0.5318333);
    path_0.cubicTo(scaledWidth*0.9995000,scaledHeight*0.4037667,scaledWidth*0.9941667,scaledHeight*0.3324333,scaledWidth*0.9868333,scaledHeight*0.2430000);
    path_0.cubicTo(scaledWidth*0.9750667,scaledHeight*0.1602667,scaledWidth*0.9404000,scaledHeight*0.0949667,scaledWidth*0.8610000,scaledHeight*0.0525000);
    path_0.cubicTo(scaledWidth*0.7946667,scaledHeight*0.0265667,scaledWidth*0.6671000,scaledHeight*0.0296333,scaledWidth*0.6000000,scaledHeight*0.0666667);
    path_0.quadraticBezierTo(scaledWidth*0.5345000,scaledHeight*0.1000000,scaledWidth*0.5000000,scaledHeight*0.1733333);
    path_0.quadraticBezierTo(scaledWidth*0.4636000,scaledHeight*0.0983667,scaledWidth*0.4015000,scaledHeight*0.0685000);
    path_0.cubicTo(scaledWidth*0.3340333,scaledHeight*0.0309333,scaledWidth*0.2166333,scaledHeight*0.0286000,scaledWidth*0.1476667,scaledHeight*0.0600000);
    path_0.cubicTo(scaledWidth*0.0496667,scaledHeight*0.1000667,scaledWidth*0.0063333,scaledHeight*0.2190333,scaledWidth*0.0103333,scaledHeight*0.2685000);
    path_0.cubicTo(scaledWidth*0.0096000,scaledHeight*0.3494000,scaledWidth*0.0063000,scaledHeight*0.4027333,scaledWidth*0.1131667,scaledHeight*0.5361667);
    path_0.quadraticBezierTo(scaledWidth*0.4978667,scaledHeight*0.9758667,scaledWidth*0.5017000,scaledHeight*0.9735333);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}




class HeartPainter extends CustomPainter {
  final double x1 ;
  final double y1;
  const HeartPainter({required this.x1, required this.y1});
  @override
  void paint(Canvas canvas, Size size) {
    Paint pencil = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    double x = size.width / 2;
    double y = size.height / 2;

    double scale = 3; // Escala para ajustar el tamaño del corazón

    Path path = Path()
      
      
      ..addArc(
        Rect.fromCircle(center: Offset(x - 20 * scale, y - 20 * scale),radius: 20 * scale), 
         2.39, 
         (pi)+.6
      )
      ..moveTo(x , y + 30 * scale )
      ..moveTo(x , y + 30 * scale )
      ..cubicTo(
        x , y + 30 * scale, // Primer punto de control
        x - 7*scale, y + 5 *scale +30, // Segundo punto de control
        x - 35 * scale, y + 5* scale - 35, // Punto final
      )
      ..addArc(
        Rect.fromCircle(center: Offset(x + 20 * scale, y - 20 * scale),radius: 20 * scale), 
         3.3, 
         (pi)+.6
      )
      ..moveTo(x , y + 30 * scale )
      ..cubicTo(
        x , y + 25 * scale, // Primer punto de control
        x + 17*scale, y - 5 *scale +30, // Segundo punto de control
        x + 35 * scale, y - 6.6 * scale, // Punto final
      );
    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
