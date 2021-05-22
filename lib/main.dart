import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tcc_2021/screens/tabs_page.dart';
import 'package:flutter/services.dart';
import 'http/webclients/user_webclient.dart';

final storage = FlutterSecureStorage();
var _webClient = new UserWebClient();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var token = await storage.read(key: "jwt");
  if (token != null) {
    var user = await _webClient.loggedUser();
    if (user == null) {
      var email = await storage.read(key: "email");
      var senha = await storage.read(key: "senha");
      await _webClient.logIn(email, senha);
    }
  }
  runApp(DiagnosticoPlus());
}

class DiagnosticoPlus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: SplashScreenPage(),
    );
  }
}

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF222222),
    ));

    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 2,
          gradientBackground: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [Color(0xFF222222), Color(0xFF222222)],
          ),
          navigateAfterSeconds: TabsPage(0),
          loaderColor: Colors.transparent,
        ),
        Center(
          child: Container(
            child: Image.asset(
              'images/logo2.png',
              height: 300,
              width: 300,
            ),
          ),
        ),
      ],
    );
  }
}
