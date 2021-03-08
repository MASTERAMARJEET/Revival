import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

_showUnavailableDialog(BuildContext context) {
  String message =
      "The Registration form in not available on this date. Please try in a few days";
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text("Form Unavailable"),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}

Future<void> _launchLink(String url, String error) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw error;
  }
}

bool _linkPresent(String link) {
  if (link.length > 0) {
    return true;
  }
  return false;
}

class RegisterBtn extends StatelessWidget {
  final String link;
  RegisterBtn(this.link);

  @override
  Widget build(BuildContext context) {
    return _linkPresent(link)
        ? FloatingActionButton.extended(
            onPressed: () {
              _launchLink(link, "Couldn't load form");
            },
            label: Text(
              'Register',
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
          )
        : FloatingActionButton.extended(
            onPressed: () => _showUnavailableDialog(context),
            label: Text(
              'Register',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.grey[900],
              ),
            ),
            backgroundColor: Colors.grey,
          );
  }
}
