import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:test_project/assets/assets.dart';
import 'package:test_project/assets/constants/app_consts.dart';
import 'package:test_project/core/routes/routes.dart';
import 'package:test_project/core/singleton/service_locator.dart';
import 'package:test_project/core/storage/storage_repo.dart';
import 'package:test_project/features/auth/presentation/bloc/login_bloc.dart';
import 'package:test_project/features/profile/presentation/widgets/profile_header.dart';
import 'package:test_project/features/profile/presentation/widgets/tab_items.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ValueNotifier<int> indexChanger = ValueNotifier(3);
  CupertinoTabController controller = CupertinoTabController(initialIndex: 3);

  @override
  void initState() {
    super.initState();

    /// There is a token then we get the details from shared
    if (StorageRepository
        .getString(AppConstants.token)
        .isNotEmpty) context.read<LoginBloc>().add(EnterEvent());
    controller.addListener(() {
      if (controller.index == 3) {
        indexChanger.value = controller.index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: controller,
      tabBar: CupertinoTabBar(
        border: const Border(),
        currentIndex: 3,
        items: [
          BottomNavigationBarItem(
            icon: ValueListenableBuilder(
              valueListenable: indexChanger,
              builder: (BuildContext context, int value, Widget? child) {
                return TabItem(
                  label: "Лента",
                  icon: AppIcons.tape,
                  isSelected: value == 0,
                );
              },
            ),
          ),
          BottomNavigationBarItem(
            icon: ValueListenableBuilder(
              valueListenable: indexChanger,
              builder: (BuildContext context, int value, Widget? child) {
                return TabItem(
                  label: "Карта",
                  icon: AppIcons.map,
                  isSelected: value == 1,
                );
              },
            ),
          ),
          BottomNavigationBarItem(
            icon: ValueListenableBuilder(
              valueListenable: indexChanger,
              builder: (BuildContext context, int value, Widget? child) {
                return TabItem(
                  label: "Избранные",
                  icon: AppIcons.saved,
                  isSelected: value == 2,
                );
              },
            ),
          ),
          BottomNavigationBarItem(
            icon: ValueListenableBuilder(
              valueListenable: indexChanger,
              builder: (BuildContext context, int value, Widget? child) {
                return TabItem(
                  label: "Профиль",
                  icon: AppIcons.user,
                  isSelected: value == 3,
                );
              },
            ),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            middle: Text(
              "Профиль",
            ),
            automaticallyImplyLeading: false,
            border: Border(),
            backgroundColor: CupertinoColors.white,
          ),
          backgroundColor: AppColors.mainBGColor,
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return ProfileHeader(
                name: state.loginEntity.user.nickname,
                gMail: state.loginEntity.user.email,
                onLogout: logout,
              );
            },
          ),
        );
      },
    );
  }

  logout() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext _) {
        return CupertinoAlertDialog(
          title: const Text("Want to logout?"),
          actions: [
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text("Yes"),
              onPressed: () {
                context.read<LoginBloc>().add(LogOutEvent(
                      () {
                    Navigator.pushReplacementNamed(context, Routes.auth);
                  },
                ));
              },
            ),
            CupertinoDialogAction(
              child: const Text("No"),
              onPressed: () {
                Navigator.pop(_);
              },
            ),
          ],
        );
      },
    );
  }
}
