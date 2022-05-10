import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';



class Banker {
  final int? id;
  final String name;
  final int balance;
  final String email;
  final String pfp;

  Banker( {this.id, required this.balance,required this.email, required this.name, required this.pfp });

  factory Banker.fromMap(Map<String, dynamic> json) => new Banker(
        id: json['id'],
        name: json['name'],
        balance: json['balance'],
        email: json['email'],
        pfp: json['pfp'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'balance': balance,
      'email' : email,
      'pfp' : pfp,
    };
  }
}

class Transac {
  final int? id;
  final String sender;
  final String receiver;
  final int amount;

  Transac( {this.id, required this.sender,required this.receiver, required this.amount});

  factory Transac.fromMap(Map<String, dynamic> json) => new Transac(
    id: json['id'],
    sender: json['sender'],
    receiver: json['receiver'],
    amount: json['amount'],
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sender': sender,
      'receiver': receiver,
      'amount' : amount,
    };
  }
}

class DatabaseHelper{
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'lamaver.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async{
    await db.execute(
      '''CREATE TABLE bankers(
        id INTEGER PRIMARY KEY,
        name TEXT,
        email TEXT,
        balance INTEGER,
        pfp TEXT
      );''');
    await db.execute(
        '''CREATE TABLE trans(
        id INTEGER PRIMARY KEY,
        sender TEXT,
        receiver TEXT,
        amount INTEGER
      );''');

    print('gello');
    DatabaseHelper.instance.add(
        Banker(id: 1,balance: 74000, email: 'emu@gmail.com', name: 'Emayan', pfp: 'https://cdn.discordapp.com/attachments/769801459352862771/972115992396312586/unknown.png')
    );
    print('hello');
    DatabaseHelper.instance.add(
        Banker(id: 2,balance: 1000000, email: 'madoka@gmail.com', name: 'Vamsi', pfp: 'https://cdn.discordapp.com/attachments/769801459352862771/972118597746970634/unknown.png')
    );
    DatabaseHelper.instance.add(
        Banker(id: 3,balance: 96432, email: 'vachaas@gmail.com', name: 'Bonala', pfp: 'https://cdn.discordapp.com/attachments/769801459352862771/972116757911314502/unknown.png')
    );
    DatabaseHelper.instance.add(
        Banker(id: 4,balance: 69000, email: 'strawhats@gmail.com', name: 'Luffy', pfp: 'https://cdn.discordapp.com/attachments/769801459352862771/972118754790096986/unknown.png')
    );
    DatabaseHelper.instance.add(
        Banker(id: 5,balance: 10000, email: 'niyasrad@gmail.com', name: 'Rad', pfp: 'https://media.discordapp.net/attachments/769801459352862771/886536996955226133/default_256_256.png')
    );
    DatabaseHelper.instance.add(
        Banker(id: 6,balance: 10000, email: 'panner@gmail.com', name: 'Noctis', pfp: 'https://images-ext-2.discordapp.net/external/itjoWE4oYiBH1mrPvWOlzw6_91MTAPj5WV53Vv37sqY/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/404540157262430220/78966e548ac63f678fd02cc7ec322d05.png')
    );
    DatabaseHelper.instance.add(
        Banker(id: 7,balance: 10000, email: 'sadder@gmail.com', name: 'Gongaga', pfp: 'https://i.ytimg.com/vi/Wygvei9lSx4/maxresdefault.jpg')
    );
    DatabaseHelper.instance.add(
        Banker(id: 8,balance: 10000, email: 'smaildanger@gmail.com', name: 'Yuna', pfp: 'https://i1.sndcdn.com/artworks-000235560046-nugn0j-t500x500.jpg')
    );
    DatabaseHelper.instance.add(
        Banker(id: 9,balance: 10000, email: 'linustechtips@gmail.com', name: 'Rando', pfp: 'https://images-ext-1.discordapp.net/external/5HdVSgNJB5Vy1M6Yk2vQ9agmRBlJJPWRTtpq4s7AYiU/%3Fsize%3D1024/https/cdn.discordapp.com/avatars/834327117554384956/737b0d2f9bd7bb03477f1a29d35b0ad9.png')
    );
    DatabaseHelper.instance.add(
        Banker(id: 10,balance: 10000, email: 'hiro@gmail.com', name: 'Hiro', pfp: 'https://static.wikia.nocookie.net/topstrongest/images/0/04/889fef387bf4d4cbf707529d0083569d.jpg/revision/latest?cb=20170304094222')
    );

  }

  Future<List<Banker>> getBankers() async{

    Database db = await instance.database;
    var bankers = await db.query('bankers', orderBy: 'name');
    List<Banker> bankerList = bankers.isNotEmpty
      ? bankers.map((c) => Banker.fromMap(c)).toList()
        : [];
      return bankerList;
  }
  Future<List<Transac>> getTransac() async{

    Database db = await instance.database;
    var trans = await db.query('trans', orderBy: 'id');
    List<Transac> transList = trans.isNotEmpty
        ? trans.map((c) => Transac.fromMap(c)).toList()
        : [];
    return transList;
  }
  Future<List<Banker>> getBanker(id) async{

    Database db = await instance.database;
    var bankers = await db.query('bankers', where: 'id = ?', whereArgs: [id]);
    List<Banker> bankerList = bankers.isNotEmpty
        ? bankers.map((c) => Banker.fromMap(c)).toList()
        : [];
    return bankerList;
  }

  Future<List<Banker>> getBankere(id) async{

    Database db = await instance.database;
    var bankers = await db.query('bankers', where: 'id <> ?', whereArgs: [id]);
    List<Banker> bankerList = bankers.isNotEmpty
        ? bankers.map((c) => Banker.fromMap(c)).toList()
        : [];
    return bankerList;
  }

  Future<int> add(Banker banker) async{
    Database db = await instance.database;
    return await db.insert('bankers', banker.toMap());
  }

  Future<int> addt(Transac trans) async{
    Database db = await instance.database;
    return await db.insert('trans', trans.toMap());
  }

  Future<int> updateData({required String name, required int amount}) async{
    Database db = await instance.database;
    return await db.rawUpdate('UPDATE bankers SET balance = ? WHERE name = ?', ['${amount}', '${name}']);

  }


}