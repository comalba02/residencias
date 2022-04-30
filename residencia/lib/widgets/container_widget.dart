import 'package:flutter/material.dart';
import 'package:residencia/themes/app_theme.dart';

class CustomContainer extends StatelessWidget {
  final String titulo;
  const CustomContainer({Key? key, required this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      color: AppTheme.primary,
      child: Text(
        titulo,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    );
  }
}
