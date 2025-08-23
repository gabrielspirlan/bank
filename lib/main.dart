import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Transferências")),

      body: ListaTransferencias

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Botão + pressionado");
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(123, 200, 300, 1),
      ),
    ),
  ),
);

class ListaTransferencias extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text("Valor"),
              subtitle: Text("Teste"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text("200"),
              subtitle: Text("2000"),
            ),
          ),
        ],
      );
  }
}