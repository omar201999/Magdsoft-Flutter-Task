import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:magdsoft_task/business_logic/main_cubit/main_cubit.dart';
import 'package:magdsoft_task/data/models/product_model.dart';
import 'package:magdsoft_task/presentation/router/app_router_names.dart';
import 'package:magdsoft_task/presentation/widgets/product_item.dart';

class GridStaggeredView extends StatelessWidget {
  final List<Products> list;
  const GridStaggeredView({Key? key,required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      padding: EdgeInsets.all(16.r),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
        pattern: [
          const WovenGridTile(5/9),
          const WovenGridTile(
            2/4,
            alignment: AlignmentDirectional.centerEnd,
            crossAxisRatio: 1,
          ),

        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
            (context, index) =>InkWell(
              onTap: ()
              {
                Navigator.pushNamed(context, AppRouterNames.rProductItemDetailsScreenRoute,arguments: list[index]);
              },
                child: ProductItem(productItem: list[index]),
            ),
        childCount: MainCubit.get(context).productModel!.products!.length,
      ),
    );
  }
}
