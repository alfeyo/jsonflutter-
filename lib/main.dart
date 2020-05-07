import 'package:flutter/material.dart';
import 'package:newjson/nested.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Jedi());
  }
}

class Jedi extends StatefulWidget {
  @override
  _JediState createState() => _JediState();
}

class _JediState extends State<Jedi> {
  Future<Severproducts> futureSeverproducts;

  @override
  void initState() {
    super.initState();
    futureSeverproducts = fetchSeverproducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyanAccent,
        ),
        body: FutureBuilder<Severproducts>(
          future: futureSeverproducts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.products);
              return Text(snapshot.data.products.toString());
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ));
  }
}
