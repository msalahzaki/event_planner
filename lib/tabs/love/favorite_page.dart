import 'package:event_planner/core/utils/app_color.dart';
import 'package:event_planner/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../model/category_model.dart';
import '../home_page/event_item_widegt.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = Categories.getCategories();
    Size size = MediaQuery.of(context).size;
    var local = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: size.height * .005),
              child: TextField(
                style: AppStyles.bold14blue,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: AppColor.primaryLight)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.primaryLight)),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColor.primaryLight,
                    ),
                    hintText: local.search_for_event,
                    hintStyle: AppStyles.bold14blue),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  EventItemWidegt(
                      image: categories[1].image,
                      date: "22 Dec",
                      title: "This is a Birthday Party ",
                      isFavorite: true),
                  EventItemWidegt(
                      image: categories[2].image,
                      date: "22 Dec",
                      title: "Meeting for Updating The Development Method",
                      isFavorite: true),
                  EventItemWidegt(
                      image: categories[3].image,
                      date: "22 Dec",
                      title: "",
                      isFavorite: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
