import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tmdt_app/models/category_models.dart';

class CategoryController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<CategoryModels>> fetchCategories() async {
    List<CategoryModels> categories = [];

    try {
      QuerySnapshot snapshot = await _firestore.collection('categories').get();
      for (var doc in snapshot.docs) {
        print("Dữ liệu nhận từ Firestore: ${doc.data()}");

        categories.add(CategoryModels(
          categoryName: doc["categoryName"] ?? "Không có tên",
          categoryImage: doc["categoryImage"] ?? "",
        ));
      }
    } catch (e) {
      print("Lỗi khi lấy danh mục: $e");
    }
    return categories;
  }
}