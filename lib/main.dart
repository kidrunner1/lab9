import 'package:flutter/material.dart';

import 'Screens/display.dart';
import 'Screens/from_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 2,
        child: Scaffold(
          body: TabBarView(children: [FormScreen(), DisplayScreen()]),
          bottomNavigationBar: TabBar(tabs: [
            Tab(
              text: 'บันทึกอุณหภูมิ',
            ),
            Tab(
              text: 'รายชื่อนักเรียน',
            )
          ]),
          backgroundColor: Colors.blue,
        ));
  }
}
