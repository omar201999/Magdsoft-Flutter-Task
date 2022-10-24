import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/business_logic/main_cubit/main_cubit.dart';
import 'package:magdsoft_task/constants/constants.dart';
import 'package:magdsoft_task/presentation/router/app_router_names.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';
import 'package:magdsoft_task/presentation/view/pin_code_field_view.dart';
import 'package:magdsoft_task/presentation/widgets/default_text_button.dart';
import 'package:magdsoft_task/presentation/widgets/headline_text.dart';
import 'package:magdsoft_task/presentation/widgets/my_button.dart';

class VerificationCodeScreen extends StatelessWidget {
  final String phoneNumber;
  final formKey = GlobalKey<FormState>();
  VerificationCodeScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<MainCubit, MainState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor:AppColor.white ,
      body:SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
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
                child: Padding(
                  padding:  EdgeInsets.all(16.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      HeadLineText(text: 'Verify Phone',color: AppColor.white,),
                      SizedBox(height: 30.h,),
                      PinCodeVerificationView(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultTextButton(onPressed: () {
                  }, text: 'Resend Code',color: AppColor.cyanBlue,),
                ],
              ),
              SizedBox(height: 30.h,),
              MyButton(onPressed: ()
              {
                if(formKey.currentState!.validate())
                {
                  MainCubit.get(context).sendOtp(phone: phoneNumber, code: codeNumber).then((value) {
                    Navigator.pushReplacementNamed(context, AppRouterNames.rHelpScreenRoute);
                  });
                }

              }, text: 'Verify',padding: EdgeInsets.symmetric(horizontal: 16.r),borderRadius: 20),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
