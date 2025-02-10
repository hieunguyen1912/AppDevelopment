import 'package:flutter/material.dart';
import 'package:tmdt_app/views/screens/nav_screens/widgets/banner_widgets.dart';
import 'package:tmdt_app/views/screens/nav_screens/widgets/header_widgets.dart';
import 'package:tmdt_app/views/screens/nav_screens/widgets/category_widgets.dart';
import 'package:tmdt_app/views/screens/nav_screens/widgets/recommended_product_widget.dart';
import 'package:tmdt_app/views/screens/nav_screens/widgets/reusable_text_widgets.dart';
class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            BannerWidget(),
            CategoryList(),
            ReusableTextWidgets(title: "Recommended", subtitle: "View all"),
            RecommendedProductWidget(),
          ],
        ),
      ),
    );
  }
}
