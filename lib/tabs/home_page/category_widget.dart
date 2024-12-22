import 'package:event_planner/core/utils/app_color.dart';
import 'package:event_planner/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {super.key,
      required this.icon,
      required this.label,
      required this.isSelected});

  final IconData icon;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColor.semiblue : AppColor.transpernt,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColor.white, width: 2),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? AppColor.primaryLight : AppColor.white,
          ),
          SizedBox(
            width: size.width * 0.01,
          ),
          Text(
            label,
            style:
                isSelected ? AppStyles.normal16blue : AppStyles.normal16white,
          )
        ],
      ),
    );
  }
}
