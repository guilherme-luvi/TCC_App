import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:tcc_2021/http/webclients/diagnostico_webclient.dart';
import 'package:tcc_2021/models/diagnostico.dart';
import 'package:tcc_2021/screens/tabs_page.dart';

class HistoryDetail extends StatefulWidget {
  Diagnostico diagnostico;

  HistoryDetail(this.diagnostico);

  @override
  State<StatefulWidget> createState() {
    return _HistoryDetailState();
  }
}

class _HistoryDetailState extends State<HistoryDetail> {
  DiagnosticoWebClient _webClient = new DiagnosticoWebClient();
  Map<String, double> dataMap = {};
  List<Color> colorList = [
    Color(0xFF8338EC),
    Color(0xFF3A86FF),
    Color(0xFF2EC4B6),
    Color(0xFFFB5607),
    Color(0xFFd9a20b),
  ];

  @override
  Widget build(BuildContext context) {
    var resultados = widget.diagnostico.resultados.split(',');
    for (var item in resultados) {
      var resultado = item.split(':');
      var doenca = resultado[0];
      var porcentagem = double.parse(resultado[1]);
      dataMap[doenca] = porcentagem;
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Image.asset('images/logo3.png', width: 35),
              Text(
                "Resultado",
                style: TextStyle(color: Color(0xFF8ECAE6)),
              ),
            ],
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Container(
        color: Color(0xFFe5f1fc),
        child: ListView(
          children: [
            SizedBox(height: 10),
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
                centerText: "Possíveis\nDiagnósticos",
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
                  chartValueBackgroundColor: Colors.white,
                  showChartValues: true,
                  showChartValuesInPercentage: true,
                  showChartValuesOutside: true,
                  chartValueStyle: TextStyle(fontSize: 18, color: Colors.lightBlueAccent, fontWeight: FontWeight.w500),
                ),
                ringStrokeWidth: 30,
                emptyColor: Colors.white,
              ),
            ),
            Center(
              child: Text(
                'Clique nas cores para maiores informações',
                style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.w400, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                    border: Border.all(color: Color(0xFF6EB0ED), width: 2),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                          onPressed: () async {
                            await _webClient.deletar(widget.diagnostico.id);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => TabsPage(2)),
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Excluir ',
                                style: TextStyle(fontSize: 18, color: Colors.red),
                              ),
                              Icon(
                                Icons.delete_forever,
                                size: 25,
                                color: Colors.red,
                              )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white, // background
                            onPrimary: Colors.red,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            side: BorderSide(
                              width: 2.0,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Column(
                          children: [
                            Material(
                              type: MaterialType.transparency,
                              child: Ink(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 1),
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(1000.0),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => TabsPage(0),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Icon(
                                      Icons.home,
                                      size: 40.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
