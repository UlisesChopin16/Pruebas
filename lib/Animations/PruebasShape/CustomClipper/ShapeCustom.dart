
// dibujamos un circulo completo de la clase customCLip

import 'dart:math';

import 'package:flutter/material.dart';

class CustomClip extends CustomClipper<Path> {

  final double progress;
  final int inicio;

  CustomClip({
    required this.progress,
    required this.inicio
  });

  verificarSumasRestas(double datos){
    if(datos > 360){
      return datos - 360;
    }else if(datos < 0){
      return datos + 360;
    }else{
      return datos;
    }
  }

  calcularAngulos(int inicioAngulo, double progress){
    List<Map<String, double>> angulos = [];

    double startAngle1 = ( inicioAngulo *  ( 2 * pi ) ) / 360;  // Convertir a radianes
    double sweepAngle1 = (-pi / 2);  // Barrido de 90 grados

    double startAngle2 = (( inicioAngulo - 90 ) * ( 2 * pi )) / 360;  // 90 grados más que el primer arco

    // es el inicio del segundo arco más 135 grados
    double sweepAngle2 = (( inicioAngulo - 155 * ( 2 * pi )) / 360)  * progress;  // Barrido de 135 grados

    double startAngle3 = startAngle1;
    // es el inicio del primer arco menos 135 grados
    double sweepAngle3 = (( inicioAngulo + 115  * ( 2 * pi )) / 360)  * progress;  // Barrido de 135 grados

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

    List<Map<String, double>> angles = calcularAngulos(inicio, progress);
    
    // path.moveTo(width / 2, height / 2);
    path.moveTo(width / 2, height / 2);

    final puntoCentral = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2);    

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

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClip oldClipper) {
    return true;
  }
}

