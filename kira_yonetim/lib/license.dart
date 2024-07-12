import 'package:flutter/material.dart';

class LicenseScreen extends StatefulWidget {
  @override
  _LicenseScreenState createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> {
  bool _isLicensed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uygulama Lisansı'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              _isLicensed ? 'Uygulama lisanslı' : 'Uygulama lisanslı değil',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: _isLicensed ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 30.0),
            Icon(
              _isLicensed ? Icons.check_circle : Icons.cancel,
              size: 100.0,
              color: _isLicensed ? Colors.green : Colors.red,
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isLicensed = !_isLicensed;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                  if (_isLicensed) {
                    return Colors.red;
                  }
                  return Colors.green;
                }),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
                child: Text(
                  _isLicensed ? 'Lisansı Kaldır' : 'Lisansla',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LicenseScreen(),
  ));
}
