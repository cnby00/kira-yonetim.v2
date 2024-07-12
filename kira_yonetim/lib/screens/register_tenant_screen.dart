import 'package:flutter/material.dart';
import 'package:kira_yonetim/database_helper.dart';

class RegisterTenantScreen extends StatefulWidget {
  @override
  _RegisterTenantScreenState createState() => _RegisterTenantScreenState();
}

class _RegisterTenantScreenState extends State<RegisterTenantScreen> {
  final dbHelper = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  void _saveTenant() async {
    if (_formKey.currentState!.validate()) {
      final tenant = {
        'name': _nameController.text.trim(),
        'phone': _phoneController.text.trim(),
      };
      await dbHelper.insert('tenants', tenant);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kiracı başarıyla kaydedildi')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kiracı Kayıt Ekranı'),
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
                decoration: InputDecoration(labelText: 'İsim'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen isim giriniz';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Telefon'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen telefon giriniz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveTenant,
                child: Text('Kaydet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
