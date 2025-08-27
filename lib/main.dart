import 'package:flutter/material.dart';

void main() => runApp(BankApp());

class BankApp extends StatefulWidget {
  @override
  Widget build(BuildContext build) {
    return MaterialApp(home: Scaffold(body: FormularioTransferencia()));
  }
}

class FormularioTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Criando Transferência",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
        //foregroundColor: const Color.fromRGBO(10, 10, 10, 1),
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transferências")),

      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100, 1000)),
          ItemTransferencia(Transferencia(200, 2000)),
          ItemTransferencia(Transferencia(300, 3000)),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Botão + pressionado");
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(123, 200, 300, 1),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}
