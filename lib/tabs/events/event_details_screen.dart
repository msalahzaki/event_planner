import 'package:event_planner/core/utils/app_assets.dart';
import 'package:event_planner/core/utils/app_color.dart';
import 'package:event_planner/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({super.key});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
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
          Icon(
            Icons.edit,
            color: AppColor.primaryLight,
          ),
          Icon(
            Icons.delete,
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
                      image: AssetImage(AppAssets.Meeting), fit: BoxFit.fill),
                ),
              ),
              Text(
                "Title ",
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
                title: Text("21-Novamber - 2024", style: AppStyles.normal16blue),
                subtitle: Text(
                  "12:12 PM",
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
                "event description",
                style: AppStyles.normal16black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
