import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';

ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: AppColor.cyanBlue,

    appBarTheme: AppBarTheme(
      titleSpacing: 15,
      elevation: 0,
      actionsIconTheme: IconThemeData(
        color: AppColor.cyanBlue,
      ),
      backgroundColor: AppColor.cyanBlue,
      iconTheme: IconThemeData(
        color: AppColor.cyanBlue,
      ),
      titleTextStyle: TextStyle(
        fontSize: 24.sp,
        color: AppColor.cyanBlue,
        fontWeight: FontWeight.bold,
        fontFamily: 'SemiBold',
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      //backgroundColor: defaultColor,
      selectedItemColor: AppColor.cyanBlue,
      unselectedItemColor: Colors.black54,
      elevation: 20,
      selectedLabelStyle: TextStyle(
        fontFamily: 'Regular',
        fontSize: 17.sp,
      ),
     /* unselectedLabelStyle: TextStyle(
        fontFamily: 'Regular',
        fontSize: 17.sp,
      ),
      selectedIconTheme: IconThemeData(
        size: 30,
      ),
      unselectedIconTheme: IconThemeData(
        size: 30,
      ),*/
    ),
    iconTheme: IconThemeData(
      color: AppColor.cyanBlue,
    ),
    //fontFamily: 'SemiBold',
    //cardColor: AppColor.white,
    cardTheme: CardTheme(
      color: AppColor.white,
      elevation: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.r),),
      ),
    )
);
