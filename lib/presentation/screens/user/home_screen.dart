import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:magdsoft_task/business_logic/main_cubit/main_cubit.dart';
import 'package:magdsoft_task/constants/assets_manager.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';
import 'package:magdsoft_task/presentation/styles/icon_broken.dart';
import 'package:magdsoft_task/presentation/view/grid_view.dart';
import 'package:magdsoft_task/presentation/view/top_of_home_screen_view.dart';
import 'package:magdsoft_task/presentation/widgets/headline_text.dart';
import 'package:magdsoft_task/presentation/widgets/medium_text.dart';
import 'package:magdsoft_task/presentation/widgets/regular_text.dart';
import 'package:magdsoft_task/presentation/widgets/show_toast.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            showToast(text: 'You can\'t come back', state: ToastStates.NOTE);
            return false;
          },
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColor.cyanBlue,
              onPressed: () {},
              child: const Icon(IconBroken.Home),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation
                .centerDocked,
            bottomNavigationBar: BottomAppBar(
              color: AppColor.white,
              shape: const CircularNotchedRectangle(),
              notchMargin: 5,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.r),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.logout,
                        color: AppColor.grey,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.favorite,
                        color: AppColor.grey,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.notification_add,
                        color: AppColor.grey,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.settings,
                        color: AppColor.grey,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopOfHomeScreenView(),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 16.r),
                      child: const HeadLineText(text: 'Recommended\nFor You',maxLines: 2,isUpper: false,),
                    ),
                    ConditionalBuilder(
                      condition: MainCubit.get(context).productModel!.products!.isNotEmpty,
                      builder: (context)=>GridStaggeredView(list:MainCubit.get(context).productModel!.products!),
                      fallback: (context) => const Center(child: CircularProgressIndicator(),),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
