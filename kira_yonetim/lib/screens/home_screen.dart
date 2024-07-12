import 'package:flutter/material.dart';
import 'package:kira_yonetim/screens/register_contract_screen.dart';
import 'package:kira_yonetim/screens/register_tenant_screen.dart';
import 'package:kira_yonetim/screens/register_property_screen.dart';
import 'package:kira_yonetim/screens/collect_rent_screen.dart';
import 'package:kira_yonetim/screens/report_overdue_screen.dart';
import 'package:kira_yonetim/screens/lease_reminders_screen.dart';
import 'package:kira_yonetim/screens/support_screen.dart';
import 'package:kira_yonetim/screens/tenant_list_screen.dart';
import 'package:kira_yonetim/screens/contract_end_date_screen.dart';
import 'package:kira_yonetim/screens/property_list_screen.dart';
import 'package:kira_yonetim/screens/contract_list_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ana Ekran'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menü',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Destek'),
              onTap: () {
                Navigator.pushNamed(context, '/support');
              },
            ),
            ListTile(
              title: Text('Hakkında'),
              onTap: () {
                // Hakkında sayfası burada açılabilir
              },
            ),
            ListTile(
              title: Text('Lisans'),
              onTap: () {
                // Lisans sayfası burada açılabilir
              },
            ),
            ListTile(
              title: Text('Çıkış Yap'),
              onTap: () {
                // Çıkış yapma işlemi
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: <Widget>[
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: Icon(Icons.person_add),
                            title: Text('Kiracı Kayıt'),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, '/registerTenant');
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.home),
                            title: Text('Kiralık Yer Kayıt'),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, '/registerProperty');
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.article),
                            title: Text('Kontrat Kayıt'),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, '/registerContract');
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: 120,
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Yeni Kayıt',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Kiracı, kiralık yer veya kontrat kayıt',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Icon(Icons.add_circle_outline,
                        size: 48, color: Colors.blue),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: Icon(Icons.warning),
                            title: Text('Gecikmiş Kira Raporu'),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, '/reportOverdue');
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.alarm),
                            title: Text('Kira Hatırlatma'),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, '/leaseReminders');
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: 120,
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Raporlar',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Gecikmiş kiraları görüntüle',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Icon(Icons.assignment, size: 48, color: Colors.blue),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/tenantList');
              },
              child: Container(
                height: 120,
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kiracı Listesi',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Tüm kiracıları listele',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Icon(Icons.people, size: 48, color: Colors.blue),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ContractEndDateScreen()),
                );
              },
              child: Container(
                height: 120,
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kontrat Bitenler',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Sonlanan kontratları görüntüle',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Icon(Icons.event_busy, size: 48, color: Colors.blue),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/propertyList');
              },
              child: Container(
                height: 120,
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kiralık Yerler',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Tüm kiralık yerleri listele',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Icon(Icons.home, size: 48, color: Colors.blue),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/contractList');
              },
              child: Container(
                height: 120,
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kontrat Listesi',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Tüm kontratları listele',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Icon(Icons.article, size: 48, color: Colors.blue),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/collectRent');
        },
        child: Icon(Icons.attach_money),
        tooltip: 'Kira Tahsilatı',
      ),
    );
  }
}
