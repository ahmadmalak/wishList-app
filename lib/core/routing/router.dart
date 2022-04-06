
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/core/routing/route_constants.dart';
import 'package:test_app/ui/auth/login.dart';
import 'package:test_app/ui/home/wishlist_screen.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreenRoute:
        return MaterialPageRoute(builder: (_) =>  LoginScreen());
      case WishListScreenRoute:
        return MaterialPageRoute(builder: (_) =>  WishListScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}

pushNamed(
    {required BuildContext context,
      required String routeName,
      dynamic arguments}) {
  if (arguments != null) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  } else {
    Navigator.pushNamed(context, routeName);
  }
}

pushNamedAndClearStack(BuildContext context, String routeName) {
  Navigator.of(context).pushAndRemoveUntil(
      MyRouter.generateRoute(RouteSettings(name: routeName)),
          (Route<dynamic> route) => false);
}
