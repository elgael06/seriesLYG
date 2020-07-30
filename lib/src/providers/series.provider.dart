import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:seriesLYG/src/models/capitilo_model.dart';
import 'package:seriesLYG/src/models/serie_model.dart';

class SeriesProvider with ChangeNotifier {
  final _api = 'https://apiserieslyg.herokuapp.com/api/';
  List<SerieModel> seriesList = [];
  List<SerieModel> nuevasSeries = [];
  SerieModel serieSelection = new SerieModel();

  List<CapitulosModel> capitulosList = [];
  CapitulosModel capituloSelection = new CapitulosModel();

  void removerLista() {
    seriesList = [];
    nuevasSeries = [];
    notifyListeners();
  }

  Future<List<SerieModel>> fetchSeries() async {
    try {
      var res = await http.get(_api + 'series');

      if (res.statusCode == 200) {
        List<dynamic> deserianlizador = jsonDecode(res.body.toString());

        for (var item in deserianlizador) {
          SerieModel dato = new SerieModel();
          dato.id = item['id'];
          dato.descripcion = item['descripcion'];
          dato.capitulos = item['capitulos'];
          dato.estatus = item['estatus'];
          dato.nombre = item['nombre'];
          dato.portada = item['portada'];
          dato.capitulos = item['capitulos'];
          dato.tipo = item['tipo'];

          seriesList.add(dato);
        }
        notifyListeners();
      }
    } catch (err) {
      print(err);
    }

    return seriesList;
  }

  Future<List<SerieModel>> fetchSeriesNuevas() async {
    try {
      var res = await http.get(_api + 'series');

      if (res.statusCode == 200) {
        List<dynamic> deserianlizador = jsonDecode(res.body.toString());

        for (var item in deserianlizador) {
          SerieModel dato = new SerieModel();
          dato.id = item['id'];
          dato.descripcion = item['descripcion'];
          dato.capitulos = item['capitulos'];
          dato.estatus = item['estatus'];
          dato.nombre = item['nombre'];
          dato.portada = item['portada'];
          dato.capitulos = item['capitulos'];
          dato.tipo = item['tipo'];

          seriesList.add(dato);
        }
        notifyListeners();
      }
    } catch (err) {
      print(err);
    }

    return seriesList;
  }
}
