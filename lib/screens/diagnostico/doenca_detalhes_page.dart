import 'package:async/async.dart';
import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:tcc_2021/components/centered_message.dart';
import 'package:tcc_2021/components/progress.dart';
import 'package:tcc_2021/http/webclients/doencas_webclient.dart';
import 'package:tcc_2021/models/doenca.dart';

class DoencaDetalhes extends StatefulWidget {
  int doencaId;

  DoencaDetalhes(this.doencaId);

  @override
  State<StatefulWidget> createState() => new _DoencaDetalhesState();
}

class _DoencaDetalhesState extends State<DoencaDetalhes> {
  DoencasWebClient _webClient = new DoencasWebClient();
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  Image image;

  @override
  Widget build(BuildContext context) {
    if (widget.doencaId == 1) {
      image = Image.asset('images/febre.png');
    } else if (widget.doencaId == 2) {
      image = Image.asset('images/covid.png');
    } else if (widget.doencaId == 3) {
      image = Image.asset('images/h1n1.png');
    } else if (widget.doencaId == 4) {
      image = Image.asset('images/gripe.png');
    } else {
      image = Image.asset('images/dengue.png');
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Detalhes",
            style: TextStyle(color: Color(0xFF6EB0ED)),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: FutureBuilder<dynamic>(
        future: this._memoizer.runOnce(() => _webClient.doenca(widget.doencaId)),
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
                final Doenca doenca = snapshot.data;
                return Container(
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40, left: 8, bottom: 40, right: 8),
                                child: Container(
                                  height: 150,
                                  child: image,
                                ),
                              ),
                              Text(
                                doenca.nome,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0xFF1D3557), fontSize: 26, fontWeight: FontWeight.w700),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8, left: 30, bottom: 8, right: 30),
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: Color(0xFFEDF2F4),
                                  ),
                                  child: Text(
                                    doenca.descricao,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8, left: 30, bottom: 8, right: 30),
                                child: Text(
                                  'Para maiores informações consulte o site do ministério da saúde',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Color(0xFF1D3557), fontSize: 20, fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
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
                                onPressed: () {},
                                child: Text(
                                  'Ministério da saúde',
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
                        ),
                      ],
                    ),
                  ),
                );
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
}
