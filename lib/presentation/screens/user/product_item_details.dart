import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/business_logic/main_cubit/main_cubit.dart';
import 'package:magdsoft_task/constants/assets_manager.dart';
import 'package:magdsoft_task/data/models/product_model.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';
import 'package:magdsoft_task/presentation/widgets/category_item.dart';
import 'package:magdsoft_task/presentation/widgets/headline_text.dart';
import 'package:magdsoft_task/presentation/widgets/medium_text.dart';
import 'package:magdsoft_task/presentation/widgets/my_button.dart';
import 'package:magdsoft_task/presentation/widgets/regular_text.dart';

class ProductItemDetailsScreen extends StatelessWidget {
  final Products productItem;
  const ProductItemDetailsScreen({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 600.h,
                decoration: BoxDecoration(
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
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Row(
                        children: [
                          Container(
                            height: 56.h,
                            width: 56.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: AppColor.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios, color: AppColor.grey,),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15.h,),
                      HeadLineText(text: productItem.name!,color: AppColor.white,maxLines: 1,fontSize: 22,isUpper: false),
                      SizedBox(height: 10.h,),
                      MediumText(text: 'Type: ${productItem.type!}',color: AppColor.white,maxLines: 1,),
                      SizedBox(height: 15.h,),
                      Container(
                        width: 364.w,
                        height: 300.h,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: AppColor.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),

                        child: Padding(
                          padding:  EdgeInsets.all(12.r),
                          child: Image(image: NetworkImage(productItem.image!),width: 277.w,height: 220.h,),
                        ),
                      ),
                      SizedBox(height: 15.h,),
                      Container(
                        height: 100.h,
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>Container(
                            width: 100.w,
                            height: 100.h,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: AppColor.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(12.r),
                              child: Image(image: NetworkImage(MainCubit.get(context).productModel!.products![index].image!),width: 71.w,height: 54.h,),
                            ),
                          ),
                          separatorBuilder: (context, index) =>SizedBox(width: 15.w,),
                          itemCount: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.r),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children:
                          [
                            Container(
                              width: 55.w,
                              height: 55.h,
                              decoration: BoxDecoration(
                                color: Color(0xfff3f3f3),
                                borderRadius: BorderRadius.all(Radius.circular(15.r))
                              ),
                              child: Center(child: RegularText(text: 'acer',color: Colors.amber,)),
                            ),
                            SizedBox(width: 10.w,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              [
                                MediumText(text: 'Acer Official Store',color: AppColor.black,),
                                SizedBox(height: 8.h,),
                                RegularText(text: 'View Store',),
                              ],
                            ),
                            Spacer(),
                            Container(
                              height: 30.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: Color(0xfff3f3f3),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child:Icon(
                                Icons.keyboard_arrow_right_sharp, color: AppColor.cyanBlue,),
                            )

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                      [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            RegularText(text: 'Price'),
                            SizedBox(height: 10,),
                            RegularText(text: productItem.price!,color: AppColor.black,),
                          ],
                        ),
                        MyButton(onPressed: (){}, text: 'Add To Catt',isUpper: false,width: 208.w,),
                      ],
                    ),
                    SizedBox(height: 15.h,),
                    Divider(
                      color: AppColor.grey,

                    ),
                    SizedBox(height: 15.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                      [
                        RegularText(text: 'Overview',color: AppColor.black,),
                        RegularText(text: 'Spesification',),
                        RegularText(text: 'Review',),
                      ],
                    ),
                    SizedBox(height: 30.h,),
                    RegularText(text: productItem.description!,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
