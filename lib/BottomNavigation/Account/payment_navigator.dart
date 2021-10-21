import 'package:flutter/material.dart';
import 'package:pocketmovies/Auth/SignIn/sign_in_page.dart';
import 'package:pocketmovies/Auth/SignIn/social_sign_up_page.dart';
import 'package:pocketmovies/Auth/SignUp/sign_up_page.dart';
import 'package:pocketmovies/Auth/Verification/verification_page.dart';
import 'package:pocketmovies/Pages/payment_page.dart';
import 'package:pocketmovies/Pages/subscibed.dart';
import 'package:pocketmovies/Pages/subscribe_page.dart';
import 'package:pocketmovies/Routes/routes.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class PaymentRoutes {
  static const String subscribe = 'payment/subscribe';
  static const String payment = 'payment/payment';
  static const String subscribed = 'payment/subscribed';
}

class PaymentNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = navigatorKey.currentState!.canPop();
        if (canPop) {
          navigatorKey.currentState!.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute: PaymentRoutes.subscribe,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder? builder;
          switch (settings.name) {
            case PaymentRoutes.subscribe:
              builder = (BuildContext _) => SubscribePage();
              break;
            case PaymentRoutes.payment:
              SubscribeData subscribeData = settings.arguments as SubscribeData;

              builder = (BuildContext _) => PaymentPage(
                    subscriptionTime: subscribeData.subscriptionTime,
                    price: subscribeData.price,
                  );
              break;
            case PaymentRoutes.subscribed:
              builder = (BuildContext _) => SubscribedPage(() {
                    Navigator.pop(context);
                  });
              break;
          }
          return MaterialPageRoute(builder: builder!, settings: settings);
        },
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
