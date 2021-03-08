import 'package:url_launcher/url_launcher.dart';

Future<void> launchLink(String url, String error) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw error;
  }
}
