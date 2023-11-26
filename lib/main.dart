import 'package:flutter/material.dart';
import 'package:pro1/homelist.dart';
import 'package:pro1/giros.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MyHomePage(title: ''),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _Ind = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeListt(),
    const Girosk(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _Ind = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _widgetOptions.elementAt(_Ind),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation),
            label: 'GeoLocation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.android),
            label: 'Gyroscope',
          )
        ],
        currentIndex: _Ind,
        selectedItemColor: Colors.white54,
        onTap: _onItemTapped,
      ),
    );
  }
}