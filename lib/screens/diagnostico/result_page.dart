import 'package:async/async.dart';
import 'package:emojis/emojis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:tcc_2021/components/centered_message.dart';
import 'package:tcc_2021/components/progress.dart';
import 'package:tcc_2021/http/webclients/diagnostico_webclient.dart';
import 'package:tcc_2021/screens/diagnostico/doencas_menu_page.dart';
import 'package:tcc_2021/screens/tabs_page.dart';
import 'file:///C:/Repos/tcc_2021/lib/screens/diagnostico/questionary_page.dart';

class ResultPage extends StatefulWidget {
  List<int> sintomasIds = [];

  ResultPage(this.sintomasIds);

  @override
  State<StatefulWidget> createState() {
    return _ResultPageState();
  }
}

class _ResultPageState extends State<ResultPage> {
  DiagnosticoWebClient _webClient = new DiagnosticoWebClient();
  final AsyncMemoizer _memoizer = AsyncMemoizer();

  List<Color> colorList = [
    Color(0xFF8338EC),
    Color(0xFF3A86FF),
    Color(0xFF2EC4B6),
    Color(0xFFFB5607),
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/logo3.png', width: 35),
              Text(
                "Resultado",
                style: TextStyle(color: Color(0xFF8ECAE6)),
              ),
            ],
          ),
          centerTitle: true,
        ),
      ),
      body: Container(
        color: Color(0xFFe5f1fc),
        child: FutureBuilder<dynamic>(
          future: this._memoizer.runOnce(() => _webClient.gerar(widget.sintomasIds)),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Progress();
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                if (snapshot.hasData) {
                  final List<dynamic> resultados = snapshot.data;
                  Map<String, double> dataMap = {};
                  for (var item in resultados) {
                    var resultado = item.split(':');
                    var doenca = resultado[0];
                    var porcentagem = double.parse(resultado[1]);
                    dataMap[doenca] = porcentagem;
                  }

                  if (resultados.isNotEmpty) {
                    return ListView(
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DoencasMenu(),
                                ),
                              );
                            },
                            child: Text(
                              'Clique aqui para maiores informações',
                              style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.w400, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
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
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => QuestionaryPage(),
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
                        )
                      ],
                    );
                  }
                }
                return CenteredMessage(
                  'Ocorreu um erro ${Emojis.disappointedFace}',
                  icon: Icons.cloud_off,
                  subMessage: 'Verifique sua conexão',
                );
                break;
            }
            return CenteredMessage('Unkown Error');
          },
        ),
      ),
    );
  }
}
