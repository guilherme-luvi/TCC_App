import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcc_2021/components/alerts.dart';
import 'package:tcc_2021/components/default_text_field.dart';
import 'package:tcc_2021/http/webclients/user_webclient.dart';
import 'package:tcc_2021/screens/tabs_page.dart';
import 'package:tcc_2021/screens/user/questionary_menu_page.dart';
import 'package:tcc_2021/screens/user/signup_page.dart';

class LoginPage extends StatefulWidget {
  final int direction;

  LoginPage(this.direction);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool status = true;
  bool _showPassword = false;
  bool showProgress = false;
  bool showProgressFacebook = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserWebClient _webClient = UserWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Login",
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
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFF222222),
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 30),
            Container(height: 200, child: Image.asset('images/logo2.png')),
            Container(
              padding: EdgeInsets.all(10),
              child: DefaultTextFieldProfile('E-mail', emailController, TextInputType.text, status),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  obscureText: !this._showPassword,
                  controller: passwordController,
                  style: TextStyle(color: Colors.white70),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: this._showPassword ? Colors.blue : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() => this._showPassword = !this._showPassword);
                      },
                    ),
                  ),
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                //forgot password screen
              },
              textColor: Colors.white,
              child: Text('Esqueceu a senha?'),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: showProgress == false
                    ? Text('LOGIN')
                    : Theme(
                        data: Theme.of(context).copyWith(accentColor: Colors.white),
                        child: new CircularProgressIndicator(),
                      ),
                onPressed: () async {
                  final email = emailController.text;
                  final senha = passwordController.text;

                  if (email.isEmpty || senha.isEmpty) {
                    showAlertDialog(context, 'Campos não preenchidos.');
                  } else {
                    setState(() {
                      showProgress = true;
                    });

                    var resp = await _webClient.logIn(email, senha);
                    setState(() {
                      showProgress = false;
                    });

                    if (resp != null) {
                      if (widget.direction == 0) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => TabsPage(0)),
                          (Route<dynamic> route) => false,
                        );
                      }
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => QuestionaryMenu()),
                        (Route<dynamic> route) => false,
                      );
                    } else {
                      showAlertDialog(context, 'Usuário ou senha inválidos.');
                    }
                  }
                },
              ),
            ),
            SizedBox(height: 15),
            Container(
              child: Row(
                children: <Widget>[
                  Text(
                    'Não possui conta?',
                    style: TextStyle(color: Colors.white),
                  ),
                  FlatButton(
                    textColor: Colors.blue,
                    child: Text(
                      'Cadastre-se',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ));
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
