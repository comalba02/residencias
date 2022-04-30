import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:residencia/providers/consulta_provider.dart';
import 'package:residencia/themes/app_theme.dart';
import 'package:residencia/widgets/padding_widget.dart';
import 'package:residencia/widgets/widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class SolicitudScreen extends StatelessWidget {
  String documento = '';
  final numero = TextEditingController();
  final nombre = TextEditingController();
  final correo = TextEditingController();
  final direccion = TextEditingController();
  final celular = TextEditingController();
  String estado = '3';
  final String usuario = '1';
  String status = '';

  List<PlatformFile>? _files;

  Future<String> _solicitar() async {
    var uri = Uri.parse('https://miventanilla.palmarescorocora.com/residencia/movil/enviar');
    var request = http.MultipartRequest('POST', uri);
    request.fields['documento'] = documento;
    request.fields['numero'] = numero.text;
    request.fields['nombre'] = nombre.text;
    request.fields['correo'] = correo.text;
    request.fields['direccion'] = direccion.text;
    request.fields['celular'] = celular.text;
    request.files.add(await http.MultipartFile.fromPath('archivo', _files!.first.path.toString()));
    var response = await request.send();
    final codigo = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      status = '200';
    } else {
      status = 'error';
    }
    print(response.statusCode);
    return codigo;
  }

  void _openFileExplorer() async {
    _files = (await FilePicker.platform.pickFiles(type: FileType.custom, allowMultiple: false, allowedExtensions: ['pdf']))!.files;

    print('Loaded file path is : ${_files!.first.path}');
  }

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
              const CustomCard(imageUrl: 'https://miventanilla.palmarescorocora.com/img/head.jpg'),
              const CustomContainer(titulo: '1. Datos Basicos'),
              DropDown(),
              PadddingIpnut(
                  input: CustomInput(
                campo: 'Numero identificacíon',
                icono: Icons.badge,
                alerta: 'Escriba su número de documento',
                teclado: TextInputType.number,
                controller: numero,
              )),
              PadddingIpnut(
                  input: CustomInput(
                campo: 'Nombre completo',
                icono: Icons.person,
                alerta: 'Escriba su nombre',
                controller: nombre,
              )),
              PadddingIpnut(
                  input: CustomInput(
                campo: 'Correo electronico',
                icono: Icons.email,
                alerta: 'Escriba su correo',
                teclado: TextInputType.emailAddress,
                controller: correo,
              )),
              PadddingIpnut(
                  input: CustomInput(
                campo: 'Dirección',
                icono: Icons.house,
                alerta: 'Escriba su dirección',
                controller: direccion,
              )),
              PadddingIpnut(
                  input: CustomInput(
                campo: 'Celular',
                icono: Icons.phone_android,
                alerta: 'Escriba su numero de celular',
                teclado: TextInputType.phone,
                controller: celular,
              )),
              Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0, bottom: 30.0),
                  child: Text(
                    'Autorizo de manera voluntaria, previa, explícita, informada e inequívoca a la Alcaldía Municipal de Puerto López para tratar mis datos personales de acuerdo con su Política de Tratamiento de Datos Personales para los fines relacionados con su objeto social y en especial para fines legales, contractuales, misionales descritos en la Política de Tratamiento de Datos Personales y la Ley 1581.',
                    textAlign: TextAlign.justify,
                  )),
              const CustomContainer(titulo: '2. Adjuntar Documentos'),
              Padding(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Text(
                    'Los documentos de soporte para la presente solicitud deben ser legibles y estar escaneados en un solo archivo PDF.',
                    textAlign: TextAlign.justify,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        primary: AppTheme.white,
                        elevation: 0,
                        side: BorderSide(
                          color: Colors.grey.shade300,
                        )),
                    onPressed: () {
                      _openFileExplorer();
                    },
                    label: Text(
                      'Selecionar archivo',
                      style: TextStyle(color: AppTheme.black),
                    ),
                    icon: Icon(
                      Icons.attach_file,
                      color: AppTheme.primary,
                    ),
                  ),
                ),
              ),
              // input(const CustomInput(campo: 'Soportes', icono: Icons.attach_file, alerta: 'Seleccione el archivo PDF')),
              SizedBox(
                height: 30,
              ),
              const CustomContainer(titulo: '3. Formalizar Solicitud'),
              Padding(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Text(
                    'Certifico que toda la información y documentos suministrados son reales, así mismo que tengo conocimiento acerca del Decreto 030 de 2021 de la Alcaldía Municipal de Puerto López y el Decreto 1158 de 2019 del Ministerio del Interior. Los cuales reglamentan la expedición de certificados de residencia.',
                    textAlign: TextAlign.justify,
                  )),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: ElevatedButton(
                    onPressed: () {
                      _solicitar().then((respuesta) {
                        String solicitud = respuesta;
                        if (status == '200') {
                          _showDialog(context, solicitud);
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), padding: EdgeInsets.symmetric(vertical: 10.0)),
                    child: SizedBox(
                      width: double.infinity,
                      // height: 30.0,
                      child: Text(
                        'Enviar',
                        style: TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
              SizedBox(
                height: 30.0,
              )
            ],
          ),
        ));
  }

  Padding DropDown() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
        left: 20.0,
        right: 20.0,
      ),
      child: DropdownButtonFormField<String>(
        hint: Text('Tipo de Documento'),
        iconEnabledColor: AppTheme.primary,
        focusColor: AppTheme.primary,
        items: [
          DropdownMenuItem(value: '1', child: Text('Cedula de Cuidadanía')),
          DropdownMenuItem(value: '2', child: Text('Cedula de Extrajería')),
        ],
        onChanged: (value) {
          documento = value.toString();
          print(documento);
        },
      ),
    );
  }

  void _showDialog(BuildContext context, String solicitud) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Icon(
                Icons.check,
                color: Colors.green,
                size: 65.0,
              ),
              SizedBox(
                height: 30,
                child: Text('Solicitud enviada'),
              )
            ]),
          ),
          content: Text(
            'Su codigo es $solicitud',
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Ok',
                  style: TextStyle(color: AppTheme.primary),
                ))
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },
    );
  }
}
