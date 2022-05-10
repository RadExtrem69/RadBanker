import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:radbanker/screens/homepage.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
final Uri _url = Uri.parse('https://radextrem69.github.io/');
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
void _launchUrl() async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}