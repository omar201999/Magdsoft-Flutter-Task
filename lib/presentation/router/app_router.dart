
import 'package:flutter/material.dart';
import 'package:magdsoft_task/data/models/product_model.dart';
import 'package:magdsoft_task/presentation/screens/shared/splash_screen.dart';
import 'package:magdsoft_task/presentation/screens/user/help_screen.dart';
import 'package:magdsoft_task/presentation/screens/user/login_screen.dart';
import 'package:magdsoft_task/presentation/screens/user/product_item_details.dart';
import 'package:magdsoft_task/presentation/screens/user/verification_code_screen.dart';

import '../screens/user/home_screen.dart';
import 'app_router_names.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterNames.rSplashScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case AppRouterNames.rLoginScreenRoute:
        return MaterialPageRoute(
          builder: (_) =>  const LoginScreen(),
        );
      case AppRouterNames.rVerificationCodeRoute:
        final String phoneNumber=settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) =>   VerificationCodeScreen(phoneNumber: phoneNumber,),
        );
      case AppRouterNames.rHomeScreenRoute:
        return MaterialPageRoute(
          builder: (_) =>   HomeScreen(),
        );
      case AppRouterNames.rHelpScreenRoute:
        return MaterialPageRoute(
          builder: (_) =>   HelpScreen(),
        );
        case AppRouterNames.rProductItemDetailsScreenRoute:
          final  Products productItem = settings.arguments as Products;
          return MaterialPageRoute(
          builder: (_) => ProductItemDetailsScreen(productItem: productItem,),
        );


      default:
        return null;
    }
  }
}
