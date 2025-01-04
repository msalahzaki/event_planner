import 'package:event_planner/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryModel {
  final String name;

  final String image;

  final IconData icon;

  CategoryModel({required this.name, required this.image, required this.icon});
}

class Categories {
  static List<CategoryModel> getCategories(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    List<CategoryModel> categories = [];
    categories.add(CategoryModel(
        name: local.birthday,
        image: AppAssets.Birthday,
        icon: Icons.card_giftcard));
    categories.add(CategoryModel(
        name: local.sport,
        image: AppAssets.Sport,
        icon: Icons.directions_bike_rounded));
    categories.add(CategoryModel(
        name: local.eating, image: AppAssets.Eating, icon: Icons.fastfood));
    categories.add(CategoryModel(
        name: local.gaming,
        image: AppAssets.Gaming,
        icon: Icons.videogame_asset));
    categories.add(CategoryModel(
        name: local.book_Club,
        image: AppAssets.Book_Club,
        icon: Icons.book_sharp));
    categories.add(CategoryModel(
        name: local.holiday,
        image: AppAssets.Holiday,
        icon: Icons.free_breakfast));
    categories.add(CategoryModel(
        name: local.meeting,
        image: AppAssets.Meeting,
        icon: Icons.people_sharp));
    categories.add(CategoryModel(
        name: local.workShop, image: AppAssets.Workshop, icon: Icons.work));
    categories.add(CategoryModel(
        name: local.exhibition,
        image: AppAssets.Exhibition,
        icon: Icons.photo));
    return categories;
  }
}
