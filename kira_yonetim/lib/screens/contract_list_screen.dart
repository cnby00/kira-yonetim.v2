import 'package:flutter/material.dart';
import 'package:kira_yonetim/database_helper.dart';

class ContractListScreen extends StatefulWidget {
  @override
  _ContractListScreenState createState() => _ContractListScreenState();
}

class _ContractListScreenState extends State<ContractListScreen> {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> contractList = [];

  @override
  void initState() {
    super.initState();
    _fetchContracts();
  }

  void _fetchContracts() async {
    final contracts = await dbHelper.queryAllRows('contracts');
    setState(() {
      contractList = contracts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kontrat Listesi'),
      ),
      body: ListView.builder(
        itemCount: contractList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contractList[index]['property']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Başlangıç Tarihi: ${contractList[index]['start_date']}'),
                Text('Bitiş Tarihi: ${contractList[index]['end_date']}'),
                Text('Kira Bedeli: ${contractList[index]['rent_amount']} ₺'),
              ],
            ),
          );
        },
      ),
    );
  }
}
