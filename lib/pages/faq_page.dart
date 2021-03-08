import 'package:flutter/material.dart';

import '../handle_link.dart';
import '../widgets/base_scaffold.dart';

class FaqPage extends StatelessWidget {
  final String faqUrl = "https://revival.iiserkol.ac.in/assets/FAQ's.pdf";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "The FAQ's are available in form of PDF.",
                    textAlign: TextAlign.center,
                    strutStyle: StrutStyle(height: 2.5),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  ElevatedButton(
                    onPressed: () => launchLink(
                      faqUrl,
                      "Could not Download file",
                    ),
                    child: Text("Download"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
