import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:test_project/assets/assets.dart';
import 'package:test_project/core/routes/routes.dart';
import 'package:test_project/features/auth/presentation/widgets/action_button.dart';

import 'bloc/login_bloc.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "Авторизация",
          style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
        ),
        border: const Border(),
        transitionBetweenRoutes: false,
        backgroundColor: CupertinoColors.white,
      ),
      backgroundColor: AppColors.mainBGColor,
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              color: CupertinoColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoTextField.borderless(
                    controller: loginController,
                    onChanged: (val) {
                      context.read<LoginBloc>().add(LoginSubmitting(val));
                    },
                    placeholder: 'Логин или почта',
                    padding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                  const Divider(
                    color: AppColors.hintTextColor,
                    height: 1,
                  ),
                  CupertinoTextField.borderless(
                    controller: passwordController,
                    onChanged: (val) {
                      context.read<LoginBloc>().add(PasswordSubmitting(val));
                    },
                    obscureText: true,
                    placeholder: 'Пароль',
                    padding: const EdgeInsets.symmetric(vertical: 20),
                  )
                ],
              ),
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (_, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16).copyWith(bottom: 19),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state.loginStatus == FormzSubmissionStatus.failure)
                        Text(
                          state.errorMessage,
                          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.negativeTextColor,
                              ),
                        ),
                      const SizedBox(height: 4),
                      ActionButton(
                        inProgress: state.loginStatus,
                        label: "Войти",
                        onTap:
                            // state.login.isEmpty || state.password.isEmpty
                            //     ? null
                            () {
                          context.read<LoginBloc>().add(LoginEvent(
                                loginController.text,
                                passwordController.text,
                                () => Navigator.pushReplacementNamed(context, Routes.profile),
                              ));
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ActionButton(
                onTap: () {},
                label: "Зарегистрироваться",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
