import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../databasehelper.dart';
import 'amount.dart';
import 'homepage.dart';


class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  _TransactionsState createState() => _TransactionsState();
}
var mone = 0;
class _TransactionsState extends State<Transactions> {
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
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Center(
                      child: Text(
                        'Transactions',
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
                      onPressed: () async {},
                    ),
                  ),

                ],
              ),
              SizedBox(height: 30,),
              Container(
                height: 50,
                width: 345,
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white24,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),


                    ),
                    hintText: '     Search',
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 350,
                width: 350,
                child: FutureBuilder<List<Transac>>(
                    future: DatabaseHelper.instance.getTransac(),
                    builder: (BuildContext context, AsyncSnapshot<List<Transac>> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: Text('Loading..'));
                      }
                      return snapshot.data!.isEmpty
                          ? Center(child: Text('No data found, try RELOADING.'),)
                          : ListView(
                        children: snapshot.data!.map((trans) {
                          return Center(
                            child: ListTile(
                              title: Text('${trans.sender} -> ${trans.receiver}'),
                              subtitle: Text("Amount: ₹${trans.amount}"),
                              onTap: () {
                                print('${trans.id}');
                              },
                            ),
                          );
                        }).toList(),
                      );
                    }
                ),
              ),
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
