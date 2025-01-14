import 'package:flutter/material.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tiêu đề
                  Text(
                    'Strawberry Pavlova',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. '
                    'Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.',
                    style: TextStyle(fontSize: 10),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.red, size: 10.0),
                            Icon(Icons.star, color: Colors.red, size: 10.0),
                            Icon(Icons.star, color: Colors.red, size: 10.0),
                            Icon(Icons.star, color: Colors.red, size: 10.0),
                            Icon(Icons.star_half, color: Colors.red, size: 10.0),
                          ],
                        ),
                        Flexible(
                          child: Text(
                            '170 reviews',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.timer, size: 15.0,),
                          SizedBox(height: 2),
                          Text('PREP:',  style: TextStyle(fontSize: 10)),
                          Text('25 min',  style: TextStyle(fontSize: 10)),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.restaurant, size: 15.0,),
                          SizedBox(height: 2),
                          Text('COOK:',  style: TextStyle(fontSize: 10)),
                          Text('1 hr',  style: TextStyle(fontSize: 10)),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.people,size: 15.0,),
                          SizedBox(height: 2),
                          Text('FEEDS:', style: TextStyle(fontSize: 10)),
                          Text('4-6', style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Image.asset(
                'assets/shoe.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
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