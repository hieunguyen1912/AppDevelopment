import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  static const String id = '/categoryScreen';
  const CategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
        Row(
          children: [
            Container(
              height: 140,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.grey.shade500,
                border: Border.all(
                  color: Colors.grey.shade800,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Upload Image ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Upload Image',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              width: 50,
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Category Name'),
              ),
            )
          ],
        )
      ],
    );
  }
}
