import 'package:flutter/material.dart';
import 'package:kira_yonetim/database_helper.dart';

class RegisterContractScreen extends StatefulWidget {
  @override
  _RegisterContractScreenState createState() => _RegisterContractScreenState();
}

class _RegisterContractScreenState extends State<RegisterContractScreen> {
  final dbHelper = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _propertyController = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  TextEditingController _rentAmountController = TextEditingController();

  void _saveContract() async {
    if (_formKey.currentState!.validate()) {
      final contract = {
        'property': _propertyController.text.trim(),
        'start_date': _startDateController.text.trim(),
        'end_date': _endDateController.text.trim(),
        'rent_amount': _rentAmountController.text.trim(),
      };
      await dbHelper.insert('contracts', contract);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kontrat başarıyla kaydedildi')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kontrat Kayıt Ekranı'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _propertyController,
                decoration: InputDecoration(labelText: 'Kiralık Yer'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen kiralık yer giriniz';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _startDateController,
                decoration: InputDecoration(labelText: 'Başlangıç Tarihi'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen başlangıç tarihi giriniz';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _endDateController,
                decoration: InputDecoration(labelText: 'Bitiş Tarihi'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen bitiş tarihi giriniz';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _rentAmountController,
                decoration: InputDecoration(labelText: 'Kira Bedeli (₺)'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen kira bedeli giriniz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveContract,
                child: Text('Kaydet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
