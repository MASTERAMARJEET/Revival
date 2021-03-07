// import 'dart:ui';

import 'package:flutter/material.dart';
import './details.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final events = [
      'ARTICULATE',
      'MELA QUIZ',
      'CAPTURE IT',
      'PANDEMONIUM',
      'CICADA',
      'PICOMIX',
      'LAZARUS',
      'POETRY SLAM',
      'MANTHAN',
      'TRASHION',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/images/logo.png',
            scale: 2,
            fit: BoxFit.contain,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.cyan[100],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.cyan[200],
              ),
              child: Image.asset('assets/images/logo.png'),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Events'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('About Us'),
              onTap: () => Navigator.popAndPushNamed(context, '/about'),
            ),
            ListTile(
              enabled: false,
              leading: Icon(Icons.event_note),
              title: Text('Schedule'),
            ),
            ListTile(
              enabled: false,
              leading: Icon(Icons.question_answer),
              title: Text('FAQ'),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 20.0,
              bottom: 45.0,
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                crossAxisCount: 2,
              ),
              itemCount: events.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(events[index]),
                    ),
                  ).then((value) => null),
                  child: Card(
                    color: Color.fromRGBO(122, 204, 252, 1),
                    child: Center(
                      child: Text(
                        events[index],
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            right: 40.0,
            bottom: 20.0,
            child: Image.asset(
              'assets/images/slashdot.png',
              height: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
