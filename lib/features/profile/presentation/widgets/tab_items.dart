import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/assets/constants/app_colors.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
  });

  final String label;
  final String icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 3, bottom: 4),
          child: SvgPicture.asset(
            icon,
            height: 24,
            color: isSelected ? AppColors.actionButtonBG : null,
          ),
        ),
        Text(
          label,
          style: CupertinoTheme.of(context)
              .textTheme
              .textStyle
              .copyWith(fontSize: 10, fontWeight: FontWeight.w400, color: isSelected ? AppColors.actionButtonBG : null),
        ),
      ],
    );
  }
}
