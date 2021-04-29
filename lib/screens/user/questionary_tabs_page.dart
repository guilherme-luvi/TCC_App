import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionaryTabs extends StatefulWidget {
  @override
  QuestionaryTabsState createState() => QuestionaryTabsState();
}

class QuestionaryTabsState extends State<QuestionaryTabs> {
  List<SintomasPrimarios> checkBoxSintomasPrimarios = SintomasPrimarios.getUsers();

  List<SintomasSecundarios> checkBoxSintomasSecundarios = SintomasSecundarios.getUsers();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
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
            bottom: TabBar(
              indicatorColor: Color(0xFF480CA8),
              tabs: [
                Text(
                  "Primários",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Secundários",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 10),
                  child: Text(
                    "Informe sintomas recentes",
                    style: TextStyle(color: Color(0xFF6EB0ED), fontSize: 28, fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(
                  child: new ListView.builder(
                    itemCount: checkBoxSintomasPrimarios.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Color(0xFF480CA8), width: 2)),
                        child: Column(
                          children: [
                            CheckboxListTile(
                              activeColor: Colors.lightBlueAccent,
                              dense: true,
                              //font change
                              title: new Text(
                                checkBoxSintomasPrimarios[index].title,
                                style: TextStyle(color: Color(0xFF6EB0ED), fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                              value: checkBoxSintomasPrimarios[index].isCheck,
                              onChanged: (bool val) {
                                itemChangeSintomasPrimarios(val, index);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Próxima etapa',
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
                ),
                SizedBox(height: 20)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 10),
                  child: Text(
                    "Informe sintomas recentes",
                    style: TextStyle(color: Color(0xFF6EB0ED), fontSize: 28, fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(
                  child: new ListView.builder(
                    itemCount: checkBoxSintomasSecundarios.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Color(0xFF480CA8), width: 2)),
                        child: Column(
                          children: [
                            CheckboxListTile(
                              activeColor: Colors.lightBlueAccent,
                              dense: true,
                              //font change
                              title: new Text(
                                checkBoxSintomasSecundarios[index].title,
                                style: TextStyle(color: Color(0xFF6EB0ED), fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                              value: checkBoxSintomasSecundarios[index].isCheck,
                              onChanged: (bool val) {
                                itemChangeSintomasSecundarios(val, index);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
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
                ),
                SizedBox(height: 20)
              ],
            ),
          ],
        ),
      ),
    );
  }

  void itemChangeSintomasPrimarios(bool val, int index) {
    setState(() {
      checkBoxSintomasPrimarios[index].isCheck = val;
    });
  }

  void itemChangeSintomasSecundarios(bool val, int index) {
    setState(() {
      checkBoxSintomasSecundarios[index].isCheck = val;
    });
  }
}

class SintomasPrimarios {
  int id;
  String title;
  bool isCheck;

  SintomasPrimarios({this.id, this.title, this.isCheck});

  static List<SintomasPrimarios> getUsers() {
    return <SintomasPrimarios>[
      SintomasPrimarios(id: 1, title: "Febre", isCheck: false),
      SintomasPrimarios(id: 2, title: "Dor de cabeça", isCheck: false),
      SintomasPrimarios(id: 3, title: "Dores musculares", isCheck: false),
      SintomasPrimarios(id: 4, title: "Dor de garganta", isCheck: false),
      SintomasPrimarios(id: 5, title: "Vômitos", isCheck: false),
      SintomasPrimarios(id: 5, title: "Dor ou irritação nos olhos", isCheck: false),
    ];
  }
}

class SintomasSecundarios {
  int id;
  String title;
  bool isCheck;

  SintomasSecundarios({this.id, this.title, this.isCheck});

  static List<SintomasSecundarios> getUsers() {
    return <SintomasSecundarios>[
      SintomasSecundarios(id: 1, title: "Manchas/erupções na pele", isCheck: false),
      SintomasSecundarios(id: 2, title: "Cansaço", isCheck: false),
      SintomasSecundarios(id: 3, title: "Tosse", isCheck: false),
      SintomasSecundarios(id: 4, title: "Diarreia", isCheck: false),
      SintomasSecundarios(id: 5, title: "Calafrios", isCheck: false),
    ];
  }
}
