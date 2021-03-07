import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/images/logo.png',
            scale: 2,
            fit: BoxFit.contain,
          ),
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
              onTap: () => Navigator.popAndPushNamed(context, '/events'),
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
          Positioned(
            right: 40.0,
            bottom: 20.0,
            child: Image.asset(
              'assets/images/slashdot.png',
              height: 20.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.1,
              right: width * 0.1,
              top: height * 0.05,
              bottom: height * 0.1,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset('assets/images/pheonix.png'),
                ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/events'),
                    child: Text('Explore'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
