import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radbanker/screens/select.dart';

import '../databasehelper.dart';

class Trans extends StatefulWidget {
  final int bankerid;
  final int balance;
  final String bankername;
  const Trans(
      {Key? key,
      required this.bankerid,
      required this.bankername,
      required this.balance})
      : super(key: key);
  @override
  _TransState createState() => _TransState();
}

class _TransState extends State<Trans> {
  TextEditingController _amounter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: TextButton(
                      child: Text(
                        'Back',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
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
                        'Transfer',
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
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      onPressed: () async {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 45,
              ),
              Container(
                height: 60,
                width: 345,
                child: Text(
                  'Welcome to the Amount tranfer page. Enter the amount of money, you\'d like to transfer.',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Container(
                height: 100,
                width: 345,
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    isDense: false,
                    labelText: 'Enter in ₹',
                    fillColor: Colors.white24,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    hintText: 'Amount',
                  ),
                  controller: _amounter,
                ),
              ),
              Container(
                height: 60,
                width: 345,
                child: Text(
                  'Make sure that, your transfer amount is lesser than your balance.',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Text(
                'Balance',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 100,
                width: 350,
                child: FutureBuilder<List<Banker>>(
                    future: DatabaseHelper.instance.getBanker(widget.bankerid),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Banker>> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: Text('Loading..'));
                      }
                      return snapshot.data!.isEmpty
                          ? Center(
                              child: Text('No data found, try RELOADING.'),
                            )
                          : ListView(
                              children: snapshot.data!.map((banker) {
                                return Center(
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 50,
                                      backgroundImage:
                                          NetworkImage('${banker.pfp}'),
                                      backgroundColor: Colors.grey.shade200,
                                    ),
                                    title: Text(banker.name),
                                    subtitle:
                                        Text("Balance: ₹${banker.balance}"),
                                    trailing: Text(
                                      "User",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    onTap: () {
                                      print('${banker.id}');
                                    },
                                  ),
                                );
                              }).toList(),
                            );
                    }),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 45,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    print('He tried');
                    if (bankbalanceCheck(
                            int.parse(_amounter.text), widget.balance) ==
                        0) {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (_) => AlertDialog(
                                title: Text("Not Enough"),
                                content: Text("You don\' have enough balance."),
                              ));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Select(
                                    bankerid: widget.bankerid,
                                    bankername: widget.bankername,
                                    balance: widget.balance,
                                    amount: int.parse(_amounter.text),
                                  )));
                    }
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )),
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

int bankbalanceCheck(a, b) {
  if (a >= b) {
    return 0;
  } else {
    return 1;
  }
}
