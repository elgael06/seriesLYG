import 'package:flutter/material.dart';

Widget imagenFondo(String url) => Positioned(
    top: 0,
    left: 0,
    right: 0,
    child: FadeInImage(
      placeholder: AssetImage('assets/img/loading2.gif'),
      image: NetworkImage(url),
      fadeInDuration: Duration(milliseconds: 800),
      height: 200,
      fit: BoxFit.cover,
    ));
