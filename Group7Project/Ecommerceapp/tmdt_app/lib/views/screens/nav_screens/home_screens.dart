import 'package:flutter/material.dart';
import 'package:tmdt_app/views/screens/nav_screens/widgets/banner_widgets.dart';
import 'package:tmdt_app/views/screens/nav_screens/widgets/header_widgets.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            BannerWidget(),
          ],
        ),
      ),
    );
  }
}
