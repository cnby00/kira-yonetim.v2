import 'package:flutter/material.dart';
import 'package:kira_yonetim/screens/login_screen.dart'; // Doğru import
import 'package:kira_yonetim/screens/home_screen.dart';
import 'package:kira_yonetim/screens/register_contract_screen.dart';
import 'package:kira_yonetim/screens/register_tenant_screen.dart';
import 'package:kira_yonetim/screens/register_property_screen.dart';
import 'package:kira_yonetim/screens/collect_rent_screen.dart';
import 'package:kira_yonetim/screens/report_overdue_screen.dart';
import 'package:kira_yonetim/screens/lease_reminders_screen.dart';
import 'package:kira_yonetim/screens/support_screen.dart';
import 'package:kira_yonetim/screens/tenant_list_screen.dart'; // Kiracı listesi ekranı
import 'package:kira_yonetim/screens/contract_end_date_screen.dart'; // Kontrat bitiş tarihi ekranı
import 'package:kira_yonetim/database_helper.dart'; // SQLite helper sınıfı

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kira Yönetim',
      theme: ThemeData(
        primaryColor: Colors.blue, // Ana renk olarak mavi belirlendi
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login', // Başlangıç ekranı
      routes: {
        '/login': (context) => LoginScreen(), // Kullanıcı giriş ekranı
        '/home': (context) => HomeScreen(), // Ana ekran
        '/registerTenant': (context) => RegisterTenantScreen(), // Kiracı kayıt ekranı
        '/registerProperty': (context) => RegisterPropertyScreen(), // Kiralık yer kayıt ekranı
        '/registerContract': (context) => RegisterContractScreen(), // Yeni kontrat kayıt ekranı
        '/collectRent': (context) => CollectRentScreen(), // Kira tahsilat ekranı
        '/reportOverdue': (context) => ReportOverdueScreen(), // Kira gecikme raporlama ekranı
        '/leaseReminders': (context) => LeaseRemindersScreen(), // Kira hatırlatma ekranı
        '/support': (context) => SupportScreen(), // Destek ekranı
        '/tenantList': (context) => TenantListScreen(), // Kiracı listesi ekranı
        '/contractEndDate': (context) => ContractEndDateScreen(), // Kontrat bitiş tarihi ekranı
      },
    );
  }
}
