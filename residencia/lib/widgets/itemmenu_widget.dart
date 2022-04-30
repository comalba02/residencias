import 'package:flutter/material.dart';
import 'package:residencia/themes/app_theme.dart';

class MenuItem extends StatelessWidget {
  final String item;
  final String ruta;
  const MenuItem({Key? key, required this.item, required this.ruta})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: SizedBox(
        width: double.infinity,
        height: 35.0,
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, ruta);
            },
            style: ElevatedButton.styleFrom(
              primary: AppTheme.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            child: Text(
              item,
              style: TextStyle(color: AppTheme.black),
            )),
      ),
    );
  }
}
