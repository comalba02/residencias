import 'package:flutter/material.dart';
import 'package:residencia/themes/theme.dart';
import 'package:residencia/widgets/widget.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppTheme.primary,
        child: Column(
          children: [
            Container(
                color: AppTheme.white,
                margin: const EdgeInsets.only(top: 37),
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: Image.asset('assets/escudo.jpg'),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Alcaldía de Puerto López - Meta',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ],
                )),
            SizedBox(height: 25.0),
            const MenuItem(
              item: 'Realizar Solicitud',
              ruta: 'solicitud',
            ),
            const SizedBox(height: 25.0),
            const MenuItem(
              item: 'Consultar Estado',
              ruta: 'consultar',
            )
          ],
        ),
      ),
    );
  }
}
