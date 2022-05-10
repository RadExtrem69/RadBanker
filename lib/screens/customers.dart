import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:radbanker/screens/user.dart';
import '../databasehelper.dart';
import 'amount.dart';
import 'homepage.dart';


class People extends StatefulWidget {
  const People({Key? key}) : super(key: key);

  @override
  _PeopleState createState() => _PeopleState();
}
var mone = 0;
class _PeopleState extends State<People> {
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
                        'People',
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
                      onPressed: () async {}
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
                child: FutureBuilder<List<Banker>>(
                  future: DatabaseHelper.instance.getBankers(),
                  builder: (BuildContext context, AsyncSnapshot<List<Banker>> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: Text('Loading..'));
                    }
                    return snapshot.data!.isEmpty
                    ? Center(child: Text('No data found, try RELOADING.'),)
                    : ListView(
                      children: snapshot.data!.map((banker) {
                        return Center(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage('${banker.pfp}'),
                              backgroundColor: Colors.grey.shade200,
                            ),
                            title: Text(banker.name),
                            subtitle: Text("Balance: ₹${banker.balance}"),
                            trailing: Text("Active", style: TextStyle(color: Colors.grey),),
                            onTap: () {
                              print('${banker.id}');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => User(bankerid: banker.id!, bankername: banker.name, balance: banker.balance, url: banker.pfp, email: banker.email )));
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
