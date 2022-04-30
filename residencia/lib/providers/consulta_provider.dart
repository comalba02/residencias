import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:residencia/models/consulta_response.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class ConsultarProvider extends ChangeNotifier {
  String _baseUrl = 'miventanilla.palmarescorocora.com';
  String _endPoint = 'residencia/movil/';
  String _endPointVerifica = 'residencia/movil/verifica';
  String _codigo = '';
  String status = '';

  ConsultarProvider() {
    print('metodo para consultar');
  }
  getDatos(String codigo) async {
    String _codigo = _endPoint + codigo;
    var url = Uri.https(_baseUrl, _codigo);
    var response = await http.get(url);
    if (response.body.characters.length > 2) {
      final informacion = ConsultaResponse.fromJson(response.body);
      final Map<String, dynamic> decodedData = json.decode(response.body);
      _launchURL(codigo);
    } else {
      print('vacio');
    }
  }

  verificar() async {
    String barcodeUrl = await FlutterBarcodeScanner.scanBarcode('#FF0000', 'Salir', false, ScanMode.QR);
    if (!await launch(barcodeUrl)) throw 'Could not launch $barcodeUrl';
  }

  _launchURL(String codigo) async {
    String _url = 'https://miventanilla.palmarescorocora.com/residencia/verificar/' + codigo;
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
