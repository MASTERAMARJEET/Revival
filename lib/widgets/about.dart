import 'package:flutter/material.dart';

import '../revival/revival_model.dart';
import '../revival/revival_services.dart';

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
                  strutStyle: StrutStyle(height: 1.35),
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    children: _revivalDetail?.about
                        ?.map((e) => TextSpan(text: e + '\n\n'))
                        .toList(),
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
