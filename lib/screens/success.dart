import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radbanker/screens/transactions.dart';

import 'customers.dart';
import 'homepage.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 80,),
            Container(
              height: 240,
              child: Center(
                  child: Image.asset('assets/logo1.png')
              ),
            ),
            SizedBox(height: 100,),
            Container(
              height: 45,
              width: 200,
              child: ElevatedButton(
                onPressed:() {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()), (Route<dynamic> route) => false);
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
                  'Home Screen',
                  style: TextStyle(
                      fontSize:17,
                      color: Colors.white
                  ),
                ),

              ),
            ),
            SizedBox(height: 30,),
            Container(
              height: 45,
              width: 200,
              child: ElevatedButton(
                onPressed:() {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Transactions()), (Route<dynamic> route) => false);
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
