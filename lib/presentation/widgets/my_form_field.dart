
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

class MyFormField extends StatelessWidget {
  final IconData? prefix;
  final IconData? suffix;

  final TextEditingController controller;

  final String validateText;

  final bool isPassword;

  final double borderRadius;

  final bool readOnly;

  final TextInputType inputType;

  final String? hintText;
  final String? labelText;
  final TextAlign textAlign;
   final Color borderColor;
    final int? maxLines;

  final Function()? suffixPressed;
  final void Function(String)? onChanged;


  const MyFormField({
    Key? key,
    this.borderRadius = 15,
    this.borderColor=AppColor.blue,
    required this.controller,
    required this.validateText,
    required this.maxLines,
    this.suffixPressed,
    this.onChanged,
    this.isPassword = false,
    required this.inputType,
    this.hintText,
    this.prefix,
    this.suffix,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      child: TextFormField(
        maxLines: maxLines,
        readOnly: readOnly,
        onChanged: onChanged,
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return validateText;
          }
          return null;
        },
        obscureText: isPassword,
        keyboardType: inputType,
        textAlign: textAlign,
        decoration: InputDecoration(
          suffixIcon:prefix == null ? null : IconButton(
            onPressed: suffixPressed,
            icon: Icon(
              suffix,
              color: AppColor.greyOfText,
            ),
          ),
          prefixIcon: prefix == null ? null :Icon(
            prefix,
            color: AppColor.greyOfText,
          ),
          hintText: hintText ,
          labelText: labelText ,

          labelStyle:
              const TextStyle(color: AppColor.greyOfText),
          hintStyle:
              const TextStyle(color: AppColor.greyOfText,height:1),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide:  BorderSide(
                    color: borderColor,
                  ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide: const BorderSide(
              color: AppColor.red,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide: const BorderSide(
              color: AppColor.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide:  const BorderSide(
                    color: AppColor.lightGrey,
                    width: 2.0,
                  ),
          ),
          fillColor: AppColor.backGroundColor,
          filled: true,
        ),
        style: const TextStyle(color: AppColor.black),
      ),
    );
  }
}
