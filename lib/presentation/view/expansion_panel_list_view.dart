import 'package:flutter/material.dart';
import 'package:magdsoft_task/business_logic/main_cubit/main_cubit.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';
import 'package:magdsoft_task/presentation/widgets/medium_text.dart';
import 'package:magdsoft_task/presentation/widgets/regular_text.dart';

class ExpansionPanelListView extends StatefulWidget {
  const ExpansionPanelListView({Key? key}) : super(key: key);

  @override
  State<ExpansionPanelListView> createState() => _ExpansionPanelListViewState();
}

class _ExpansionPanelListViewState extends State<ExpansionPanelListView> {
  List<bool> isOpen = List<bool>.filled(5, false);

  @override
  Widget build(BuildContext context) {
    return  ExpansionPanelList(
      elevation: 3,
      expansionCallback: (index, isExpanded) {
        setState(() {
          isOpen[index] = !isExpanded;
        });
      },
      animationDuration: const Duration(milliseconds: 600),
      children:
      [
        ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor:
         AppColor.white,
          headerBuilder: (_, isExpanded) => Container(
              padding:
              EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: MediumText(text:MainCubit.get(context).helpModel!.help![0].question!),),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: RegularText(text: MainCubit.get(context).helpModel!.help![0].answer!,),
          ),
          isExpanded: isOpen[0],
        ),
        ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor:
          AppColor.white,
          headerBuilder: (_, isExpanded) => Container(
            padding:
            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: MediumText(text:MainCubit.get(context).helpModel!.help![1].question!),),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: RegularText(text: MainCubit.get(context).helpModel!.help![1].answer!,),
          ),
          isExpanded: isOpen[1],
        ),
        ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor:
          AppColor.white,
          headerBuilder: (_, isExpanded) => Container(
            padding:
            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: MediumText(text:MainCubit.get(context).helpModel!.help![2].question!),),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: RegularText(text: MainCubit.get(context).helpModel!.help![2].answer!,),
          ),
          isExpanded: isOpen[2],
        ),
        ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor:
          AppColor.white,
          headerBuilder: (_, isExpanded) => Container(
            padding:
            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: MediumText(text:MainCubit.get(context).helpModel!.help![3].question!),),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: RegularText(text: MainCubit.get(context).helpModel!.help![3].answer!,),
          ),
          isExpanded: isOpen[3],
        ),
        ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor:
          AppColor.white,
          headerBuilder: (_, isExpanded) => Container(
            padding:
            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: MediumText(text:MainCubit.get(context).helpModel!.help![4].question!),),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: RegularText(text: MainCubit.get(context).helpModel!.help![4].answer!,),
          ),
          isExpanded: isOpen[4],
        ),

      ],
    );
  }
}
