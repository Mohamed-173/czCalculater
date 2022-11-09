import 'package:czcalculator/constant/const.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  double _totalPrice = 0;
  double get totalPrice => _totalPrice;

  @override
  void onInit() {
    super.onInit();
    sumTotal(calModel);
  }

  void sumTotal(List<Map<String, dynamic>> total) {
    _totalPrice = 0;
    List<int> tempTotalPrices = [];

    for (final i in total) {
      if (i["type"] == false) {
        tempTotalPrices.add(i["price"]);
      }
    }
    print(tempTotalPrices);
    for (int x = 0; x < tempTotalPrices.length; x++) {
      _totalPrice += tempTotalPrices[x];
    }
    print(_totalPrice);

    update();
  }
}
