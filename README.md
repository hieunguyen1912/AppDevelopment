# MobileDevApp_N05
![image](https://github.com/user-attachments/assets/af10bd46-a66f-4be7-9002-af3dc5ddf41c)

![image](https://github.com/user-attachments/assets/67897c17-0783-4282-8d2a-0dcdcb94f23b)

![image](https://github.com/user-attachments/assets/1991050e-afaf-4af5-a44a-52fafc8057f4)

![image](https://github.com/user-attachments/assets/002e5df7-8eca-4090-aacd-2a9b25eaae02)

# Mã nguồn chính (`main.dart`)

Dưới đây là mã nguồn Flutter từ file `main.dart`:

```dart
import 'package:flutter/material.dart';

class User{
  String username;
  String password;
  String role;

  User({
    required this.username, required this.password, required this.role
  });
}

void main() {  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _UserGridState createState() => _UserGridState();
}

class _UserGridState extends State<HomePage> {
  List<User> users = [
    User(username: 'Nguyen Trung Hieu', password: '1234', role: 'guest'),
    User(username: 'Do Xuan Ha', password: '123456', role: 'guest'),
    User(username: 'Bui Hai Ha', password: '9876', role: 'guest'),
    User(username: 'Nguyen Tuan Minh', password: '1010', role: 'admin'),
    User(username: 'Bui Nam anh', password: '4567', role:'admin'),
  ]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang chủ'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2,
        ),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username: ${user.username}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text('Role: ${user.role}', style: TextStyle(fontSize: 14),)
                ],
              )
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Giỏ hàng'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tài khoản'),
        ],
      ),
    );
  }
}

