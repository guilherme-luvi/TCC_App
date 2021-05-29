import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tcc_2021/components/default_text_field.dart';

class MinhaConta extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MinhaContaState();
}

class _MinhaContaState extends State<MinhaConta> {
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
            "Minha Conta",
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
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Dados Cadastrais",
                style: TextStyle(color: Color(0xFF6EB0ED), fontSize: 28, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: DefaultTextFieldProfileBlack('Nome Completo', nameController, TextInputType.text, status),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: DefaultTextFieldProfileBlack(
                'CPF',
                documentController,
                TextInputType.phone,
                status,
                maskFormatter: maskFormatterCPF,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: DefaultTextFieldProfileBlack('Nascimento', birthdayController, TextInputType.datetime, status, maskFormatter: maskFormatterBirthDate),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Flexible(
                    child: DefaultTextFieldProfileBlack('Gênero', birthdayController, TextInputType.datetime, status, maskFormatter: maskFormatterBirthDate),
                  ),
                  Flexible(
                    child: DefaultTextFieldProfileBlack('Nacionalidade', birthdayController, TextInputType.datetime, status, maskFormatter: maskFormatterBirthDate),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: DefaultTextFieldProfileBlack('Celular', emailController, TextInputType.text, status),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: DefaultTextFieldProfileBlack('E-mail', emailController, TextInputType.text, status),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        marginEnd: 18,
        marginBottom: 20,
        icon: Icons.edit,
        activeIcon: Icons.close,
        buttonSize: 100.0,
        visible: true,
        closeManually: false,
        renderOverlay: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        backgroundColor: Colors.blue,
        activeBackgroundColor: Colors.white,
        foregroundColor: Colors.white,
        activeForegroundColor: Colors.black,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.people_alt_rounded, size: 30, color: Colors.white),
            backgroundColor: Colors.lightGreen,
            label: 'Dependentes',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => {},
          ),
          SpeedDialChild(
            child: Icon(
              Icons.lock,
              size: 30,
              color: Colors.white,
            ),
            backgroundColor: Colors.purpleAccent,
            label: 'Alterar Senha',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => {},
          ),
          SpeedDialChild(
            child: Icon(
              Icons.account_circle,
              size: 30,
              color: Colors.white,
            ),
            backgroundColor: Colors.blue,
            label: 'Editar Perfil',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
