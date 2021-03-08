import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../event/event_model.dart';

Future<void> _launchLink(String url, String error) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw error;
  }
}

TextSpan _nameText(String name) {
  if (name.length > 0) {
    return TextSpan(text: name);
  }
  return TextSpan(text: '');
}

TextSpan _phoneText(String phone) {
  if (phone.length > 0) {
    return TextSpan(
        text: ' ' + phone,
        style: TextStyle(color: Colors.deepPurple),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            _launchLink('tel:$phone', "Couldn't make call");
          });
  }
  return TextSpan();
}

TextSpan _instaText(String insta) {
  if (insta.length > 0) {
    return TextSpan(
        text: ' ' + insta,
        style: TextStyle(color: Colors.deepPurple),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            _launchLink(
                'https://www.instagram.com/$insta', "Couldn't open Instagram");
          });
  }
  return TextSpan();
}

TextSpan _mailText(String mail) {
  if (mail.length > 0) {
    return TextSpan(
        text: '\n' + mail,
        style: TextStyle(color: Colors.deepPurple),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            _launchLink('mailto:$mail', "Couldn't open Mail");
          });
  }
  return TextSpan();
}

TextSpan _displyContact(Contact contact) {
  return TextSpan(children: <TextSpan>[
    _nameText(contact.name ?? ''),
    _phoneText(contact.phone ?? ''),
    _instaText(contact.insta ?? ''),
    _mailText(contact.mail ?? ''),
    TextSpan(text: '\n\n'),
  ]);
}

class ContactWidget extends StatefulWidget {
  final String title;
  final List<Contact> list;
  ContactWidget(this.title, this.list);
  @override
  _ContactWidgetState createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.list.length == 0) {
      return Container();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 8.0,
          ),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              children: widget.list.map((e) => _displyContact(e)).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
