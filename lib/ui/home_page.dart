import 'package:czcalculator/constant/const.dart';
import 'package:czcalculator/controllers/calculator_controller.dart';
import 'package:czcalculator/toolbox/toolbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CalculatorController controller = Get.put(CalculatorController());
    // sumPrice();
    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getHeight(context, 20),
              width: getWidth(context, 100),
              child: GetBuilder<CalculatorController>(builder: (_) {
                // var formatter = NumberFormat('#,##,000');
                var formatter = NumberFormat('#,###,000');
                NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    topTitle(
                      texttitle: "Total Prices Loan",
                      textcontent:
                          "IQD  ${formatter.format(controller.totalPriceLoan)}",
                      // function: sumPrice,
                      context: context,
                    ),
                    topTitle(
                      texttitle: "Total Prices Pay Back",
                      textcontent:
                          "IQD ${myFormat.format(controller.totalPricePayBack)}",
                      context: context,
                    ),
                    topTitle(
                      texttitle: "Final Total Prices Loan",
                      textcontent:
                          "IQD ${formatter.format(controller.finalTotalPriceLoan)}",
                      context: context,
                    ),
                    // topTitle(
                    //   texttitle: "Total Prices",
                    //   textcontent: "2500000",
                    //   context: context,
                    // ),
                    // topTitle(
                    //   texttitle: "Total Prices",
                    //   textcontent: "2500000",
                    //   context: context,
                    // ),
                  ],
                );
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              // verticalDirection: VerticalDirection.down,
              children: [
                middleTitle(textTitle: "id"),
                middleTitle(textTitle: "price"),
                middleTitle(textTitle: "receipt"),
                middleTitle(textTitle: "date"),
                middleTitle(textTitle: "type"),
              ],
            ),
            Expanded(
              child: GetBuilder<CalculatorController>(builder: (context) {
                return ListView.builder(
                  itemCount: controller.tmp.length,
                  itemBuilder: (BuildContext context, int index) {
                    var col = Colors.cyanAccent.shade400;
                    var bCol = Colors.white;
                    if (controller.tmp[index]["type"]) {
                      // col = Colors.red.shade100;
                      bCol = Colors.red.shade100;
                    } else {}

                    return GestureDetector(
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Removing"),
                                content: SizedBox(
                                  height: getHeight(context, 25),
                                  // width: Get.width.toPrecision(90),
                                  child: Column(
                                    children: [
                                      Text(
                                          "We Removing the receipt  ID: ${controller.tmp[index]["id"]}  do you realy want it? \n"),
                                      Row(
                                        children: const [
                                          Text(" if yes then click"),
                                          Text(
                                            " OK",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                          ),
                                          Text("  or else click "),
                                          Text(
                                            " Close",
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      controller.removeAtIndex(index: index);

                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      "OK",
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Close"),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // verticalDirection: VerticalDirection.down,
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: bCol,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: col,
                                    ),
                                    // top: BorderSide(
                                    //     color: Colors.cyanAccent.shade400),
                                    left: BorderSide(
                                      color: col,
                                    ),
                                  ),
                                ),
                                // color: Colors.cyanAccent[400],
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text(
                                    controller.tmp[index]["id"].toString(),
                                    style: contentstyle,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: bCol,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: col,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                // color: bCol,
                                child: Text(
                                  controller.NFormatter(
                                      number: controller.tmp[index]["price"]),
                                  style: contentstyle,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: bCol,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: col,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                // color: bCol,
                                child: Text(
                                  controller.tmp[index]["receipt"].toString(),
                                  style: contentstyle,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: bCol,
                                  border: Border(
                                    bottom: BorderSide(color: col),
                                    // right: BorderSide(
                                    //   color: Colors.cyanAccent.shade400,
                                    // ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  formatter
                                      .format(controller.tmp[index]["date"]
                                          as DateTime)
                                      .toString(),
                                  style: contentstyle,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: bCol,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: col,
                                    ),
                                    // top: BorderSide(
                                    //     color: Colors.cyanAccent.shade400),
                                    right: BorderSide(
                                      color: col,
                                    ),
                                  ),
                                ),
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text(
                                    controller.tmp[index]["type"].toString(),
                                    style: contentstyle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.cyanAccent.shade400,
            onPressed: () {
              controller.addTemp();
              controller.sumTotalLoan(controller.tmp);
              controller.sumTotalPayBack(controller.tmp);
              controller.finalTotalPricesLoan();
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 5),
          FloatingActionButton(
            backgroundColor: Colors.cyanAccent.shade400,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Adding Data"),
                      content: SizedBox(
                        height: getHeight(context, 35),
                        // width: Get.width.toPrecision(90),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: controller.priceController,
                              decoration: const InputDecoration(
                                labelText: "price",
                              ),
                            ),
                            TextFormField(
                              controller: controller.receiptController,
                              decoration: const InputDecoration(
                                labelText: "receipt no",
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                controller.chooseDate(context);
                              },
                              child: const Text("Choose Date"),
                            ),
                            TextFormField(
                              controller: controller.typeController,
                              decoration: const InputDecoration(
                                labelText: "type",
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            controller.addTemp(
                              price:
                                  int.tryParse(controller.priceController.text),
                              receipt: int.tryParse(
                                  controller.receiptController.text),
                              selectdate: DateTime.tryParse(
                                  controller.dateController.value.text),
                              type: controller.typeController.text == "true"
                                  ? true
                                  : false,
                            );
                          },
                          child: const Text("OK"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Close"),
                        ),
                      ],
                    );
                  });
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Expanded middleTitle({String textTitle = "MeddleTitle"}) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        color: Colors.cyanAccent[400],
        child: FittedBox(
            fit: BoxFit.cover, child: Text(textTitle, style: titlestyle)),
      ),
    );
  }

  Widget topTitle({
    String texttitle = 'TextTitle',
    textcontent = 'TextContent',
    Function? function,
    BuildContext? context,
  }) {
    return GestureDetector(
      onTap: () {
        // print(function.runtimeType);
        function != null ? function() : null;
        // print("$textcontent");
      },
      child: SizedBox(
        height: getHeight(context, 16),
        width: getWidth(context, 33.3),
        child: Card(
          margin: EdgeInsets.symmetric(
            horizontal: getWidth(context, 0.2),
          ),
          color: Colors.cyanAccent[400],
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getWidth(context, 1), vertical: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FittedBox(child: Text(texttitle, style: titlestyle)),
                const Divider(
                  color: Colors.white,
                ),
                FittedBox(child: Text(textcontent, style: titlestyle)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() => AppBar(
        title: const Text(
          "appBarTitle ",
        ),
        centerTitle: true,
      );
}
