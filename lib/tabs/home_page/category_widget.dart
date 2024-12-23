import 'package:event_planner/core/utils/app_color.dart';
import 'package:event_planner/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {super.key,
      required this.icon,
      required this.label,
      required this.isSelected,
       this.labelColorSelected=AppColor.primaryLight,
       this.labelColorunSelected=AppColor.white,
       this.bgColorSelected=AppColor.semiblue,
       this.bgColorunSelected=AppColor.transpernt});

  final IconData icon;
  final String label;
  final bool isSelected;
  final Color labelColorSelected;
  final Color labelColorunSelected;
  final Color bgColorSelected;
  final Color bgColorunSelected;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? bgColorSelected : bgColorunSelected,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: bgColorSelected, width: 2),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? labelColorSelected:labelColorunSelected,
          ),
          SizedBox(
            width: size.width * 0.01,
          ),
          Text(
            label,
            style:
                isSelected ? AppStyles.normal16blue.copyWith(color:labelColorSelected ) : AppStyles.normal16white.copyWith(color: labelColorunSelected ),
          )
        ],
      ),
    );
  }
}
