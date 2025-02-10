import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final List<String> bannerImages = [
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
    'assets/images/banner3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 32),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 170,
        decoration: BoxDecoration(
          color: Color(0xFFF7F7F7),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 2), 
            )
          ]
        ),
        child: PageView.builder(
          itemCount: bannerImages.length,
          itemBuilder: (context, index) {
            return Image.asset(
              bannerImages[index],
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
