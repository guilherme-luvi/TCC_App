import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcc_2021/screens/informacoes/detalhes_health_page.dart';
import 'package:tcc_2021/screens/informacoes/imc_page.dart';

class HealthPage extends StatefulWidget {
  @override
  HealthPageState createState() => HealthPageState();
}

class HealthPageState extends State<HealthPage> {
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
        child: Container(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF6EB0ED).withOpacity(0.6),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(150),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 380,
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
              Positioned(
                top: 280,
                right: 40,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: Container(
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Verifique \naqui seu \nIMC", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 340,
                right: 90,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => IMC(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.favorite_border_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
