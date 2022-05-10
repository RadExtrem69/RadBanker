import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:radbanker/screens/success.dart';
import '../databasehelper.dart';
import 'amount.dart';
import 'homepage.dart';


class Select extends StatefulWidget {
  final int bankerid;
  final String bankername;
  final int amount;
  final int balance;
  const Select({Key? key, required this.bankerid, required this.bankername, required this.balance,required this.amount}) : super(key: key);

  @override
  _SelectState createState() => _SelectState();
}
var mone = 0;
class _SelectState extends State<Select> {
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
                        'Select',
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
              SizedBox(height: 10,),
              Container(
                height: 40,
                width: 250,
                child: Text('Select the user, who you\'d like to transfer money to',
                  style: TextStyle(fontSize: 17),),
              ),
              Container(
                height: 400,
                width: 350,
                child: FutureBuilder<List<Banker>>(
                    future: DatabaseHelper.instance.getBankere(widget.bankerid),
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
                                radius: 50,
                                backgroundImage: NetworkImage('${banker.pfp}'),
                                backgroundColor: Colors.grey.shade200,
                              ),
                              title: Text(banker.name),
                              subtitle: Text("Balance: ₹${banker.balance}"),
                              trailing: Text("User", style: TextStyle(color: Colors.grey),),
                              onTap: () async {
                                int lamaver = widget.amount + banker.balance;
                                int gemaver = widget.balance - widget.amount;
                                await DatabaseHelper.instance.updateData(amount: gemaver, name: '${widget.bankername}');
                                await DatabaseHelper.instance.updateData(amount: lamaver, name: '${banker.name}');
                                await DatabaseHelper.instance.addt(
                                    Transac(amount: widget.amount, sender: '${widget.bankername}', receiver: '${banker.name}',)
                                );
                                await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Success()),(Route<dynamic> route) => false );
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
