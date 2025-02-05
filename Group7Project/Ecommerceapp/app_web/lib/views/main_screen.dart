import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Management'),
      ),
      body: const Text(
        'Dashboard',
      ),
      sideBar: const SideBar(
        items: [
          AdminMenuItem(
            title: 'Vendors',
            route: "",
            icon: CupertinoIcons.person_3,
          ),
          AdminMenuItem(
            title: 'Buyer',
            route: "",
            icon: CupertinoIcons.person,
          ),
          AdminMenuItem(
            title: 'Categoris',
            route: "",
            icon: Icons.category,
          ),
          AdminMenuItem(
            title: 'Banner',
            route: "",
            icon: CupertinoIcons.person,
          ),
        ],
        selectedRoute: '',
      ),
    );
  }
}
