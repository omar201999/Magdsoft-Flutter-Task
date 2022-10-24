import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/constants/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';
import 'package:flutter/gestures.dart';

import '../styles/colors.dart';

class PinCodeVerificationView extends StatefulWidget {
  const PinCodeVerificationView({Key? key}) : super(key: key);

  @override
  State<PinCodeVerificationView> createState() => _PinCodeVerificationViewState();
}

class _PinCodeVerificationViewState extends State<PinCodeVerificationView> {
  var onTapRecognizer;
  TextEditingController textEditingController = TextEditingController();
  late StreamController<ErrorAnimationType> errorController;
  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }
  Widget build(BuildContext context) {
    textEditingController.text = codeNumber;
    return PinCodeTextField(
      appContext: context,
      pastedTextStyle: TextStyle(
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
      ),
      length: 4,
      obscureText: false,
      //obscuringCharacter: '*',
      blinkWhenObscuring: true,
      autoFocus: true,
      animationType: AnimationType.fade,
      validator: (v) {
        if (v!.length < 4) {
          return "Enter full Code";
        } else {
          return null;
        }
      },
      textStyle: TextStyle(
          color: AppColor.grey
      ),
      cursorColor: AppColor.blue,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(15.r),
        fieldHeight: 80.h,
        fieldWidth: 70.w,
        activeColor: AppColor.white,
        inactiveColor: AppColor.white,
        inactiveFillColor: AppColor.white,
        activeFillColor: AppColor.white,
        selectedColor: AppColor.white,
        selectedFillColor: AppColor.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      errorAnimationController: errorController,
      controller: textEditingController,
      keyboardType: TextInputType.number,
      onCompleted: (v) {
        debugPrint("Completed");
      },
      onChanged: (value) {
        debugPrint(value);
        setState(() {
          currentText = value;
        });
      },
      beforeTextPaste: (text) {
        return true;
      },
    );
  }
}
