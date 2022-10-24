import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/business_logic/main_cubit/main_cubit.dart';
import 'package:magdsoft_task/constants/assets_manager.dart';
import 'package:magdsoft_task/presentation/router/app_router_names.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';
import 'package:magdsoft_task/presentation/widgets/headline_text.dart';
import 'package:magdsoft_task/presentation/widgets/my_button.dart';
import 'package:magdsoft_task/presentation/widgets/my_form_field.dart';
import 'package:magdsoft_task/presentation/widgets/regular_text.dart';
import 'package:magdsoft_task/presentation/widgets/show_toast.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var nameController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocConsumer<MainCubit, MainState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Image(
                image: AssetImage(AssetsManager.loginBackground),
              ),
              Expanded(
                child: Container(
                  width: 430.w,
                  //height: 617.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.r),
                        topLeft: Radius.circular(40.r),
                      ),
                      color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: AppColor.cyanBlue,
                              ),
                            ),
                            RegularText(text: 'OR',color: AppColor.cyanBlue,),
                            Expanded(
                              child: Divider(
                                color: AppColor.cyanBlue,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Image(
                                  image:
                                      AssetImage(AssetsManager.facebookImage),
                                ),
                                height: 52,
                                width: 52,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    color: AppColor.white),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Image(
                                  image:
                                      AssetImage(AssetsManager.iosImage),
                                ),
                                height: 52,
                                width: 52,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    color: AppColor.white),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Image(
                                  image:
                                      AssetImage(AssetsManager.googleImage),
                                ),
                                height: 52,
                                width: 52,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    color: AppColor.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 193,
            child: Container(
              width: 372.w,
              height: 345.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.r)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(12.r),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeadLineText(
                        text: 'Welcome',
                        decoration: TextDecoration.underline,
                        decorationColor: AppColor.cyanBlue,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      MyFormField(
                        controller: nameController,
                        validateText: 'Please Enter Your Name',
                        maxLines: 1,
                        inputType: TextInputType.name,
                        hintText: 'Enter Full Name',
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      MyFormField(
                        controller: phoneController,
                        validateText: 'Please Enter Your Phone',
                        hintText: 'Enter Your Phone Number ',
                        maxLines: 1,
                        inputType: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      MyButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              if (phoneController.text.length >= 11) {
                                MainCubit.get(context).login(phone: phoneController.text, name: nameController.text).then((value) {
                                  Navigator.pushNamed(context, AppRouterNames.rVerificationCodeRoute,arguments: phoneController.text);
                                });
                              } else {
                                showToast(
                                    text: 'Make sure that you insert 11 number',
                                    state: ToastStates.ERROR);
                              }
                            }
                          },
                          text: 'Login'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  },
);
  }
}
