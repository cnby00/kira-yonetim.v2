import 'package:flutter/material.dart';

class LeaseRemindersScreen extends StatelessWidget {
  final List<String> approachingLeases = [
    'Ali Yılmaz',
    'Ayşe Demir',
    'Mehmet Öztürk',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kira Hatırlatma Ekranı'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ReminderList(approachingLeases: approachingLeases),
        ),
      ),
    );
  }
}

class ReminderList extends StatelessWidget {
  final List<String> approachingLeases;

  ReminderList({required this.approachingLeases});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: approachingLeases.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Text(approachingLeases[index]),
            subtitle: Text('Kira bitiş tarihi yaklaşıyor'),
            trailing: IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                // Kiracı detayları ekranı veya işlemi burada yapılabilir
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Kira Hatırlatma Detayı'),
                      content: Text('Kiracı: ${approachingLeases[index]}'),
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
          ),
        );
      },
    );
  }
}
