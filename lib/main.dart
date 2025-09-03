import 'package:flutter/material.dart';

void main() => runApp(BankApp());

class BankApp extends StatelessWidget {
  const BankApp({super.key});

  @override
  Widget build(BuildContext build) {
    return MaterialApp(home: Scaffold(body: ListaTransferencias()));
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

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
      body: Column(
        children: <Widget>[
          Editor(
            controlador: _controladorCampoNumeroConta,
            rotulo: "Número da conta",
            dica: "000000",
          ),
          Editor(
            controlador: _controladorCampoValor,
            rotulo: "Valor",
            dica: "00.00",
            icone: Icons.monetization_on,
          ),
          ElevatedButton(
            child: Text("Confirmar"),
            onPressed: () {
              _criaTransferencia(
                context,
                _controladorCampoNumeroConta,
                _controladorCampoValor,
              );
            },
          ),
        ],
      ),
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 25.0),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {

final List<Transferencia> _transferencia = []; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transferências",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
        //foregroundColor: const Color.fromRGBO(10, 10, 10, 1),
      ),

      body: ListView(
        children: <Widget>[
          ItemTransferencia(Transferencia(100, 1000)),
          ItemTransferencia(Transferencia(200, 2000)),
          ItemTransferencia(Transferencia(300, 3000)),
          ItemTransferencia(Transferencia(100, 1000)),
          ItemTransferencia(Transferencia(200, 2000)),
          ItemTransferencia(Transferencia(300, 3000)),
          ItemTransferencia(Transferencia(100, 1000)),
          ItemTransferencia(Transferencia(200, 2000)),
          ItemTransferencia(Transferencia(300, 3000)),
          ItemTransferencia(Transferencia(100, 1000)),
          ItemTransferencia(Transferencia(200, 2000)),
          ItemTransferencia(Transferencia(300, 3000)),
          ItemTransferencia(Transferencia(100, 1000)),
          ItemTransferencia(Transferencia(200, 2000)),
          ItemTransferencia(Transferencia(300, 3000)),
          ItemTransferencia(Transferencia(100, 1000)),
          ItemTransferencia(Transferencia(200, 2000)),
          ItemTransferencia(Transferencia(300, 3000)),
          ItemTransferencia(Transferencia(100, 1000)),
          ItemTransferencia(Transferencia(200, 2000)),
          ItemTransferencia(Transferencia(300, 3000)),
          ItemTransferencia(Transferencia(100, 1000)),
          ItemTransferencia(Transferencia(200, 2000)),
          ItemTransferencia(Transferencia(300, 3000)),
          ItemTransferencia(Transferencia(100, 1000)),
          ItemTransferencia(Transferencia(200, 2000)),
          ItemTransferencia(Transferencia(300, 3000)),
          ItemTransferencia(Transferencia(100, 1000)),
          ItemTransferencia(Transferencia(200, 2000)),
          ItemTransferencia(Transferencia(300, 3000)),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Botão + pressionado");
          final Future future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioTransferencia();
              },
            ),
          );
          future.then((transferenciaRecebida) {
            debugPrint("Chegou no then do future");
            debugPrint("$transferenciaRecebida");
          });
        },
        child: Icon(Icons.add),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat(),
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

  @override
  String toString() {
    return "Transferência {valor: $valor, numeroConta $numeroConta}";
  }
}

void _criaTransferencia(
  BuildContext context,
  TextEditingController controladorCampoNumeroConta,
  TextEditingController controladorCampoValor,
) {
  final int? numeroConta = int.tryParse(controladorCampoNumeroConta.text);
  final double? valor = double.tryParse(controladorCampoValor.text);
  if (numeroConta != null && valor != null) {
    final Transferencia transferenciaCriada = Transferencia(valor, numeroConta);
    debugPrint("Criando Transferência");
    debugPrint(transferenciaCriada.toString());
    Navigator.pop(context, transferenciaCriada);
  }
}
