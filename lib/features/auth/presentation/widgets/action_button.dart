import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:test_project/assets/constants/app_colors.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.onTap,
    required this.label,
    this.inProgress = FormzSubmissionStatus.initial,
  });

  final Function()? onTap;
  final String label;
  final FormzSubmissionStatus inProgress;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: AppColors.actionButtonBG,
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: SizedBox(
        width: double.maxFinite,
        height: 64,
        child: inProgress == FormzSubmissionStatus.inProgress
            ? const CupertinoActivityIndicator(color: CupertinoColors.white,)
            : Center(
                child: Text(
                  label,
                  style: CupertinoTheme.of(context).textTheme.actionTextStyle,
                ),
              ),
      ),
    );
  }
}
