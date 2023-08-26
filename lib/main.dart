import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/core/routes/routes.dart';
import 'package:test_project/core/singleton/service_locator.dart';
import 'package:test_project/core/storage/storage_repo.dart';
import 'package:test_project/features/auth/presentation/bloc/login_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginBloc(),
        )
      ],
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: const CupertinoThemeData(
          brightness: Brightness.light,
          textTheme: CupertinoTextThemeData(
            textStyle: TextStyle(
              fontFamily: "Manrope",
              fontWeight: FontWeight.w500,
              color: CupertinoColors.black,
            ),
            navTitleTextStyle: TextStyle(
              fontFamily: "Manrope",
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: CupertinoColors.black,
            ),
            actionTextStyle: TextStyle(
              fontFamily: "Manrope",
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: CupertinoColors.white,
            ),
          ),
        ),
        title: 'Test App',
        onGenerateRoute: (settings) => Routes.generateRoutes(settings),
      ),
    );
  }
}
