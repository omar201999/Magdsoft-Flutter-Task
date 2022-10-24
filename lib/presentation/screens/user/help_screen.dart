import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/business_logic/main_cubit/main_cubit.dart';
import 'package:magdsoft_task/presentation/router/app_router_names.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';
import 'package:magdsoft_task/presentation/view/expansion_panel_list_view.dart';
import 'package:magdsoft_task/presentation/widgets/headline_text.dart';
import 'package:magdsoft_task/presentation/widgets/my_button.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();

}

class _HelpScreenState extends State<HelpScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor:AppColor.white ,
          body:SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children:
              [
                Container(
                  width: double.infinity,
                  height: 420.h,
                  decoration:   BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,

                      colors:
                      [
                        Color.fromRGBO(0, 98, 189, 1),
                        Color.fromRGBO(0, 98, 189, 0),
                      ],
                    ),
                  ),
                  child:Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        HeadLineText(text: 'Help',color: AppColor.white,),

                      ],
                    ),
                  ),
                ),
                const ExpansionPanelListView(),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: MyButton(text: 'Continue',onPressed: ()
            {
              Navigator.pushReplacementNamed(context, AppRouterNames.rHomeScreenRoute);
            },
                borderRadius: 20.r),
          ),

        );
      },
    );
  }

}
