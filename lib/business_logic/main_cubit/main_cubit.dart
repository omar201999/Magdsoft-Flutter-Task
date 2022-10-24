import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/constants/constants.dart';
import 'package:magdsoft_task/constants/end_points.dart';
import 'package:magdsoft_task/data/local/cache_helper.dart';
import 'package:magdsoft_task/data/models/help_model.dart';
import 'package:magdsoft_task/data/models/product_model.dart';
import 'package:magdsoft_task/data/remote/web_service.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  Future<void> login({
    required String phone,
    required String name,
  }) async{
    await WebService().publicDio.post(
          verifyPhone,
          data: {
            'phone': phone,
            'name': name,
          },
        ).then((value) {
          codeNumber = value.data['code'];
          CacheHelper.saveDataSharedPreference(key: 'code', value: codeNumber);
          emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginErrorState(error));
      debugPrint(error);
    });
  }

  Future<void> sendOtp({
    required String phone,
    required String code,
  }) async{
    await WebService().publicDio.post(
      otp,
      data: {
        'code': code,
        'phone': phone,
      },
    ).then((value) {
      emit(SendOtpSuccessState());
    }).catchError((error) {
      emit(SendOtpErrorState(error));
      debugPrint(error);
    });
  }
  HelpModel? helpModel ;
  Future<void> getHelps()
  async{
    await WebService().publicDio.get(
      getHelp,
    ).then((value) {
      helpModel = HelpModel.fromJson(value.data);
      emit(GetHelpSuccessState());
    }).catchError((error) {
      emit(GetHelpErrorState(error));
      debugPrint(error);
    });
  }

  ProductModel? productModel ;
  Future<void> getProducts()
  async{
    await WebService().publicDio.get(
      getProduct,
    ).then((value) {
      productModel = ProductModel.fromJson(value.data);
      emit(GetProductsSuccessState());
    }).catchError((error) {
      emit(GetProductsErrorState(error));
      debugPrint(error);
    });
  }

  List<String> categoryTexts= [
    'All',
    'Acer',
    'Razer'
  ];
}
