import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:tcc_2021/screens/tabs_page.dart';
import 'package:tcc_2021/screens/user/questionary_tabs_page.dart';

class ResultPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ResultPageState();
  }
}

enum LegendShape { Circle, Rectangle }

class _ResultPageState extends State<ResultPage> {
  Map<String, double> dataMap = {
    "Covid": 2,
    "Gripe": 3,
    "H1N1": 4,
    "Febre amarela": 5,
  };
  List<Color> colorList = [
    Color(0xFF45A5ED),
    Color(0xFF9B57D3),
    Color(0xFF92278F),
    Color(0xFF632E62),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "+Diagnóstico Plus",
            style: TextStyle(color: Color(0xFF6EB0ED)),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 15,
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Com base nas respostas',
                    style: TextStyle(color: Color(0xFF6EB0ED), fontWeight: FontWeight.w400, fontSize: 26),
                  ),
                  SizedBox(height: 15),
                  Divider(
                    color: Colors.blueGrey,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 420,
            child: PieChart(
              key: ValueKey(0),
              dataMap: dataMap,
              animationDuration: Duration(milliseconds: 2000),
              chartLegendSpacing: 50,
              chartRadius: 250,
              colorList: colorList,
              initialAngleInDegree: 0,
              chartType: ChartType.ring,
              centerText: "Diagnósticos",
              legendOptions: LegendOptions(
                showLegendsInRow: true,
                legendPosition: LegendPosition.bottom,
                showLegends: true,
                legendShape: BoxShape.circle,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: true,
                  showChartValuesOutside: true,
                  chartValueStyle: TextStyle(fontSize: 18, color: Colors.black)),
              ringStrokeWidth: 30,
              emptyColor: Colors.grey,
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => QuestionaryTabs(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Refazer ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(Icons.redo_sharp, size: 25)
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // background
                      onPrimary: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      side: BorderSide(
                        width: 2.0,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Agendar consulta ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(Icons.calendar_today_sharp, size: 25)
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // background
                      onPrimary: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      side: BorderSide(
                        width: 2.0,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => TabsPage(0)),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Início ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(Icons.home, size: 25)
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // background
                      onPrimary: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      side: BorderSide(
                        width: 2.0,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50)
              ],
            ),
          )
        ],
      ),
    );
  }
}
