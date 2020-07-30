import 'package:flutter/material.dart';

Widget descripcionCard(String descripcion) => Container(
      color: Colors.white12,
      child: Row(
        children: <Widget>[
          Divider(
            height: 20,
          ),
          Text(
            'Tipo : ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
                height: 2),
          ),
          Text(
            descripcion,
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                height: 2.5,
                letterSpacing: 4),
          )
        ],
      ),
    );
