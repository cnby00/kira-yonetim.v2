import 'package:flutter/material.dart';
import 'package:kira_yonetim/database_helper.dart';

class TenantListScreen extends StatefulWidget {
  @override
  _TenantListScreenState createState() => _TenantListScreenState();
}

class _TenantListScreenState extends State<TenantListScreen> {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> tenantList = [];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kiracı Listesi'),
      ),
      body: ListView.builder(
        itemCount: tenantList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tenantList[index]['name']),
            subtitle: Text(tenantList[index]['phone']),
          );
        },
      ),
    );
  }
}
