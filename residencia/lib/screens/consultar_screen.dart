import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:residencia/providers/providers.dart';
import 'package:residencia/themes/app_theme.dart';
import 'package:residencia/widgets/widget.dart';

class ConsultarScreen extends StatelessWidget {
  ConsultarScreen({Key? key}) : super(key: key);
  final txtCodigo = TextEditingController();

  Widget build(BuildContext context) {
    final consulta = Provider.of<ConsultarProvider>(context);
    return Scaffold(
        endDrawer: const Menu(),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          // leading: const Icon(Icons.home),
          centerTitle: true,
          title: const Text('Certificado de Residencia'),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomCard(imageUrl: 'https://miventanilla.palmarescorocora.com/img/verificar.jpg'),
              const CustomContainer(titulo: 'Consultar Solicitud'),
              PadddingIpnut(
                  input: CustomInput(
                campo: 'Código',
                icono: Icons.check, // cambiar
                alerta: 'Escriba el código de la solicitud',
                controller: txtCodigo,
              )),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: ElevatedButton(
                    onPressed: () {
                      String codigo = txtCodigo.text;
                      if (codigo.length > 10) consulta.getDatos(codigo);
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), padding: EdgeInsets.symmetric(vertical: 10.0)),
                    child: SizedBox(
                      width: double.infinity,
                      // height: 30.0,
                      child: Text(
                        'Consultar',
                        style: TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
              SizedBox(
                height: 35.0,
              ),
              // const CustomContainer(titulo: 'Escanear QR'),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.primary),
                alignment: Alignment.center,
                width: double.infinity,
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.qr_code_2_outlined),
                      iconSize: 150,
                      color: Colors.white,
                      splashRadius: 120,
                      onPressed: () {
                        consulta.verificar();
                      },
                    ),
                    Text(
                      'Escanear QR',
                      style: TextStyle(color: AppTheme.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
