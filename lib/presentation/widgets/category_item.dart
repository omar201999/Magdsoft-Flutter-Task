import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';
import 'package:magdsoft_task/presentation/widgets/regular_text.dart';

class CategoryItem extends StatelessWidget {
  final Color backgroundColor;
  final String imagePath;
  final String categoryText;

  CategoryItem({
    required this.backgroundColor,
    required this.imagePath,
    required this.categoryText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 129.w,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
        color: backgroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0.r),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(imagePath),
                  width: 28.w,
                  height: 28,
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            RegularText(
              text: categoryText,
              color: AppColor.black,
            ),
          ],
        ),
      ),
    );
  }
}
