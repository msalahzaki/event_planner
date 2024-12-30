import 'package:event_planner/core/utils/app_color.dart';
import 'package:event_planner/core/utils/app_styles.dart';
import 'package:event_planner/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../model/category_model.dart';
import '../../model/event.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({super.key, required this.event});

  final Event event;
  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  late EventProvider eventProvider;

  List<CategoryModel> categories = Categories.getCategories();
  @override
  Widget build(BuildContext context) {
    eventProvider = Provider.of<EventProvider>(context);
    Size size = MediaQuery.of(context).size;
    var local = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.semiblue,
        title: Text(
          local.event_details,
          style: AppStyles.normal16blue,
        ),
        actions: [
          const Icon(
            Icons.edit,
            color: AppColor.primaryLight,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              deleteEvent();
            },
            color: AppColor.red,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Category Image
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                height: size.height * .2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image:
                          AssetImage(categories[widget.event.categoryID].image),
                      fit: BoxFit.fill),
                ),
              ),
              Text(
                widget.event.title,
                style: AppStyles.normal24blue,
              ),
              SizedBox(
                height: size.height * .01,
              ),
              // Date And Time
              ListTile(
                shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: AppColor.primaryLight,
                    ),
                    borderRadius: BorderRadius.circular(15.0)),
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.primaryLight),
                  child: const Icon(
                    Icons.calendar_month,
                    color: AppColor.white,
                  ),
                ),
                title: Text(
                    DateFormat('dd MMMM yyyy').format(widget.event.date),
                    style: AppStyles.normal16blue),
                subtitle: Text(
                  widget.event.time,
                  style: AppStyles.normal16black,
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              //Location Information
              ListTile(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: AppColor.primaryLight,
                      ),
                      borderRadius: BorderRadius.circular(15.0)),
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.primaryLight),
                    child: const Icon(
                      Icons.my_location_outlined,
                      color: AppColor.white,
                    ),
                  ),
                  title: Text(" Cairo , Egypt", style: AppStyles.normal16blue),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: AppColor.primaryLight,
                  )),
              SizedBox(
                height: size.height * .01,
              ),
              // Map
              Container(
                height: size.height * .3,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColor.primaryLight),
                ),
              ),
              Text(
                local.description,
                style: AppStyles.normal16black,
              ),
              Text(
                widget.event.description,
                style: AppStyles.normal16black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void deleteEvent() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this Event?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                eventProvider.deleteEvent(widget.event.id).timeout(
                  Durations.short1,
                  onTimeout: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Item deleted successfully!')),
                    );
                    eventProvider.changeSelectedcategory(-1);
                    Navigator.of(context).pop();
                  },
                );
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
