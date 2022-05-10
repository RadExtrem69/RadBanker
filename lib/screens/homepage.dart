import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radbanker/screens/transactions.dart';
import 'package:url_launcher/url_launcher.dart';

import 'customers.dart';
final Uri _url = Uri.parse('https://radextrem69.github.io/');
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              height: 240,
              child: Center(
                  child: Image.asset('assets/logo.png')
              ),
            ),
            SizedBox(height: 20,),
            Text('A Simple Banking App.', style: TextStyle(fontSize: 20),),
            SizedBox(height: 60,),
            Container(
              height: 45,
              width: 200,
              child: ElevatedButton(
                onPressed:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => People()));
                } ,
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),

                        )
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.black)
                ),
                child: Text(
                  'Find People',
                  style: TextStyle(
                    fontSize:17,
                    color: Colors.white
                  ),
                ),

              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 45,
              width: 200,
              child: ElevatedButton(
                onPressed:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Transactions()));
                } ,
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),

                        )
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.black)
                ),
                child: Text(
                  'Transactions',
                  style: TextStyle(
                      fontSize:17,
                      color: Colors.white
                  ),
                ),

              ),
            ),


          ],
        ),
      ),
    );
  }
}
void _launchUrl() async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}