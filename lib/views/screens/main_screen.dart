import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade900,
        title: Text("Management"),
      ),
        sideBar: SideBar(
          items: [
            AdminMenuItem(title: "DashBoard", icon: Icons.dashboard, route: '/'),
            AdminMenuItem(title: "Vendors", icon: Icons.person_3, route: '/'),
            AdminMenuItem(title: "Widthdrawal", icon: Icons.money, route: '/'),
            AdminMenuItem(title: "Orders", icon: Icons.shopping_cart, route: '/'),
            AdminMenuItem(title: "Category", icon: Icons.category, route: '/'),
            AdminMenuItem(title: "Upload Banner", icon: Icons.add, route: '/'),
            AdminMenuItem(title: "Products", icon: Icons.shop, route: '/'),
          ],
          selectedRoute: '',
        ),
        body: Text("Dash")
    );
  }
}
