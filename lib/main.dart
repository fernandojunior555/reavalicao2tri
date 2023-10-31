import 'package:flutter/material.dart';
import 'my_home_page.dart'; 


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MINHA LOJA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageNavigationDemo(),
    );
  }
}

class PageNavigationDemo extends StatefulWidget {
  @override
  _PageNavigationDemoState createState() => _PageNavigationDemoState();
}

class _PageNavigationDemoState extends State<PageNavigationDemo> {
  PageController _pageController = PageController(initialPage: 0);

  void _navigateToProfilePage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfilePage(),
      ),
    );
  }

  void _navigateToNewPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewPage(),
      ),
    );
  }

  void _handleButtonClick() {
    // Adicione a animação desejada aqui
    print('Botão clicado!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TENIS'),
        actions: [
          InkWell(
            onTap: () {
              _navigateToProfilePage();
              _handleButtonClick();
            },
            child: Icon(Icons.person),
          ),
          InkWell(
            onTap: () {
              _navigateToNewPage();
              _handleButtonClick();
            },
            child: Icon(Icons.arrow_forward),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('MB.01', style: TextStyle(fontSize: 24)),
                SizedBox(height: 20),
                Image.network(
                    'https://artwalk.vteximg.com.br/arquivos/ids/245305/tenis-puma-mb01-lamelo-purple-masculino-1.jpg?v=637853022544430000',
                  height: 150,
                ),
                SizedBox(height: 20),
                Image.network(
                   'https://artwalk.vteximg.com.br/arquivos/ids/242036/tenis-puma-lamelo-mb-01-not-from-here-masculino-1.jpg?v=637781990103400000', 
                  width: 150,
                  height: 150,
                ),
              ],
            ),
          ),


          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('MB.02', style: TextStyle(fontSize: 24)),
                SizedBox(height: 20),
                Image.network(
                  'https://d3ugyf2ht6aenh.cloudfront.net/stores/002/029/660/products/0261-f6297648e68bbf7cf516733572712037-640-0.webp', 
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 20),
                Image.network(
                   'https://artwalk.vteximg.com.br/arquivos/ids/374575-1000-1000/37741-1-002-5.jpg?v=638169182043670000', 
                  width: 150,
                  height: 150,
                ),
              ],
            ),
          ),

       
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('MB.03', style: TextStyle(fontSize: 24)),
                SizedBox(height: 20),
                Image.network(
                    'https://sneakerbardetroit.com/wp-content/uploads/2023/06/PUMA-MB.03-GutterMelo-379231-01-Release-Date.jpg',
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 20),
                Image.network(
                    'https://justfreshkicks.com/wp-content/uploads/2023/05/64662a7aca9cbf5fca875e6e_Frame-8026.png', 
                  width: 150,
                  height: 150,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
 
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://www.google.com/url?sa=i&url=https%3A%2F%2Fge.globo.com%2Ffutebol%2Ffutebol-internacional%2Fnoticia%2F2022%2F12%2F14%2Fretorno-a-vista-cristiano-ronaldo-treina-no-real-madrid.ghtml&psig=AOvVaw01aEBgMeQai81gwHMCGFzb&ust=1695933250253000&source=images&cd=vfe&opi=89978449&ved=0CA4QjRxqFwoTCOj8g63Sy4EDFQAAAAAdAAAAABAD',
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: Text('Selecionar Foto'),
                  ),
                ],
              ),
            );
          } else if (index == 1) {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}





class _NewPageState extends State<NewPage> {
  TextEditingController _firstNumberController = TextEditingController();
  TextEditingController _secondNumberController = TextEditingController();
  String _result = '';

  void _calculateSum() {
    final firstNumber = double.tryParse(_firstNumberController.text) ?? 0.0;
    final secondNumber = double.tryParse(_secondNumberController.text) ?? 0.0;
    final sum = firstNumber + secondNumber;
    setState(() {
      _result = 'Valor do pix que vai fazer pra mim: $sum REAIS ';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DOAÇÃO'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _firstNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'VALOR : ', 
              ),
            ),
            TextField(
              controller: _secondNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'CPF',
              ),
            ),
            ElevatedButton(
              onPressed: _calculateSum,
              child: Text('FAZER DOAÇÃO'),
            ),
            SizedBox(height: 16),
            Text(
              _result,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16), 
            Image.asset(
  'assets/pix.jpg',
  width: 150,
  height: 150,
  fit: BoxFit.contain,
)

          ],
        ),
      ),
    );
  }
  
}