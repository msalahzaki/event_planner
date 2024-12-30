import 'package:event_planner/core/utils/app_color.dart';
import 'package:event_planner/core/utils/app_styles.dart';
import 'package:event_planner/model/category_model.dart';
import 'package:event_planner/providers/event_provider.dart';
import 'package:event_planner/tabs/home_page/category_widget.dart';
import 'package:event_planner/tabs/home_page/event_item_widegt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
  }

  List<CategoryModel> categories = Categories.getCategories();

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    var eventProvider = Provider.of<EventProvider>(context);
    Size size = MediaQuery.of(context).size;

    if (eventProvider.eventFilteredList.isEmpty &&
        eventProvider.selectedCategory == -1) {
      eventProvider.getEventsByCategory();
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.1,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              local.welcome_back,
              style: AppStyles.normal14white,
            ),
            Text(
              "Mohamed Salah",
              style: AppStyles.bold24white,
            ),
            Row(children: [
              const Icon(
                Icons.location_on_sharp,
                color: AppColor.white,
              ),
              Text(
                "Cairo ,Egypt",
                style: AppStyles.normal14white,
              )
            ])
          ],
        ),
        actions: [
          const Icon(
            Icons.sunny,
            color: AppColor.white,
          ),
          SizedBox(
            width: size.width * 0.02,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColor.semiblue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "EN",
              style: AppStyles.bold14blue,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: size.height * 0.08,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
                color: Theme.of(context).primaryColor),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    eventProvider.changeSelectedcategory(-1);
                  },
                  child: SizedBox(
                    height: double.infinity,
                    child: CategoryWidget(
                      icon: Icons.clear_all,
                      label: "All ",
                      isSelected: eventProvider.selectedCategory == -1,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          eventProvider.changeSelectedcategory(index);
                        },
                        child: CategoryWidget(
                          icon: categories[index].icon,
                          label: categories[index].name,
                          isSelected: index == eventProvider.selectedCategory,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: eventProvider.eventFilteredList.isEmpty
                  ? const Center(
                      child: Text("No Item Found"),
                    )
                  : ListView.builder(
                      itemCount: eventProvider.eventFilteredList.length,
                      itemBuilder: (context, index) {
                        return EventItemWidegt(
                            event: eventProvider.eventFilteredList[index]);
                      }))
        ],
      ),
    );
  }
}
