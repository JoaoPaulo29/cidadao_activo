import 'package:flutter/material.dart';

class TitleArea extends StatelessWidget {
  final String titulo;
  final String font;
  final FontWeight fontWeight;
  final double fontSizes;
  final Color color;

  const TitleArea(
      {super.key,
      required this.titulo,
      required this.font,
      required this.fontWeight,
      required this.fontSizes,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(35, 12, 0, 0),
      child: Text(
        titulo,
        style: TextStyle(
          color: color,
          fontFamily: font,
          fontSize: fontSizes,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
