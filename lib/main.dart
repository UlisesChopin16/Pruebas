import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prueba/Animations/PruebasShape/shape2.dart';
import 'package:prueba/Animations/hoover.dart';
import 'package:prueba/Cordenadas/Views/cordenadas_view.dart';
import 'package:prueba/DibujoCorazon/corazon.dart';
import 'package:prueba/PruebaBottomNavigation/botomnavigation.dart';
import 'package:prueba/PruebaPDF/Views/pdf_view.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const CordenadasView(),
      // home: const PdfView(),
      // home: const CorazonView(),
      // home: const Hoover(),
      home: const Shape2()
    );
  }
}

