import 'package:event_planner/core/utils/app_color.dart';
import 'package:event_planner/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/event_provider.dart';
import '../home_page/event_item_widegt.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  String search = '';
  @override
  Widget build(BuildContext context) {
    //  List<CategoryModel> categories = Categories.getCategories();

    var provider = Provider.of<EventProvider>(context);
    provider.getEventsByFavorite();
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
                onChanged: (text) {
                  search = text;
                  setState(() {});
                },
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
              child: ListView.builder(
                itemCount: provider.eventFavoriteList.length,
                itemBuilder: (context, index) {
                  if (provider.eventFavoriteList[index].title
                      .toLowerCase()
                      .contains(search.toLowerCase())) {
                    return EventItemWidegt(
                        event: provider.eventFavoriteList[index]);
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
