import 'package:event_planner/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  final String name;

  final String image;

  final IconData icon;

  CategoryModel({required this.name, required this.image, required this.icon});
}

class Categories {
  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];
    categories.add(CategoryModel(
        name: "Birthday",
        image: AppAssets.Birthday,
        icon: Icons.card_giftcard));
    categories.add(CategoryModel(
        name: "Sport",
        image: AppAssets.Sport,
        icon: Icons.directions_bike_rounded));
    categories.add(CategoryModel(
        name: "Eating", image: AppAssets.Eating, icon: Icons.fastfood));
    categories.add(CategoryModel(
        name: "Gaming", image: AppAssets.Gaming, icon: Icons.videogame_asset));
    categories.add(CategoryModel(
        name: "Book Club", image: AppAssets.Book_Club, icon: Icons.book_sharp));
    categories.add(CategoryModel(
        name: "Holiday", image: AppAssets.Holiday, icon: Icons.free_breakfast));
    categories.add(CategoryModel(
        name: "Meeting", image: AppAssets.Meeting, icon: Icons.people_sharp));
    categories.add(CategoryModel(
        name: "WorkShop", image: AppAssets.Workshop, icon: Icons.work));
    categories.add(CategoryModel(
        name: "Exhibition", image: AppAssets.Exhibition, icon: Icons.photo));
    return categories;
  }
}
