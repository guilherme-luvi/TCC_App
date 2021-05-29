import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class DoubtsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DoubtsPageState();
  }
}

class _DoubtsPageState extends State<DoubtsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Perguntas frequentes",
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
              Expanded(
                child: sections(),
              ),
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
          itemCount: 1,
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
                          height: 50,
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFC4C4C4), width: 1))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Saber mais sobre o Diagnostico Plus",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.blueGrey),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 30,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFC4C4C4), width: 1))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Como realizo um pré-diagnóstico?",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.blueGrey),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 30,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFC4C4C4), width: 1))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Como me cadastro no aplicativo?",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.blueGrey),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 30,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFC4C4C4), width: 1))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Meus dados estão protegidos?",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.blueGrey),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 30,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFC4C4C4), width: 1))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Os resultados são confiáveis?",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.blueGrey),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 30,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFC4C4C4), width: 1))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Quantos pré-diagnóstico posso realizar?",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.blueGrey),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 30,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFC4C4C4), width: 1))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Posso marcar consultas pelo app?",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.blueGrey),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 30,
                                color: Colors.grey,
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
  }
}
