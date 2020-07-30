import 'package:flutter/widgets.dart';
import 'package:seriesLYG/src/pages/home_page.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    'home': (BuildContext context) => HomePage(),
    'series': null,
    'peliculas': null,
    'capitulos': null,
    'videoPlayer': null,
  };
}
