import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

TextStyle titlestyle = const TextStyle(
    color: Colors.white, fontSize: 17, overflow: TextOverflow.clip
    // fontWeight: FontWeight.bold,
    );
TextStyle contentstyle = const TextStyle(
  color: Colors.black,

  fontSize: 12,
  // fontWeight: FontWeight.bold,
);

class CalModel {
  late int id;
  late double price;
  late int receipt;
  late DateTime date;
  CalModel(this.id, this.price, this.receipt, this.date);
}

var now = DateTime.now();
var formatter = DateFormat('dd-MM-yyyy');
List<Map<String, dynamic>> calModel = [
  {
    "id": "1",
    "price": "205000",
    "receipt": "9075",
    "date": "${DateTime.now()}",
    "type": "false",
  },
  {
    "id": "2",
    "price": "206000",
    "receipt": "9085",
    "date": "${DateTime.now()}",
    "type": "false",
  },
  {
    "id": " 6",
    "price": "1350000",
    "receipt": "9200",
    "date": "${DateTime.now()}",
    "type": "true",
  },
];
