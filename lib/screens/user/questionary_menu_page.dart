import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcc_2021/screens/tabs_page.dart';
import 'package:tcc_2021/screens/user/questionary_page.dart';

class QuestionaryMenu extends StatefulWidget {
  @override
  QuestionaryMenuState createState() => QuestionaryMenuState();
}

class QuestionaryMenuState extends State<QuestionaryMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Voltar",
            style: TextStyle(color: Color(0xFF6EB0ED)),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => TabsPage(0)),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/questionary.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => QuestionaryPage(),
                    ),
                  );
                },
                child: Text(
                  'Iniciar Questionário',
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
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
