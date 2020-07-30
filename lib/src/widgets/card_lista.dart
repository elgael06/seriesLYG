import 'package:flutter/material.dart';
import 'package:seriesLYG/src/models/serie_model.dart';
import 'package:seriesLYG/src/widgets/descripcion_card.dart';

Widget cardLista(SerieModel item, List<Widget> acciones) => Positioned(
      top: 10,
      left: 10,
      right: 10,
      bottom: 10,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.black87,
        ),
        child: Column(
          children: <Widget>[
            Text(
              item.nombre,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                height: 2,
              ),
            ),
            descripcionCard(item.descripcion),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: acciones)
          ],
        ),
      ),
    );
