import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/business_logic/bloc_observer.dart';
import 'package:magdsoft_task/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_task/business_logic/main_cubit/main_cubit.dart';
import 'package:magdsoft_task/data/local/cache_helper.dart';
import 'package:magdsoft_task/presentation/router/app_router_names.dart';
import 'package:magdsoft_task/presentation/styles/themes.dart';

import 'presentation/router/app_router.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({required this.appRouter, Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) {
        return MultiBlocProvider(
          providers:
          [
            BlocProvider(create: (context) =>MainCubit()..getHelps()..getProducts()),
          ],
          child: BlocConsumer<MainCubit, MainState>(
            listener: (context, state) {
            },
            builder: (context, state) {
              return MaterialApp(
                onGenerateRoute: appRouter.onGenerateRoute,
                debugShowCheckedModeBanner: false,
              );
            },
          ),
        );
      },
    );
  }
}

