import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdt_app/controllers/category_controller.dart';
import 'package:tmdt_app/models/category_models.dart';

class CategoryList extends StatefulWidget {
  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final CategoryController _categoryService = CategoryController();
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModels>>(
      future: _categoryService.fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Lỗi khi tải danh mục!"));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("Không có danh mục nào."));
        }

        List<CategoryModels> categories = snapshot.data!;
        for (var category in categories) {
          print("Category Name: ${category.categoryName}");
          print("Image URL: ${category.categoryImage}");
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 4, crossAxisSpacing: 8), 
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {

                  },
                  child: Column(
                    children: [
                      Image.network(categories[index].categoryImage, width: 40, height: 40, fit: BoxFit.cover,),
                      Text(categories[index].categoryName, 
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                );
            })
          ],
        );
      },
    );
  }
}
