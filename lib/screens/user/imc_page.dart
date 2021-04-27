import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tcc_2021/components/default_text_field.dart';

class IMC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _IMCState();
}

class _IMCState extends State<IMC> {
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
            "Voltar",
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
        color: Color(0xFFe5f1fc),
        child: ListView(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: 80,
              child: Center(
                child: Text(
                  "Cálculo de IMC",
                  style: TextStyle(color: Color(0xFF6EB0ED), fontSize: 28, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Flexible(
                            child: DefaultTextFieldProfileBlack('Altura', birthdayController, TextInputType.datetime, status, maskFormatter: maskFormatterBirthDate),
                          ),
                          Flexible(
                            child: DefaultTextFieldProfileBlack('Peso', birthdayController, TextInputType.datetime, status, maskFormatter: maskFormatterBirthDate),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Image.asset('images/calc.png', width: 15),
                      label: Text('Calcular'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // background
                        onPrimary: Colors.lightBlueAccent, // fo// reground
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 200,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: DefaultTextFieldProfileBlack('Resultado', emailController, TextInputType.text, status),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Peso ideal 68,60Kg",
                        style: TextStyle(color: Color(0xFF1D3557), fontSize: 28, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "(Colocar Escala)",
                        style: TextStyle(color: Color(0xFF1D3557), fontSize: 18, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Peso",
                          style: TextStyle(color: Color(0xFF1D3557), fontWeight: FontWeight.w500, fontSize: 24),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "O peso refere-se ao peso do corpo de uma pessoa. Pode conhecer seu estado de saúde com base nas alterações de peso. "
                          "Se perdeu ou ganhou muito peso em um curto período de tempo, é necessária uma análise mais aprofundada.",
                          style: TextStyle(color: Color(0xFF1D3557), fontWeight: FontWeight.w400, fontSize: 18),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
