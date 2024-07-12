import 'package:flutter/material.dart';
import 'package:kira_yonetim/screens/home_screen.dart';
import 'package:kira_yonetim/screens/register_screen.dart'; // Kayıt ekranını ekledik

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kira Yonetim - Giriş'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: LoginForm(), // LoginForm widget'ını ekledik
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterScreen()), // Kayıt ekranını aç
          );
        },
        tooltip: 'Kayıt Ol',
        child: Icon(Icons.person_add),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            labelText: 'Kullanıcı Adı',
          ),
        ),
        SizedBox(height: 20.0),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Şifre',
          ),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            // Geçici olarak kullanıcı adı ve şifre doğrulaması
            String username = _usernameController.text.trim();
            String password = _passwordController.text.trim();

            if (username == 'admin' && password == '123456') {
              // Başarılı giriş durumunda ana ekranı aç
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            } else {
              // Hatalı giriş uyarısı
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Kullanıcı adı veya şifre yanlış!')),
              );
            }
          },
          child: Text('Giriş Yap'),
        ),
      ],
    );
  }
}
