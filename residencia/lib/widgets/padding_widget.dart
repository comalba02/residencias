import 'package:flutter/material.dart';
import 'package:residencia/widgets/input_widget.dart';

class PadddingIpnut extends StatelessWidget {
  final CustomInput input;
  const PadddingIpnut({Key? key, required this.input}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 30.0,
          left: 20.0,
          right: 20.0,
        ),
        child: input);
  }
}
