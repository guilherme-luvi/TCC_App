import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CronogramaListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CronogramaListPageState();
  }
}

class _CronogramaListPageState extends State<CronogramaListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Cronograma",
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
                        'Agenda de Consultas',
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
      child: AnimationLimiter(
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: Duration(milliseconds: 375),
              child: SlideAnimation(
                horizontalOffset: 100.0,
                child: FadeInAnimation(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 70,
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(border: Border(left: BorderSide(color: Color(0xFF480CA8), width: 3))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Consulta dia 22/08/2021",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
                              ),
                              Icon(
                                Icons.close,
                                size: 40,
                                color: Colors.red,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 70,
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(border: Border(left: BorderSide(color: Color(0xFF6EB0ED), width: 3))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Consulta dia 25/10/2021",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
                              ),
                              Icon(
                                Icons.close,
                                size: 40,
                                color: Colors.red,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
    // return CenteredMessage(
    //   'Nenhum diagnóstico realizado',
    //   icon: Icons.warning_amber_rounded,
    //   subMessage: 'Volte a página inicial e clique em "Realizar Diagnóstico".',
    // );
  }
}
