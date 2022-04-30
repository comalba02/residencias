import 'package:flutter/material.dart';
import 'package:residencia/screens/screens.dart';

class AppRoutes {
  static const inicio = 'solicitud';
  static Map<String, Widget Function(BuildContext)> routes = {
    'consultar': (BuildContext context) => ConsultarScreen(),
    'solicitud': (BuildContext context) => SolicitudScreen(),
    'home': (BuildContext context) => const HomeScreen(),
  };
}
