part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class LoginSuccessState extends MainState {}

class LoginErrorState extends MainState
{
  final String error;
  LoginErrorState(this.error);
}

class SendOtpSuccessState extends MainState {}

class SendOtpErrorState extends MainState
{
  final String error;
  SendOtpErrorState(this.error);
}


class GetHelpSuccessState extends MainState {}

class GetHelpErrorState extends MainState
{
  final String error;
  GetHelpErrorState(this.error);
}

class GetProductsSuccessState extends MainState {}

class GetProductsErrorState extends MainState
{
  final String error;
  GetProductsErrorState(this.error);
}

