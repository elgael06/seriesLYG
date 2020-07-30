import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seriesLYG/src/providers/series.provider.dart';
import 'package:seriesLYG/src/routes/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            builder: (context) => SeriesProvider(),
          )
        ],
        child: MaterialApp(
          title: 'Series LYG',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // Define the default brightness and colors.
            brightness: Brightness.dark,
            primaryColor: Colors.lightBlue[800],
            accentColor: Colors.cyan[600],

            // Define the default font family.
            fontFamily: 'Georgia',
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
            ),
          ),
          initialRoute: 'home',
          routes: getRoutes(),
        ));
  }
}
