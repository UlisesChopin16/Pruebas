import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:prueba/PruebaPDF/creacionPDF/pdf.dart';


class PdfView extends StatefulWidget {
  const PdfView({ Key? key }) : super(key: key);

  @override
  _PdfViewState createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {

  final servicios = Pdf();

  Uint8List pdfBytes = Uint8List(0);

  final variablesObservables = Get.put(VariablesObservables());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      variablesObservables.pdfBytes.value = await servicios.savePdf();
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Vista PDF'),
        ),
        body: Center(
          child: variablesObservables.pdfBytes.value.isEmpty ? CircularProgressIndicator() : PdfPreview(
            build: (format) => variablesObservables.pdfBytes.value
          ),
        ),
      ),
    );
  }
}

class VariablesObservables extends GetxController{
  var pdfBytes = Uint8List(0).obs;
  var servicios = Pdf().obs;
}