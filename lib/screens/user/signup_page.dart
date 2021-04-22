import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tcc_2021/components/alerts.dart';
import 'package:tcc_2021/components/default_text_field.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SignUpPage> {
  bool status = true;
  bool _showPassword = false;
  bool showProgress = false;

  // UserWebClient _webClient = UserWebClient();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController documentController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  var maskFormatterCPF = new MaskTextInputFormatter(mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
  var maskFormatterBirthDate = new MaskTextInputFormatter(mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

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
        color: Colors.white70,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 30),
            Center(
                child: Text(
              "Brazil Health",
              style: TextStyle(color: Color(0xFF6EB0ED), fontSize: 28, fontWeight: FontWeight.w400),
            )),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              child: DefaultTextFieldProfileBlack('Nome Completo', nameController, TextInputType.text, status),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: DefaultTextFieldProfileBlack('E-mail', emailController, TextInputType.text, status),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  obscureText: !this._showPassword,
                  controller: passwordController,
                  style: TextStyle(color: Colors.blue),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(color: Colors.black87),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlueAccent),
                    ),
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
              padding: EdgeInsets.all(10),
              child: DefaultTextFieldProfileBlack('Nascimento', birthdayController, TextInputType.datetime, status, maskFormatter: maskFormatterBirthDate),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: DefaultTextFieldProfileBlack(
                'CPF',
                documentController,
                TextInputType.phone,
                status,
                maskFormatter: maskFormatterCPF,
              ),
            ),
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
                  final nascimento = birthdayController.text;
                  final documento = documentController.text;

                  if (name.isEmpty || email.isEmpty || senha.isEmpty || nascimento.isEmpty || documento.isEmpty) {
                    showAlertDialog(context, 'Campos não preenchidos.');
                  } else {
                    setState(() {
                      showProgress = true;
                    });
                    // var resp = await _webClient.signUp(
                    //   name,
                    //   email,
                    //   senha,
                    //   nascimento,
                    //   documento,
                    // );
                    // if (resp != null) {
                    //   await _webClient.logIn(email, senha);
                    //   Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => ProfilePage()),
                    //     (Route<dynamic> route) => false,
                    //   );
                    // } else {
                    //   setState(() {
                    //     showProgress = false;
                    //   });
                    //   showAlertDialog(context, 'E-mail já cadastrado.');
                    // }
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
