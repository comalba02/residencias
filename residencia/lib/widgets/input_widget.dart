import 'package:flutter/material.dart';
import 'package:residencia/themes/app_theme.dart';

class CustomInput extends StatelessWidget {
  final String campo;
  final IconData icono;
  final String alerta;
  final TextInputType? teclado;
  final TextEditingController? controller;
  const CustomInput({Key? key, required this.campo, required this.icono, required this.alerta, this.teclado, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      keyboardType: teclado,
      cursorColor: AppTheme.primary,
      controller: controller,
      onChanged: (value) {
        print('value: $value');
      },
      validator: (value) {
        if (value == null) return 'Este campo es requerido';
        return value.length < 10 ? alerta : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: campo,
        suffixIcon: Icon(icono, color: AppTheme.primary),
      ),
    );
  }
}
