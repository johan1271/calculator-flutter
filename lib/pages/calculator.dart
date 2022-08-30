import 'package:flutter/material.dart';
import 'app.dart';
import 'package:flutter/services.dart';
class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);
  State<StatefulWidget> createState() => _Calculator();
}

class _Calculator extends State<Calculator> {
  final _texto = TextEditingController();
  int _valor = 0;
  double result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Precio a pagar"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text("Precio total"),
          const SizedBox(height: 20),
          
          SizedBox(
            width: 200,
            child: TextField(
              controller: _texto,
              keyboardType: TextInputType.number,
              
              decoration: const InputDecoration(
                
                hintText: "Precio total",
              )),

          ),
          const SizedBox(height: 20),
          FloatingActionButton.extended(
            backgroundColor: Colors.amber,
            label: const Text("Descuento"),
            onPressed: _calcularDescuento,
          ),
          const SizedBox(height: 20),
          Text("Precio a pagar : $result"),
        ],
      )),
    );
  }

  void _calcularDescuento() {
  setState((){
    _valor = int.parse(_texto.text);
    if(_valor >= 120000){
      result = _valor * 0.90;

    }else{
      result = _valor.toDouble();
    }

  });
  
}

}


