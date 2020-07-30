import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seriesLYG/src/models/serie_model.dart';
import 'package:seriesLYG/src/providers/series.provider.dart';
import 'package:seriesLYG/src/widgets/card_lista.dart';
import 'package:seriesLYG/src/widgets/imagen_fondo.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SeriesProvider _seriesProvider;
  @override
  Widget build(BuildContext context) {
    _seriesProvider = Provider.of<SeriesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Inicio.'),
          backgroundColor: Colors.black54,
          elevation: 5,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  print('menu');
                })
          ],
        ),
        body: Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 30),
            color: Colors.black26,
            child: RefreshIndicator(
                onRefresh: () => _pedirDatos(),
                child: ListView(
                  children: _listaMain(),
                ))));
  }

  Future _pedirDatos() async {
    print('pedir datos');
    await _seriesProvider.fetchSeries();
    print('listo');
  }

  List<Widget> _listaMain() {
    List<Widget> lista = [];
    lista.add(_rowMain('nuevas series', _vistaSeries()));
    lista.add(_rowMain('Todas las series', _vistaSeriesNuevas()));
    lista.add(_rowMain('Lista reproduccion', _vistaSeriesMiLista()));

    return lista;
  }

  Widget _rowMain(String title, Widget body) => Container(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _tituloLista(title),
            Container(
              height: 200,
              child: body,
            ),
          ],
        ),
      ));

  Widget _tituloLista(String titulo) => Container(
        margin: EdgeInsets.only(left: 25, top: 15, bottom: 0),
        child: Text(
          titulo,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      );

  Widget _vistaSeries() {
    return FutureBuilder<List<SerieModel>>(
        future: _seriesProvider.fetchSeries(),
        initialData: _vistaPrevia(),
        builder: (BuildContext context, snapshot) {
          return PageView(
            children: _crearLista(snapshot.data, context),
            scrollDirection: Axis.horizontal,
          );
        });
  }

  Widget _vistaSeriesNuevas() {
    return FutureBuilder<List<SerieModel>>(
        future: _seriesProvider.fetchSeriesNuevas(),
        initialData: _vistaPrevia(),
        builder: (BuildContext context, snapshot) {
          return PageView(
            children: _crearLista(snapshot.data, context),
            scrollDirection: Axis.horizontal,
          );
        });
  }

  Widget _vistaSeriesMiLista() {
    return FutureBuilder<List<SerieModel>>(
        future: _getMiLista(),
        initialData: _vistaPrevia(),
        builder: (BuildContext context, snapshot) {
          return PageView(
            children: _crearLista(snapshot.data, context),
            scrollDirection: Axis.horizontal,
          );
        });
  }

  Future<List<SerieModel>> _getMiLista() async {
    return _vistaPrevia();
  }

  List<SerieModel> _vistaPrevia() {
    List<SerieModel> lista = [];
    final model = new SerieModel();
    model.portada = 'https://static.impression.co.uk/2014/05/loading1.gif';
    model.nombre = 'Cargando';
    model.capitulos = 0;
    model.descripcion = 'NONE';
    lista.add(model);
    return lista;
  }

  List<Widget> _crearLista(List<SerieModel> data, BuildContext context) {
    List<Widget> lista = [];

    for (SerieModel item in data) {
      lista.add(Card(
        margin: EdgeInsets.all(20),
        child: _crearCard(item),
      ));
    }

    return lista;
  }

  Widget _crearCard(SerieModel item) {
    List<Widget> acciones = [];

    acciones
      ..add(Container(
        child: FlatButton(
          onPressed: () {},
          child: Text('Agregar a lista'),
          textColor: Colors.orange[200],
        ),
      ))
      ..add(FlatButton(
        onPressed: () {},
        child: Text('ver'),
        textColor: Colors.purple[100],
      ));

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Stack(
        children: <Widget>[
          imagenFondo(item.portada),
          cardLista(item, acciones),
        ],
      ),
    );
  }
}
