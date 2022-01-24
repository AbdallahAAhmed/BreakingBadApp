import 'package:flutter/material.dart';
import 'app_router.dart';
import 'constants/my_colors.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {

  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.onGenerateRoute,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: MyColors.WHITE,
          ),
        ),
      ),
    );
  }
}