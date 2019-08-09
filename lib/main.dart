import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whole Year In a Page',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int daysCount;
  DateTime today;
  int todayDays;
//  List<Color> bgColorForMonth = []
  Color colorForToday = Color.fromARGB(255, 56, 198, 182);
  Color colorForPast = Color.fromARGB(255, 39, 52, 61);
  Color colorForFuture = Color.fromARGB(255, 145, 158, 167);

  Color borderColorForPast = Color.fromARGB(255, 47, 61, 72);
  Color borderColorForFuture = Color.fromARGB(255, 47, 61, 72);
  Color borderColorForToday = Color.fromARGB(255, 47, 61, 72);

  int _crossAxisCount = 15;

  @override
  void initState() {
    today = DateTime.now();
//    today = DateTime(2019, 1, 35);
    daysCount = DateTime(today.year + 1, 1, 1)
        .difference(DateTime(today.year, 1, 1))
        .inDays;
    todayDays = today.difference(DateTime(today.year, 1, 1)).inDays;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(28.0),
        child: AppBar(
          title: Text(
            'Today is day $todayDays of the year',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: _crossAxisCount,
          childAspectRatio: 1.0,
          padding: const EdgeInsets.all(4.0),
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          children: List<GridTile>.generate(
            daysCount,
            (index) {
              Color bgColor = colorForPast;
              Color borderColor = borderColorForPast;

              if (index == todayDays) {
                bgColor = colorForToday;
                borderColor = borderColorForToday;
              } else if (index > todayDays) {
                borderColor = borderColorForFuture;
                bgColor = colorForFuture;
              }

              return GridTile(
                child: Container(
                  decoration: BoxDecoration(
                    color: bgColor,
                    border: Border.all(color: borderColor),
                  ),
                  child: index == todayDays
                      ? Center(
                          child: Text(
                            '${todayDays + 1}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              color: Color.fromARGB(255, 47, 61, 72),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : null,
                ),
              );
            },
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
