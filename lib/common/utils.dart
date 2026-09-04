import 'package:url_launcher/url_launcher.dart';

void makingCall(String tel) async {
  final Uri launchUri = Uri(scheme: 'tel', path: tel);
  launchUrl(launchUri);
}
