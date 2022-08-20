import 'package:ecommerce/views/home/my_home_view.dart';
import 'package:ecommerce/views/my_cart/view/my_cart_view.dart';
import 'package:ecommerce/views/product_details/product_details_view.dart';
import 'package:ecommerce/views/splash_screen/splash_screen_view.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  static final MyRoutes _instance = MyRoutes.init();
  static MyRoutes get instance => MyRoutes._instance;
  MyRoutes.init();
  Route? onGenerate(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case '/splash_screen':
        return MaterialPageRoute(builder: (_) => SplashScreensView());
      case '/home':
        return MaterialPageRoute(builder: (_) => MyHomeView());
      case '/product_details':
        return MaterialPageRoute(builder: (_) => ProductDetailsView());
      case '/my_cart':
        return MaterialPageRoute(builder: (_) => MyCartView());
    }
  }
}
