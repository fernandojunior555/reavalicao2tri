import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _selectedOption1 = 'Opção 1';
  String? _selectedOption2 = 'A';
  List<String> _optionsForOption2 = ['A', 'B', 'C'];
  Map<String, String> _optionValues = {
    'A': 'Valor para A',
    'B': 'Valor para B',
    'C': 'Valor para C',
    'X': 'Valor para X',
    'Y': 'Valor para Y',
    'Z': 'Valor para Z',
    'M': 'Valor para M',
    'N': 'Valor para N',
    'O': 'Valor para O',
  };

  String _selectedOptionsText = '';

  void addToCart(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListViewPage(selectedOption1: _selectedOption1, selectedOption2: _selectedOption2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COMPRAR TÊNIS'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: _selectedOption1,
              items: <String>['Opção 1', 'Opção 2', 'Opção 3'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOption1 = newValue;
                  if (newValue == 'Opção 1') {
                    _optionsForOption2 = ['A', 'B', 'C'];
                  } else if (newValue == 'Opção 2') {
                    _optionsForOption2 = ['X', 'Y', 'Z'];
                  } else if (newValue == 'Opção 3') {
                    _optionsForOption2 = ['M', 'N', 'O'];
                  }
                  _selectedOption2 = _optionsForOption2[0];
                  _selectedOptionsText = 'Opção 1: $_selectedOption1, Opção 2: $_selectedOption2';
                });
              },
            ),
            DropdownButton<String>(
              value: _selectedOption2,
              items: _optionsForOption2.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOption2 = newValue;
                  _selectedOptionsText = 'Opção 1: $_selectedOption1, Opção 2: $_selectedOption2';
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Seleção atual:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              _selectedOptionsText,
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                addToCart(context);
              },
              child: Text('Adicionar ao Carrinho'),
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewPage extends StatelessWidget {
  final String? selectedOption1;
  final String? selectedOption2;

  ListViewPage({this.selectedOption1, this.selectedOption2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Itens no Carrinho'),
      ),
      body: Center(
        child: Text(
          'Itens selecionados: $selectedOption1 - $selectedOption2',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
