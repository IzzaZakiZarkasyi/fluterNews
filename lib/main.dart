import 'package:flutter/material.dart';
import 'package:flutter_application_1/header_drawer.dart';
import 'package:flutter_application_1/profil.dart';
import 'package:flutter_application_1/pengaturan.dart';
import 'package:flutter_application_1/logout.dart';
import 'package:flutter_application_1/berlangganan.dart';
import 'package:flutter_application_1/screen/product_detail_screen.dart';
import 'package:flutter_application_1/screen/products_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text("Hot News"),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: MaterialApp(
            home: Column(
              children: [
                const MyHeaderDrawer(),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Beranda"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Pengaturan"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const Pengaturan())));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.money),
                  title: const Text("Berlangganan"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const Berlangganan())));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.people),
                  title: const Text("Profil"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const Profil())));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("Log Out"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const LogOut())));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const ProdctListScreen(),
    routes: {
      ProdctListScreen.routeName: (context) => const ProdctListScreen(),
      ProductDetailScreen.routeName: (context) => const ProductDetailScreen()
    },
  );
}
