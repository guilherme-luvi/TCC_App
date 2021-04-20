import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// ignore: must_be_immutable
class DefaultTextField extends StatelessWidget {
  String dica;
  TextInputType type;
  bool status;
  MaskTextInputFormatter maskFormatter;
  TextEditingController controller = TextEditingController();

  DefaultTextField(this.dica, this.controller, this.type, this.status,
      {this.maskFormatter});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        inputFormatters: maskFormatter != null ? [maskFormatter] : null,
        controller: controller,
        style: TextStyle(color: Colors.blueGrey),
        keyboardType: type,
        enabled: status,
        minLines: 1,
        maxLines: 25,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white38),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
          labelStyle: TextStyle(color: Colors.white),
          labelText: dica,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DefaultTextFieldProfile extends StatelessWidget {
  String dica;
  TextInputType type;
  bool status;
  MaskTextInputFormatter maskFormatter;
  TextEditingController controller = TextEditingController();

  DefaultTextFieldProfile(this.dica, this.controller, this.type, this.status,
      {this.maskFormatter});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        inputFormatters: maskFormatter != null ? [maskFormatter] : null,
        controller: controller,
        style: TextStyle(color: Colors.white70),
        keyboardType: type,
        enabled: status,
        minLines: 1,
        maxLines: 25,
        decoration: InputDecoration(
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
          labelText: dica,
        ),
      ),
    );
  }
}