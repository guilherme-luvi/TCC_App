import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcc_2021/screens/user/detalhes_health_page.dart';

class HealthPage extends StatefulWidget {
  @override
  HealthPageState createState() => HealthPageState();
}

class HealthPageState extends State<HealthPage> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.dstOut),
            image: AssetImage("images/health-background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 200),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF6EB0ED).withOpacity(0.6),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(150),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: 450,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bem Estar",
                      style: TextStyle(color: Color(0xFF1D3557), fontWeight: FontWeight.w500, fontSize: 24),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "​A rotina de trabalho, estudos e exercícios parece ser mais extensa que o nosso tempo disponível, "
                      "não é mesmo? \n\nNão existe remédio milagroso para aumentar nossa disposição, "
                      "mas algumas atitudes podem fazer a diferença no dia a dia como criar condições para acordar disposto, "
                      "alimentar-se bem, praticar exercícios, movimentar-se e dormir bem.",
                      style: TextStyle(color: Color(0xFF1D3557), fontWeight: FontWeight.w400, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetalhesHealthPage(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Clique aqui para mais detalhes ",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 15),
                            ),
                            WidgetSpan(
                              child: Icon(Icons.arrow_forward_ios, size: 18),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
