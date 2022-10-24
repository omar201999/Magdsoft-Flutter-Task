import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/constants/assets_manager.dart';
import 'package:magdsoft_task/data/local/cache_helper.dart';
import 'package:magdsoft_task/presentation/router/app_router_names.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  dynamic code = CacheHelper.getDataFromSharedPreference(key:'code');
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => code==null?Navigator.pushReplacementNamed(context, AppRouterNames.rLoginScreenRoute):Navigator.pushReplacementNamed(context, AppRouterNames.rHomeScreenRoute));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.cyanBlue,
      child: Center(
        child: Image(
          image: AssetImage(AssetsManager.splashImage),
          width: 269.r,
          height: 208.h,
        ),
      ),
    );
  }
}
