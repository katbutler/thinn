import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thinn/theme.dart';

import 'card_view.dart';

void main() => runApp(ThinnTheme(
      data: ThinnThemeData(),
      child: ThinnApp(),
    ));

class ThinnApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thinn',
      theme: buildThinnTheme(),
      home: ThinnHomePage(title: 'Thinn'),
    );
  }
}

class ThinnHomePage extends StatefulWidget {
  ThinnHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ThinnHomePageState createState() => _ThinnHomePageState();
}

class _ThinnHomePageState extends State<ThinnHomePage> {
  void _scanBarcode() {
    debugPrint("Scan Barcode not yet implemented");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12.0),
              child: Image.asset("assets/images/logo/wallet.png"),
            ),
            Container(
              child: Text(widget.title),
            ),
          ],
        ),
      ),
      body: CardView(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          onPressed: _scanBarcode,
          tooltip: 'Increment',
          child: Icon(FontAwesomeIcons.barcode),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
