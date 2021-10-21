import 'package:curso_flutter/components/Editor.dart';
import 'package:curso_flutter/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando transferência';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoConta = 'Número da conta';
const _dicaCampoConta = '0000';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia>{
  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  final TextEditingController _controladorCampoNumero = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  void _criaTransferencia(BuildContext context){
    debugPrint('cliclou no confirmar');
    final int? numeroConta = int.tryParse(_controladorCampoNumero.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if(valor != null && numeroConta != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                  controlador:_controladorCampoNumero,
                  rotulo:_rotuloCampoConta,
                  dica:_dicaCampoConta
              ),
              Editor(
                  controlador:_controladorCampoValor,
                  rotulo:_rotuloCampoValor,
                  dica:_dicaCampoValor,
                  icone:Icons.monetization_on
              ),
              ElevatedButton(
                style: style,
                onPressed: () => _criaTransferencia(context),
                child: const Text(_textoBotaoConfirmar),
              ),
            ],
          ),
        )
    );
  }

}
