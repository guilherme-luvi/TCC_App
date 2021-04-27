import 'package:flutter/material.dart';
import 'package:tcc_2021/screens/tabs_page.dart';

void main() async {
  runApp(TicketSpree());
}

class TicketSpree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: TabsPage(1),
    );
  }
}