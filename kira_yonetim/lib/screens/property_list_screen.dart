import 'package:flutter/material.dart';
import 'package:kira_yonetim/database_helper.dart';

class PropertyListScreen extends StatefulWidget {
  @override
  _PropertyListScreenState createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends State<PropertyListScreen> {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> propertyList = [];

  @override
  void initState() {
    super.initState();
    _fetchProperties();
  }

  void _fetchProperties() async {
    final properties = await dbHelper.queryAllRows('properties');
    setState(() {
      propertyList = properties;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kiralık Yer Listesi'),
      ),
      body: ListView.builder(
        itemCount: propertyList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(propertyList[index]['name']),
            subtitle: Text(propertyList[index]['location']),
          );
        },
      ),
    );
  }
}
