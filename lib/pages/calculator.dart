import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  
  @override
  State<StatefulWidget> createState() => _Calculator();
}

class _Calculator extends State<Calculator> {
  final _texto = TextEditingController();
  int _valor = 0;
  double result = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 67, 112),
      appBar: AppBar(
        title: const Text("Precio a pagar"),
        centerTitle: true,
      ),
      body: Center(

          child: SizedBox(
            height: 400,
            
            child: Column(
            
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            
            const Text("Precio total"),
            
            SizedBox(
              width: 200,
              child:  TextField(
                  
                  controller: _texto,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: const TextStyle(
                    color:  Colors.amber,
                     
                  ),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                    
                    
                    hintText: "Precio" ,
                    hintStyle: TextStyle(color: Colors.amber),
                    
                  )),
            ),
            
            FloatingActionButton.extended(
              backgroundColor: Colors.amber,
              label: const Text("Descuento"),
              onPressed: _calcularDescuento,
            ),
            
            
            Text("Precio a pagar : $result"),
        ],
      ),
          )),
    );
  }

  void _calcularDescuento() {
    setState(() {
      _valor = int.parse(_texto.text);
      if (_valor >= 120000) {
        result = _valor * 0.90;
      } else {
        result = _valor.toDouble();
      }
    });
  }
}
