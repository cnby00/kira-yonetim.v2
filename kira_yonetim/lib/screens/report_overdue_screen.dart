import 'package:flutter/material.dart';

class ReportOverdueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kira Gecikme Raporlama Ekranı'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ReportList(),
        ),
      ),
    );
  }
}

class ReportList extends StatelessWidget {
  final List<String> gecikmisKiracilar = [
    'Ahmet Yılmaz',
    'Ayşe Demir',
    'Mehmet Öztürk',
    'Zeynep Kaya',
    'Ali Tekin',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gecikmisKiracilar.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Text(gecikmisKiracilar[index]),
            subtitle: Text('Kira gecikmiş'),
            trailing: Icon(Icons.info),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Kira Gecikme Detayı'),
                    content: Text('Kiracı: ${gecikmisKiracilar[index]}'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Kapat'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
