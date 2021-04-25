import 'package:flutter/material.dart';

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
        fontFamily: 'Barlow',
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final double targetElevation = 3;
  double _elevation = 0;
  ScrollController _controller;

  void _scrollListener() {
    double newElevation = _controller.offset > 1 ? targetElevation : 0;
    if (_elevation != newElevation) {
      setState(() {
        _elevation = newElevation;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.removeListener(_scrollListener);
    _controller?.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Color.fromRGBO(10, 173, 59, 1),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.0),
          child: AppBar(
            elevation: _elevation,
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            title: Text(widget.title,
                style: TextStyle(fontFamily: 'Barlow', color: Colors.black)),
          ),
        ),
        body: SingleChildScrollView(
          controller: _controller,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                  style: TextStyle(fontFamily: 'Barlow'),
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
