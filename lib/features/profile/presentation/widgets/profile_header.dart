import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/assets/constants/app_colors.dart';
import 'package:test_project/assets/constants/app_icons.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.name,
    required this.gMail,
    required this.onLogout,
  });

  final String name;
  final String gMail;
  final Function() onLogout;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 38),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.userBig,
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              gMail,
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondTextColor,
                  ),
            ),
            const SizedBox(height: 27),
            CupertinoListTile(
              padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 13),
              backgroundColor: CupertinoColors.white,
              title: Text(
                'Выйти',
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.negativeTextColor,
                    ),
              ),
              onTap: onLogout,
            ),
          ],
        ),
      ),
    );
  }
}
