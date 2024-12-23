import 'package:event_planner/core/utils/app_color.dart';
import 'package:event_planner/core/utils/app_styles.dart';
import 'package:event_planner/tabs/events/event_details_screen.dart';
import 'package:flutter/material.dart';

class EventItemWidegt extends StatelessWidget {
  const EventItemWidegt(
      {super.key,
      required this.image,
      required this.date,
      required this.title,
      required this.isFavorite});

  final String image;
  final String date;
  final String title;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailsScreen(),
          )),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: size.height * .3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
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
                date,
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
                    title,
                    style: AppStyles.bold14black,
                  )),
                  Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
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
