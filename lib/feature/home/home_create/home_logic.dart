import 'package:flutter/material.dart';
import 'package:fullapp2/product/model/category.dart';
import 'package:fullapp2/product/utility/firebase/firebase_collections.dart';
import 'package:fullapp2/product/utility/firebase/firebase_utilty.dart';

class HomeLogic with FirebaseUtility {
  final TextEditingController titleController = TextEditingController();
  CategoryModel? _categoryModel;

  void updateCategory(CategoryModel categoryModel) {
    _categoryModel = categoryModel;
  }

  void dispose() {
    titleController.dispose();
    _categoryModel = null;
  }

  Future<List<CategoryModel>> fetchAllCategory() async {
    final response = await fetchList<CategoryModel, CategoryModel>(
        CategoryModel(), FirebaseCollections.category);

    return response ?? [];
  }
}
