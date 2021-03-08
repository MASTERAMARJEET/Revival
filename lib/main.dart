import 'package:flutter/material.dart';

import './pages/about_page.dart';
import './pages/events_page.dart';
import './pages/faq_page.dart';
import './pages/home_page.dart';
import './pages/schedule_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
      routes: {
        '/home': (BuildContext context) => HomePage(),
        '/events': (BuildContext context) => EventsPage(),
        '/about': (BuildContext context) => AboutPage(),
        '/schedule': (BuildContext context) => SchedulePage(),
        '/faq': (BuildContext context) => FaqPage(),
      },
    );
  }
}
