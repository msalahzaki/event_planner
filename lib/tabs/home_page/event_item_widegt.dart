import 'package:event_planner/core/utils/app_color.dart';
import 'package:event_planner/core/utils/app_styles.dart';
import 'package:event_planner/providers/event_provider.dart';
import 'package:event_planner/tabs/events/event_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../model/category_model.dart';
import '../../model/event.dart';

class EventItemWidegt extends StatefulWidget {
  const EventItemWidegt({super.key, required this.event});

  final Event event;

  @override
  State<EventItemWidegt> createState() => _EventItemWidegtState();
}

class _EventItemWidegtState extends State<EventItemWidegt> {
  @override
  Widget build(BuildContext context) {
    var eventProvider = Provider.of<EventProvider>(context);
    String day = widget.event.date.day.toString();
    String month = DateFormat.MMM().format(widget.event.date);
    List<CategoryModel> categories = Categories.getCategories();
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailsScreen(
              event: widget.event,
            ),
          )),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: size.height * .3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: AssetImage(categories[widget.event.categoryID].image),
              fit: BoxFit.fill),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              height: size.height * 0.07,
              width: size.width * 0.12,
              decoration: BoxDecoration(
                color: AppColor.semiblue,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                "$day \n $month ",
                style: AppStyles.bold20blue,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.all(15),
              height: size.height * 0.05,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.semiblue,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    widget.event.title,
                    style: AppStyles.bold14black,
                  )),
                  IconButton(
                    onPressed: () {
                      eventProvider.updateDoc("isFavorite",
                          !widget.event.isFavorite, widget.event.id);

                      setState(() {});
                    },
                    icon: Icon(widget.event.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border),
                    color: AppColor.primaryLight,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
