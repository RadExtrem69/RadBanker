import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:radbanker/screens/transactions.dart';
import 'package:url_launcher/url_launcher.dart';
import '../databasehelper.dart';
import 'amount.dart';
import 'homepage.dart';


class User extends StatefulWidget {
  final int bankerid;
  final int balance;
  final String bankername;
  final String url;
  final String email;
  const User({Key? key, required this.bankerid, required this.balance, required this.bankername, required this.url, required this.email}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}
final Uri _url = Uri.parse('https://radextrem69.github.io/');
var mone = 0;
class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: TextButton(
                      child: Text(
                        'Back',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Center(
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                    child: TextButton(
                      child: Text(
                        'About',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey
                        ),
                      ),
                      onPressed: _launchUrl,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 30,),
              Container(
                height: 200,
                child: CircleAvatar(
                  backgroundImage: NetworkImage('${widget.url}'),
                  radius: 220,
                ),

              ),
              SizedBox(height: 20,),
              Text('${widget.bankername}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              Text('E-Mail: ${widget.email}'),
              Text('Balance: ${widget.balance}'),
              SizedBox(height: 20,),
              Container(
                height: 45,
                width: 200,
                child: ElevatedButton(
                  onPressed:() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Trans(bankerid: widget.bankerid, bankername: widget.bankername, balance: widget.balance, )));
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
                    'Transfer Money',
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
                    Navigator.pop(context);
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
                    'Back',
                    style: TextStyle(
                        fontSize:17,
                        color: Colors.white
                    ),
                  ),

                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 150,
                child: Center(
                    child: Image.asset('assets/logo.png')
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

void _launchUrl() async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}