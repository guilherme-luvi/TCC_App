import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class DetalhesHealthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetalhesHealthPageState();
  }
}

class _DetalhesHealthPageState extends State<DetalhesHealthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Bem Estar",
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: sections(),
                ),
                //Bottom Button
              ],
            ),
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
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(0),
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      "images/health-background.png",
                                      width: 120,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Bem estar",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500, color: Color(0xFF1D3557)),
                                        ),
                                        Container(
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF6EB0ED),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text("Brazilian News", style: TextStyle(fontSize: 10), textAlign: TextAlign.center),
                                        ),
                                        SizedBox(height: 10),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              WidgetSpan(
                                                child: Icon(
                                                  Icons.access_time,
                                                  size: 18,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              TextSpan(
                                                text: " 10:30AM - Monday ",
                                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 40,
                              right: 1,
                              child: Icon(
                                Icons.circle,
                                color: Color(0xFF6EB0ED),
                                size: 50,
                              ),
                            ),
                            Positioned(
                              top: 55,
                              right: 12,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(0),
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      "images/drop-health.png",
                                      width: 120,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Água é vida",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500, color: Color(0xFF1D3557)),
                                        ),
                                        Container(
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF6EB0ED),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text("Brazilian News", style: TextStyle(fontSize: 10), textAlign: TextAlign.center),
                                        ),
                                        SizedBox(height: 10),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              WidgetSpan(
                                                child: Icon(
                                                  Icons.access_time,
                                                  size: 18,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              TextSpan(
                                                text: " 10:30AM - Monday ",
                                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 40,
                              right: 1,
                              child: Icon(
                                Icons.circle,
                                color: Color(0xFF6EB0ED),
                                size: 50,
                              ),
                            ),
                            Positioned(
                              top: 55,
                              right: 12,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(0),
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      "images/foods-health.png",
                                      width: 120,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Alimentação",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500, color: Color(0xFF1D3557)),
                                        ),
                                        Container(
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF6EB0ED),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text("Brazilian News", style: TextStyle(fontSize: 10), textAlign: TextAlign.center),
                                        ),
                                        SizedBox(height: 10),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              WidgetSpan(
                                                child: Icon(
                                                  Icons.access_time,
                                                  size: 18,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              TextSpan(
                                                text: " 10:30AM - Monday ",
                                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 40,
                              right: 1,
                              child: Icon(
                                Icons.circle,
                                color: Color(0xFF6EB0ED),
                                size: 50,
                              ),
                            ),
                            Positioned(
                              top: 55,
                              right: 12,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(0),
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      "images/vaccine-health.png",
                                      width: 120,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Vacinação",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500, color: Color(0xFF1D3557)),
                                        ),
                                        Container(
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF6EB0ED),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text("Brazilian News", style: TextStyle(fontSize: 10), textAlign: TextAlign.center),
                                        ),
                                        SizedBox(height: 10),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              WidgetSpan(
                                                child: Icon(
                                                  Icons.access_time,
                                                  size: 18,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              TextSpan(
                                                text: " 10:30AM - Monday ",
                                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 40,
                              right: 1,
                              child: Icon(
                                Icons.circle,
                                color: Color(0xFF6EB0ED),
                                size: 50,
                              ),
                            ),
                            Positioned(
                              top: 55,
                              right: 12,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(0),
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      "images/protection-health.png",
                                      width: 120,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Prevenções",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500, color: Color(0xFF1D3557)),
                                        ),
                                        Container(
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF6EB0ED),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text("Brazilian News", style: TextStyle(fontSize: 10), textAlign: TextAlign.center),
                                        ),
                                        SizedBox(height: 10),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              WidgetSpan(
                                                child: Icon(
                                                  Icons.access_time,
                                                  size: 18,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              TextSpan(
                                                text: " 10:30AM - Monday ",
                                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 40,
                              right: 1,
                              child: Icon(
                                Icons.circle,
                                color: Color(0xFF6EB0ED),
                                size: 50,
                              ),
                            ),
                            Positioned(
                              top: 55,
                              right: 12,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ],
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
