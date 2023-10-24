import 'package:flutter/material.dart';
import 'package:aula/database_helper.dart'; // Certifique-se de importar o seu arquivo database_helper.dart aqui

class AddTennisPage extends StatefulWidget {
  @override
  _AddTennisPageState createState() => _AddTennisPageState();
}

class _AddTennisPageState extends State<AddTennisPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController();

  void _addNewTennis() {
    final name = _nameController.text;
    final imageUrl = _imageUrlController.text;

    // Adicione o novo tênis ao banco de dados usando o método insertTennis do DatabaseHelper
    DatabaseHelper.instance.insertTennis(name, imageUrl);

    // Navegue de volta à página anterior (página principal ou outra página).
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Novo Tênis'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome do Tênis',
              ),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(
                labelText: 'URL da Imagem',
              ),
            ),
            ElevatedButton(
              onPressed: _addNewTennis,
              child: Text('Adicionar Tênis'),
            ),
          ],
        ),
      ),
    );
  }
}
