import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int daysCount;
  DateTime today;
  int todayDays;
//  List<Color> bgColorForMonth = []
  Color colorForOdd = Colors.white;
  Color colorForEven = Colors.grey;
  Color colorForToday = Colors.yellow;

  @override
  void initState() {
    // TODO: implement initState
    today = DateTime.now();
//    today = DateTime(2019, 1, 35);
    daysCount = DateTime(today.year + 1, 1, 1)
        .difference(DateTime(today.year, 1, 1))
        .inDays;
    todayDays = today.difference(DateTime(today.year, 1, 1)).inDays;
    print(today.day);
    print(daysCount);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Today is day $todayDays of the year'),
      ),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 15,
          childAspectRatio: 1.0,
          padding: const EdgeInsets.all(4.0),
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          children: List<GridTile>.generate(
            daysCount,
            (index) {
              Color bgColor = colorForOdd;
              if (index % 2 == 0) {
                bgColor = colorForEven;
              }
              if (index == todayDays) {
                bgColor = colorForToday;
              }

              return GridTile(
                child: Container(
                  decoration: BoxDecoration(
                    color: bgColor,
                    border: Border.all(color: Colors.blueAccent),
                  ),
                ),
              );
            },
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
