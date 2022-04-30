import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imageUrl;

  const CustomCard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      child: FadeInImage(
        image: NetworkImage(imageUrl),
        placeholder: AssetImage('assets/gobiernosano.gif'),
        fit: BoxFit.cover,
        width: double.infinity,
        height: 150,
      ),
    );
  }
}
