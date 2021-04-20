import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HistoryListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HistoryListPageState();
  }
}

class _HistoryListPageState extends State<HistoryListPage> {
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
                          margin: const EdgeInsets.all(10.0),
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Color(0xFF480CA8), width: 2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Diagnóstico A",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400, color: Color(0xFF480CA8)),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Data 15/04/2021",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color(0xFF6EB0ED)),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 30.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.blue,
                                ),
                                height: 20,
                                width: 100,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Image.asset(
                                'images/waiting.png',
                                width: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Color(0xFF480CA8), width: 2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Diagnóstico B",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400, color: Color(0xFF480CA8)),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Data 12/04/2021",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color(0xFF6EB0ED)),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 100.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.blue,
                                ),
                                height: 20,
                                width: 100,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Image.asset(
                                'images/ready.png',
                                width: 50,
                              ),
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
  }
}
