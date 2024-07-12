import 'package:flutter/material.dart';
import 'package:kira_yonetim/screens/contract_detail_screen.dart'; // Buraya import ettiğimiz paket adıyla düzeltildi

class ContractEndDateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kontrat Bitiş Tarihleri'),
      ),
      body: ListView.builder(
        itemCount: 10, // Örnek olarak 10 kontrat listeleniyor
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Kontrat ${index + 1}'),
            subtitle: Text('Bitiş Tarihi: 31.12.2024'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Kontrat detayına gitmek için navigasyon
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContractDetailScreen()),
              );
            },
          );
        },
      ),
    );
  }
}
