import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/data/models/product_model.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';
import 'package:magdsoft_task/presentation/widgets/medium_text.dart';

import 'regular_text.dart';

class ProductItem extends StatelessWidget {
  final Products productItem;
   const ProductItem({Key? key, required this.productItem}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: AppColor.white,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height: 158.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.r),bottomRight: Radius.circular(15.r),),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(
                          0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Image(image:  NetworkImage(productItem.image!),width: 144.w,height: 114.h,),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite, color: AppColor.red,),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: Padding(
              padding:  EdgeInsetsDirectional.only(start: 12.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   MediumText(text: productItem.company!,color: AppColor.cyanBlue,maxLines: 1,fontSize: 22,),
                  const SizedBox(height: 10,),
                   RegularText(text: productItem.name!,maxLines: 2,),
                  SizedBox(height: 20.h,),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       RegularText(text: '${productItem.price!} EGP'),
                      Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r),bottomRight: Radius.circular(15.r)),
                          color: AppColor.cyanBlue,

                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add, color: AppColor.white,),
                        ),
                      )

                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
