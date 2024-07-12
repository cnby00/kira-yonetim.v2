import 'package:flutter/material.dart';
import 'package:kira_yonetim/database_helper.dart';

class RegisterPropertyScreen extends StatefulWidget {
  @override
  _RegisterPropertyScreenState createState() => _RegisterPropertyScreenState();
}

class _RegisterPropertyScreenState extends State<RegisterPropertyScreen> {
  final dbHelper = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  void _saveProperty() async {
    if (_formKey.currentState!.validate()) {
      final property = {
        'name': _nameController.text.trim(),
        'location': _locationController.text.trim(),
      };
      await dbHelper.insert('properties', property);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kiralık yer başarıyla kaydedildi')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kiralık Yer Kayıt Ekranı'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Ad'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen ad giriniz';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Konum'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen konum giriniz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProperty,
                child: Text('Kaydet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
