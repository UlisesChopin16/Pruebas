
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;


class Pdf {
  pw.Document pdf;

  Pdf() : pdf = pw.Document();

  Future<Uint8List> savePdf() async {
    // Generamos el documento
    await generateDocument();

    // Guardamos el documento al final
    return pdf.save();
  }

  Future<void> generateDocument() async {
    // Limpiamos la instancia actual del documento
    pdf = pw.Document();

    String src = 'https://p.calameoassets.com/181204032312-06bffccc0e6f815e4f15a5ef07f174c2/p1.jpg';

    final ByteData data = await rootBundle.load('assets/img/p1.jpg'); 
    final Uint8List imageData = data.buffer.asUint8List();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.zero,
        build: (context) {
          return pw.Stack(
            children: [
              pw.Positioned(
                left: 0,
                top: 0,
                right: 0,
                bottom: 0,
                child: pw.Image(
                  pw.MemoryImage(imageData),
                ),
              ),
              pw.Positioned(
                left: 263,
                top: 454.1,
                child: pw.Container(
                  width: 185,
                  height: 16,
                  child: pw.Text(
                    'Hola, soy un texto', 
                    style: const pw.TextStyle(
                      fontSize: 10,
                      color: PdfColor.fromInt(0xff000000)
                    ),
                  ),
                ),
              ),
             
            ],
          );
        },
      ),
    );
  }
}
