import 'package:czcalculator/constant/const.dart';
import 'package:czcalculator/toolbox/toolbox.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  topTitle(
                    texttitle: "Total Prices",
                    textcontent: "IQD 2,500,000",
                    function: sumPrice,
                    context: context,
                  ),
                  topTitle(
                    texttitle: "Total Prices",
                    textcontent: "2500000",
                    context: context,
                  ),
                  topTitle(
                    texttitle: "Total Prices",
                    textcontent: "2500000",
                    context: context,
                  ),
                  topTitle(
                    texttitle: "Total Prices",
                    textcontent: "2500000",
                    context: context,
                  ),
                  topTitle(
                    texttitle: "Total Prices",
                    textcontent: "2500000",
                    context: context,
                  ),
                ],
              ),
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
              child: ListView.builder(
                itemCount: tmp.length,
                itemBuilder: (BuildContext context, int index) {
                  var col = Colors.cyanAccent.shade400;
                  var bCol = Colors.white;
                  if (tmp[index]["type"]) {
                    // col = Colors.red.shade100;
                    bCol = Colors.red.shade100;
                  } else {}

                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 2),
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
                                tmp[index]["id"].toString(),
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
                              tmp[index]["price"].toString(),
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
                              tmp[index]["receipt"].toString(),
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
                                  .format(tmp[index]["date"] as DateTime)
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
                                tmp[index]["type"].toString(),
                                style: contentstyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.cyanAccent.shade400,
            onPressed: () {},
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 5),
          FloatingActionButton(
            backgroundColor: Colors.cyanAccent.shade400,
            onPressed: () {},
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
        width: getWidth(context, 20),
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
