import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcc_2021/models/noticia.dart';
import 'package:tcc_2021/screens/user/questionary_menu_page.dart';
import '../../main.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<Noticia> imgList = [
    new Noticia('images/protection-health.png', 'Proteja-se!'),
    new Noticia('images/vaccine-health.png', 'Vacine-se!'),
    new Noticia('images/foods-health.png', 'Alimente-se bem!'),
    new Noticia('images/drop-health.png', 'Hidrate-se!')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/home-background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 120),
            Text('Fique em dia com sua saúde', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500)),
            SizedBox(height: 10),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imgList
                  .map(
                    (item) => Container(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Stack(
                            children: <Widget>[
                              Image.asset(item.img, fit: BoxFit.cover, width: 1000.0),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                  child: Text(
                                    item.descricao,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 50),
            Container(height: 200, child: Image.asset('images/logo2.png')),
            SizedBox(height: 40),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () async {
                  var token = await storage.read(key: "jwt");
                  if (token == null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(1),
                      ),
                    );
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => QuestionaryMenu(),
                      ),
                    );
                  }
                },
                icon: Image.asset('images/logo3.png', width: 30),
                label: Text('Realizar Diagnóstico'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // background
                  onPrimary: Colors.lightBlueAccent, // fo// reground
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
