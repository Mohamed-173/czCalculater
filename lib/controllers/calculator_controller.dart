// import 'dart:js';
import 'dart:math';

import 'package:czcalculator/constant/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalculatorController extends GetxController {
  // total prices of loan
  double _totalPriceLoan = 0;
  double get totalPriceLoan => _totalPriceLoan;

// total prices of Payback people
  double _totalPricePayBack = 0;
  double get totalPricePayBack => _totalPricePayBack;
  // total prices of Payback people
  double _finalTotalPriceLoan = 0;
  double get finalTotalPriceLoan => _finalTotalPriceLoan;

  // just list of every reciept
  RxList<Map<String, dynamic>> _tmp = RxList<Map<String, dynamic>>();
  RxList<Map<String, dynamic>> get tmp => _tmp;
  //
  TextEditingController _priceController = TextEditingController();
  TextEditingController get priceController => _priceController;

  //
  TextEditingController _receiptController = TextEditingController();
  TextEditingController get receiptController => _receiptController;

  //
  TextEditingController _dateController = TextEditingController();
  TextEditingController get dateController => _dateController;
//
  TextEditingController _typeController = TextEditingController();
  TextEditingController get typeController => _typeController;
  // true false for switch for variable
  RxBool get onChangetype => _onChangetype;
  RxBool _onChangetype = false.obs;

//
  var selectedDate = DateTime.now().obs;

  //
  RxInt _id = 20.obs;
  RxInt get id => _id;

  //
  @override
  void onInit() {
    super.onInit();
    initList();
    sumTotalLoan(tmp);
    sumTotalPayBack(tmp);
    finalTotalPricesLoan();
    update();
  }

  void initList() {
    _tmp.addAll(calModel);
    update();
  }

  void finalTotalPricesLoan() {
    _finalTotalPriceLoan = 0;
    _finalTotalPriceLoan = _totalPriceLoan - _totalPricePayBack;
    update();
  }

  String NFormatter({int? number}) {
    NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
    return myFormat.format(number);
  }

  void sumTotalLoan(List<Map<String, dynamic>> total) {
    _totalPriceLoan = 0;
    List<int> tempTotalPrices = [];

    for (final i in total) {
      if (i["type"] == false) {
        tempTotalPrices.add(i["price"]);
      }
    }

    for (int x = 0; x < tempTotalPrices.length; x++) {
      _totalPriceLoan += tempTotalPrices[x];
    }

    update();
  }

  void onSwitch(bool value) {
    print(value);

    _onChangetype.value = !_onChangetype.value;
  }

  void sumTotalPayBack(List<Map<String, dynamic>> total) {
    /// we reset the number because its have it and be error if not reset it
    _totalPricePayBack = 0;
    List<int> tempTotalPrices = [];

    for (final i in total) {
      if (i["type"] == true) {
        tempTotalPrices.add(i["price"]);
      }
    }

    for (int x = 0; x < tempTotalPrices.length; x++) {
      _totalPricePayBack += tempTotalPrices[x];
    }

    update();
  }

  void removeAtIndex({int? index}) {
    index != null ? tmp.removeAt(index) : null;

    update();
  }

  void idGenerator() {
    _id++;
  }

  int tt = 0;
  void addTemp({int? price, int? receipt, DateTime? selectdate, bool? type}) {
    bool boolRandom = false;
    tt++;
    if (tt % 5 == 0) {
      boolRandom = true;
    } else {
      boolRandom = false;
    }
    Random random = Random();
    Map<String, dynamic> t = {};
    print("$price ,$receipt,$selectdate,$type");

    if (price != null &&
        receipt != null &&
        selectdate != null &&
        type != null) {
      t = {
        "id": "${_id++}",
        "price": price,
        "receipt": receipt,
        "date": selectdate,
        "type": onChangetype,
      };
    } else {
      t = {
        "id": "${_id++}",
        "price": random.nextInt(10000000) + 1000,
        "receipt": random.nextInt(2000),
        "date": DateTime.now(),
        "type": boolRandom,
      };
    }
    print(t);
    _tmp.add(t);
    update();
    // print(tmp);
  }

  void chooseDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
      //initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'DOB',
      fieldHintText: 'Month/Date/Year',
      // selectableDayPredicate: disableDate,
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      dateController.text = pickedDate.toString();
      selectedDate.value = pickedDate;
    }
  }
}
