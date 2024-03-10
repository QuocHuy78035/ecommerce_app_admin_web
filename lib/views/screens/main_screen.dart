import 'package:ecommerce_admin_web/views/screens/side_bar_screen/category_screen.dart';
import 'package:ecommerce_admin_web/views/screens/side_bar_screen/dash_board_screen.dart';
import 'package:ecommerce_admin_web/views/screens/side_bar_screen/order_screen.dart';
import 'package:ecommerce_admin_web/views/screens/side_bar_screen/product_screen.dart';
import 'package:ecommerce_admin_web/views/screens/side_bar_screen/upload_banner_screen.dart';
import 'package:ecommerce_admin_web/views/screens/side_bar_screen/vendor_screen.dart';
import 'package:ecommerce_admin_web/views/screens/side_bar_screen/widthdrawal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedItem = DashBoardScreen();

  screenSelector(item) {
    switch (item.route) {
      case (VendorScreen.routerName):
        setState(
              () {
            _selectedItem = const VendorScreen();
          },
        );
        break;
      case (CategoryScreen.routerName):
        setState(
              () {
            _selectedItem = const CategoryScreen();
          },
        );
        break;
      case (OrderScreen.routerName):
        setState(
              () {
            _selectedItem = const OrderScreen();
          },
        );
        break;
      case (ProductScreen.routerName):
        setState(
              () {
            _selectedItem = const ProductScreen();
          },
        );
        break;
      case (UploadBannerScreen.routerName):
        setState(
              () {
            _selectedItem = const UploadBannerScreen();
          },
        );
        break;
      case (DashBoardScreen.routerName):
        setState(
              () {
            _selectedItem = const DashBoardScreen();
          },
        );
        break;
      case (WidthdrawalScreen.routerName):
        setState(
              () {
            _selectedItem = const WidthdrawalScreen();
          },
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'Dashboard',
            icon: Icons.dashboard,
            route: DashBoardScreen.routerName,
          ),
          AdminMenuItem(
            title: 'Vendors',
            icon: Icons.person_3,
            route: VendorScreen.routerName,
          ),
          AdminMenuItem(
            title: 'Withdrawal',
            icon: Icons.money,
            route: WidthdrawalScreen.routerName,
          ),
          AdminMenuItem(
            title: 'Orders',
            icon: Icons.shopping_cart,
            route: OrderScreen.routerName,
          ),
          AdminMenuItem(
            title: 'Categories',
            icon: Icons.category,
            route: CategoryScreen.routerName,
          ),
          AdminMenuItem(
            title: 'Products',
            icon: Icons.shop,
            route: ProductScreen.routerName,
          ),
          AdminMenuItem(
            title: 'Upload Banners',
            icon: Icons.add_box,
            route: UploadBannerScreen.routerName,
          )
        ],
        selectedRoute: '',
        onSelected: (item) {
          screenSelector(item);
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'QuocHuy\'s Shop',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'footer',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: _selectedItem,
    );
  }
}
