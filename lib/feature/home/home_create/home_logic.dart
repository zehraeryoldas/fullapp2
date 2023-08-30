import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fullapp2/product/model/category.dart';
import 'package:fullapp2/product/utility/firebase/firebase_collections.dart';
import 'package:fullapp2/product/utility/firebase/firebase_utilty.dart';
import 'package:image_picker/image_picker.dart';

class HomeLogic with FirebaseUtility {
  final TextEditingController titleController = TextEditingController();
  CategoryModel? _categoryModel;

  //itemleri burada tutalım
  List<CategoryModel> _categories = [];

  List<CategoryModel> get categories => _categories;

  Uint8List? _selectedFileBytes;
  Uint8List? get selectedFileBytes => _selectedFileBytes;

  void updateCategory(CategoryModel categoryModel) {
    _categoryModel = categoryModel;
  }

  Future<void> imagePick() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    _selectedFileBytes = await image?.readAsBytes();
  }

//ekran kapandığında
  void dispose() {
    titleController.dispose();

    _categoryModel = null;
  }

  // Future<List<CategoryModel>> fetchAllCategory() async {
  Future<void> fetchAllCategory() async {
    final response = await fetchList<CategoryModel, CategoryModel>(
        CategoryModel(), FirebaseCollections.category);

    _categories = response ?? [];
  }
}
