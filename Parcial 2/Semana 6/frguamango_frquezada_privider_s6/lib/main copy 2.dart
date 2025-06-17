import 'package:flutter/material.dart';

void main() => runApp(MyTabsApp());

class MyTabsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppBar con Tabs',
      home: DefaultTabController(
        length: 3, // Número de pestañas
        child: Scaffold(
          appBar: AppBar(
            title: Text('AppBar con pestañas'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car), text: 'Auto'),
                Tab(icon: Icon(Icons.directions_transit), text: 'Transporte'),
                Tab(icon: Icon(Icons.directions_bike), text: 'Bici'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('Contenido Auto')),
              Center(child: Text('Contenido Transporte')),
              Center(child: Text('Contenido Bici')),
            ],
          ),
        ),
      ),
    );
  }
}
