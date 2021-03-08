import 'package:flutter/material.dart';

void _goToPage(BuildContext context, String routeName) {
  String? currentRoute = ModalRoute.of(context)?.settings.name;
  if (currentRoute == routeName) {
    Navigator.pop(context);
  } else {
    Navigator.popAndPushNamed(context, routeName);
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            onTap: () => _goToPage(context, '/events'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('About Us'),
            onTap: () => _goToPage(context, '/about'),
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
    );
  }
}
