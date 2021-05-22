import 'package:async/async.dart';
import 'package:emojis/emojis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tcc_2021/components/alerts.dart';
import 'package:tcc_2021/components/centered_message.dart';
import 'package:tcc_2021/components/progress.dart';
import 'package:tcc_2021/http/webclients/sintomas_webclient.dart';
import 'package:tcc_2021/models/sintoma.dart';
import 'package:tcc_2021/screens/user/result_page.dart';

class QuestionaryPage extends StatefulWidget {
  @override
  QuestionaryPageState createState() => QuestionaryPageState();

  List<int> checkedIds = [];
}

class QuestionaryPageState extends State<QuestionaryPage> {
  SintomasWebClient _webClient = new SintomasWebClient();
  final AsyncMemoizer _memoizer = AsyncMemoizer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Color(0xFF6EB0ED),
          title: Text(
            "Identificar Sintomas",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Container(
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
                        "Informe sintomas recentes",
                        style: TextStyle(color: Color(0xFF6EB0ED), fontSize: 26, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 10),
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
              conclusao(widget.checkedIds)
            ],
          ),
        ),
      ),
    );
  }

  Widget sections() {
    return Container(
      child: FutureBuilder<dynamic>(
        future: this._memoizer.runOnce(() => _webClient.sintomas()),
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
                final List<Sintoma> sintomas = snapshot.data;
                if (sintomas.isNotEmpty) {
                  return AnimationLimiter(
                    child: ListView.builder(
                      itemCount: sintomas.length,
                      itemBuilder: (context, index) {
                        final sintoma = sintomas[index];
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: Duration(milliseconds: 375),
                          child: SlideAnimation(
                            child: FadeInAnimation(
                              child: Container(
                                margin: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Color(0xFF480CA8), width: 2)),
                                child: Column(
                                  children: [
                                    CheckboxListTile(
                                      activeColor: Colors.lightBlueAccent,
                                      dense: true,
                                      title: new Text(
                                        sintoma.nome,
                                        style: TextStyle(color: Color(0xFF6EB0ED), fontWeight: FontWeight.w500, fontSize: 18),
                                      ),
                                      value: sintoma.isCheck,
                                      onChanged: (bool val) {
                                        setState(() {
                                          if (sintoma.isCheck == false) {
                                            sintoma.isCheck = true;
                                            widget.checkedIds.add(sintoma.id);
                                          } else {
                                            sintoma.isCheck = false;
                                            widget.checkedIds.removeWhere((element) => element == sintoma.id);
                                          }
                                        });
                                      },
                                    ),
                                  ],
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
    );
  }

  Widget conclusao(List<int> ids) {
    return Container(
      padding: EdgeInsets.all(6),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Color(0xFF6EB0ED),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 25,
            offset: Offset(0, -5), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              if (ids.isEmpty) {
                showAlertDialog(context, 'Nenhum sintoma foi selecionado.');
              } else {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage(ids)),
                  (Route<dynamic> route) => false,
                );
              }
            },
            child: Text(
              'Gerar resultado',
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
      ),
    );
  }
}
