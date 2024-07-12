import 'package:flutter/material.dart';

class ContractDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kontrat Detayı'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Kontrat Detay Ekranı'),
            // Detay bilgileri burada gösterilebilir
          ],
        ),
      ),
    );
  }
}
