import 'package:curso_flutter/models/transferencia.dart';
import 'package:flutter/material.dart';

import 'formulario.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencias extends StatefulWidget {
  final String constante = '';
  final List<Transferencia> _transferencias = [];
  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias>{

  // widget.constante;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice){
          return ItemTransferencia(widget._transferencias[indice]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return FormularioTransferencia();
          })).then((transferenciaRecebida) =>
              _atualiza(transferenciaRecebida));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _atualiza(transferenciaRecebida) {
    if(transferenciaRecebida != null){
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget{
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            leading: Icon(Icons.monetization_on),
            title:Text(_transferencia.valor.toString()),
            subtitle: Text(_transferencia.numeroConta.toString())
        )
    );
  }
}
