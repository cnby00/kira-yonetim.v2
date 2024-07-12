import 'package:flutter/material.dart';
import 'package:kira_yonetim/database_helper.dart';

class CollectRentScreen extends StatefulWidget {
  @override
  _CollectRentScreenState createState() => _CollectRentScreenState();
}

class _CollectRentScreenState extends State<CollectRentScreen> {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> tenantList = [];
  TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchTenants();
  }

  void _fetchTenants() async {
    final tenants = await dbHelper.queryAllRows('tenants');
    setState(() {
      tenantList = tenants;
    });
  }

  void _collectRent(String tenantId) async {
    final rent = {
      'tenant_id': tenantId,
      'amount': _amountController.text.trim(),
      'date': DateTime.now().toIso8601String(),
    };
    await dbHelper.insert('rents', rent);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Kira başarıyla tahsil edildi')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kira Tahsilatı'),
      ),
      body: ListView.builder(
        itemCount: tenantList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tenantList[index]['name']),
            subtitle: Text(tenantList[index]['phone']),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: _amountController,
                          decoration: InputDecoration(
                            labelText: 'Tahsil Edilen Miktar',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            _collectRent(tenantList[index]['id'].toString());
                          },
                          child: Text('Tahsil Et'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
