import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_task/business_logic/main_cubit/main_cubit.dart';
import 'package:magdsoft_task/presentation/widgets/category_item.dart';
import 'package:magdsoft_task/presentation/widgets/my_form_field.dart';

import '../../constants/assets_manager.dart';
import '../styles/colors.dart';
import '../widgets/regular_text.dart';

class TopOfHomeScreenView extends StatelessWidget {
   TopOfHomeScreenView({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 420.h,
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
          children:
          [
            Row(
              children: [
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: MyFormField(
                        controller: searchController,
                        validateText: '',
                        inputType: TextInputType.text,
                        hintText: 'Search',
                        maxLines: 1,
                        onChanged: (value) {},
                      ),
                    )),
                SizedBox(
                  width: 10.w,
                ),
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_alt, color: AppColor.grey,),
                  ),
                )
              ],
            ),
            SizedBox(height: 15.h,),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.r),),
              ),
              child: Image(image: AssetImage(
                  AssetsManager.cardImage),),
            ),
            SizedBox(height: 15.h,),
            Container(
              height: 52,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>CategoryItem(backgroundColor:index==0?AppColor.cyanBlue:AppColor.white ,imagePath:AssetsManager.categoryImagesPaths[index] ,categoryText:MainCubit.get(context).categoryTexts[index] ),
                separatorBuilder: (context, index) =>SizedBox(width: 10.w,),
                itemCount: 3,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
