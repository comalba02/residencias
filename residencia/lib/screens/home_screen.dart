import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Certificado de Residencia'),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
              onPressed: () {
                // Navigator.pushReplacementNamed(context, 'solicitud');
                launch('https://miventanilla.palmarescorocora.com/residencia', forceWebView: true, enableJavaScript: true, enableDomStorage: true);
              },
              child: Text('solicitud')),
        ),
      ),
    );
  }
}
