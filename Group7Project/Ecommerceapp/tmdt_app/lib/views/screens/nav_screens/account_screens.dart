import 'package:flutter/material.dart';
import 'package:tmdt_app/views/screens/authentication_screens/login_screens.dart'; // Import màn hình đăng nhập
import 'package:tmdt_app/views/screens/inner_screens/order_screen.dart';
import 'package:tmdt_app/views/screens/nav_screens/cart_screens.dart'; // Import màn hình giỏ hàng

class AccountScreens extends StatelessWidget {

  const AccountScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Bỏ nút "Back"
        title: const Text('Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                          'assets/images/avatar.png'), // Thay thế bằng đường dẫn ảnh đại diện của bạn
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'username', // Hiển thị tên tài khoản
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildAccountOption(
              context,
              icon: Icons.person,
              label: 'Personal Information',
              onTap: () {
                // Add your personal information functionality here
              },
            ),
            _buildAccountOption(
              context,
              icon: Icons.shopping_cart,
              label: 'My Orders',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrderScreen()),
                );
              },
            ),
            _buildAccountOption(
              context,
              icon: Icons.settings,
              label: 'Settings',
              onTap: () {
                // Add your settings functionality here
              },
            ),
            _buildAccountOption(
              context,
              icon: Icons.help,
              label: 'Help Center',
              onTap: () {
                // Add your help center functionality here
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50), // Set the height
                backgroundColor: Colors.red, // Set the background color
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountOption(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(label),
        onTap: onTap,
      ),
    );
  }
}
