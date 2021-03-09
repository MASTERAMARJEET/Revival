import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../handle_link.dart';
import '../revival/revival_model.dart';
import '../revival/revival_services.dart';

TextSpan _socialMedia(String name, String link) {
  if (link.length > 0) {
    return TextSpan(
        text: ' ' + name,
        style: TextStyle(color: Colors.deepPurple),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            launchLink(link, "Couldn't open $name");
          });
  }
  return TextSpan(text: ' ' + name);
}

TextSpan _followText(RevivalDetail revivalDetail) {
  return TextSpan(
    style: TextStyle(fontWeight: FontWeight.bold),
    children: <TextSpan>[
      TextSpan(text: '...also follow us on'),
      _socialMedia('Instagram', revivalDetail.insta ?? ''),
      TextSpan(text: ' and'),
      _socialMedia('Facebook', revivalDetail.fb ?? ''),
      TextSpan(text: ' for constant updates'),
    ],
  );
}

List<TextSpan> _paraList(RevivalDetail revivalDetail) {
  if (revivalDetail.about!.length > 1) {
    List<TextSpan>? list =
        revivalDetail.about?.map((e) => TextSpan(text: e + '\n\n')).toList();
    list?.remove(list.last);
    list?.add(_followText(revivalDetail));
    return list!;
  }
  return List<TextSpan>.empty();
}

class AboutWidget extends StatefulWidget {
  @override
  _AboutWidgetState createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  RevivalDetail? _revivalDetail;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    loadRevivalDetail('assets/data/revival_details.json').then(
      (value) => setState(
        () {
          _revivalDetail = value;
          _loaded = true;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 30.0,
        right: 30.0,
        top: 30.0,
        bottom: 45.0,
      ),
      child: _loaded
          ? ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Text(
                    "About Revival".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  strutStyle: StrutStyle(height: 1.4),
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    children: _paraList(_revivalDetail!),
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
