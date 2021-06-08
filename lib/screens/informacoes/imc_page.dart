import 'package:flutter/material.dart';
import 'package:tcc_2021/components/default_text_field.dart';

class IMC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _IMCState();
}

class _IMCState extends State<IMC> {
  bool status = true;
  bool showProgress = false;
  String _result = "";

  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController resultadoController = TextEditingController();

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
                            child: DefaultTextFieldProfileBlack('Altura (metros)', alturaController, TextInputType.datetime, status),
                          ),
                          Flexible(
                            child: DefaultTextFieldProfileBlack('Peso (Kg)', pesoController, TextInputType.datetime, status),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                        var imc = double.parse(pesoController.text) / (double.parse(alturaController.text) * double.parse(alturaController.text));
                        setState(() {
                          resultadoController.text = imc.toStringAsFixed(2);
                          if (imc < 18.6) {
                            _result = 'Abaixo do peso';
                          } else if (imc < 25.0) {
                            _result = "Peso ideal";
                          } else if (imc < 30.0) {
                            _result = "Levemente acima do peso";
                          } else if (imc < 35.0) {
                            _result = "Obesidade Grau I";
                          } else if (imc < 40.0) {
                            _result = "Obesidade Grau II";
                          } else {
                            _result = "Obesidade Grau IIII";
                          }
                        });
                      },
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
                      child: DefaultTextFieldProfileBlack('Resultado', resultadoController, TextInputType.text, false),
                    ),
                    _result.isEmpty
                        ? SizedBox(height: 0)
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _result,
                              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 28, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
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
                        'Fique Atento',
                        style: TextStyle(color: Color(0xFF1D3557), fontSize: 24, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(8.0), child: Image.asset('images/escala.jpg')),
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
                  height: 240,
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
