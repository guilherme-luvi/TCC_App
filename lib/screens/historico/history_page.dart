import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:tcc_2021/components/centered_message.dart';
import 'package:tcc_2021/components/progress.dart';
import 'package:tcc_2021/http/webclients/diagnostico_webclient.dart';
import 'package:tcc_2021/models/diagnostico.dart';
import 'package:tcc_2021/screens/historico/history_details_page.dart';
import 'file:///C:/Repos/tcc_2021/lib/screens/usuario/login_page.dart';
import 'file:///C:/Repos/tcc_2021/lib/screens/diagnostico/questionary_menu_page.dart';

import '../../main.dart';

class HistoryListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HistoryListPageState();
  }
}

class _HistoryListPageState extends State<HistoryListPage> {
  DiagnosticoWebClient _webClient = new DiagnosticoWebClient();
  final AsyncMemoizer _memoizer = AsyncMemoizer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 15,
                  bottom: 0,
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Histórico de Dignósticos',
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
              Expanded(
                child: sections(),
              ),
              //Bottom Button
            ],
          ),
        ),
      ),
    );
  }

  Widget sections() {
    return Container(
      child: FutureBuilder<dynamic>(
        future: this._memoizer.runOnce(() => _webClient.meusDiagnosticos()),
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
                final List<Diagnostico> diagnosticos = snapshot.data;
                if (diagnosticos.isNotEmpty) {
                  return AnimationLimiter(
                    child: ListView.builder(
                      itemCount: diagnosticos.length,
                      itemBuilder: (context, index) {
                        final diagnostico = diagnosticos[index];
                        String dia = DateFormat('dd/MM/yyyy').format(DateTime.parse(diagnostico.data));
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: Duration(milliseconds: 375),
                          child: SlideAnimation(
                            horizontalOffset: 100.0,
                            child: FadeInAnimation(
                              child: Container(
                                margin: const EdgeInsets.all(10.0),
                                padding: const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Color(0xFF480CA8), width: 2)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => HistoryDetail(diagnostico),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.calendar_today_rounded, color: Colors.blue),
                                              Text(
                                                " $dia",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400, color: Color(0xFF480CA8)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Sem consulta agendada',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color(0xFF6EB0ED)),
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        'images/ready.png',
                                        width: 50,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CenteredMessage(
                    'Ops! Nada por aqui',
                    icon: Icons.warning_amber_rounded,
                    subMessage: 'Realize novos diagnósticos',
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      var token = await storage.read(key: "jwt");
                      if (token != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => QuestionaryMenu(),
                          ),
                        );
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LoginPage(1),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Clique aqui',
                      style: TextStyle(fontSize: 18),
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
                ],
              );
              break;
          }
          return CenteredMessage('Unkown Error');
        },
      ),
    );
  }
}
