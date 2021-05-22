import 'package:flutter/material.dart';
import 'package:tcc_2021/components/alerts.dart';
import 'package:tcc_2021/components/default_text_field.dart';
import 'package:tcc_2021/http/webclients/user_webclient.dart';
import 'package:tcc_2021/screens/tabs_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SignUpPage> {
  bool status = true;
  bool _showPassword = false;
  bool showProgress = false;

  UserWebClient _webClient = UserWebClient();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  // TextEditingController birthdayController = TextEditingController();
  // var maskFormatterCPF = new MaskTextInputFormatter(mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
  // var maskFormatterBirthDate = new MaskTextInputFormatter(mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Cadastro",
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
        color: Color(0xFF222222),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20),
            Container(height: 100, child: Image.asset('images/logo2.png')),
            Container(
              padding: EdgeInsets.all(10),
              child: DefaultTextFieldProfile('Nome Completo', nameController, TextInputType.text, status),
            ),
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
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  obscureText: !this._showPassword,
                  controller: confirmController,
                  style: TextStyle(color: Colors.white70),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Confirmar senha',
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
            // Container(
            //   padding: EdgeInsets.all(10),
            //   child: DefaultTextFieldProfile('Nascimento', birthdayController, TextInputType.datetime, status, maskFormatter: maskFormatterBirthDate),
            // ),
            // Container(
            //   padding: EdgeInsets.all(10),
            //   child: DefaultTextFieldProfile(
            //     'CPF',
            //     documentController,
            //     TextInputType.phone,
            //     status,
            //     maskFormatter: maskFormatterCPF,
            //   ),
            // ),
            Container(
              height: 70,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: showProgress == false
                    ? Text('CADASTRAR')
                    : Theme(
                        data: Theme.of(context).copyWith(accentColor: Colors.white),
                        child: new CircularProgressIndicator(),
                      ),
                onPressed: () async {
                  final name = nameController.text;
                  final email = emailController.text;
                  final senha = passwordController.text;
                  final confirm = confirmController.text;

                  if (name.isEmpty || email.isEmpty || senha.isEmpty || confirm.isEmpty) {
                    showAlertDialog(context, 'Campos não preenchidos.');
                  } else if (senha != confirm) {
                    showAlertDialog(context, 'O campo de confirmação está diferente da senha.');
                  } else {
                    setState(() {
                      showProgress = true;
                    });

                    var resp = await _webClient.signUp(
                      name,
                      email,
                      senha,
                    );
                    if (resp != null) {
                      await _webClient.logIn(email, senha);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => TabsPage(0)),
                        (Route<dynamic> route) => false,
                      );
                    } else {
                      setState(() {
                        showProgress = false;
                      });
                      showAlertDialog(context, 'E-mail já cadastrado.');
                    }
                  }
                },
              ),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
