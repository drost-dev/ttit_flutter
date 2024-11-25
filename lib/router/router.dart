import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cart/cart_screen.dart';
import 'package:flutter_application_1/screens/favourite/favourite_screen.dart';
import 'package:flutter_application_1/screens/home/home_screen.dart';
import 'package:flutter_application_1/screens/listing/listing_screen.dart';
import 'package:flutter_application_1/screens/main/main_screen.dart';
import 'package:flutter_application_1/screens/login/login_screen.dart';
import 'package:flutter_application_1/screens/notification/notification_screen.dart';
import 'package:flutter_application_1/screens/otp_verification/otp_verification_screen.dart';
import 'package:flutter_application_1/screens/popular/popular_screen.dart';
import 'package:flutter_application_1/screens/profile/profile_screen.dart';
import 'package:flutter_application_1/screens/reset_password/reset_password_screen.dart';
import 'package:flutter_application_1/screens/signup/signup_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class $AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(
          page: MainRoute.page,
          path: '/main',
          //path: '/',
          initial: true,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: 'home',
            ),
            AutoRoute(
              page: FavouriteRoute.page,
              path: 'favourite',
            ),
            AutoRoute(
              page: NotificationRoute.page,
              path: 'notification',
              meta: const {'hideNavBar': true},
            ),
            AutoRoute(
              page: ProfileRoute.page,
              path: 'profile',
              meta: const {'hideNavBar': true},
            ),
          ],
        ),
        AutoRoute(
          page: PopularRoute.page,
          path: '/popular',
        ),
        AutoRoute(
          page: ListingRoute.page,
          path: '/listing',
        ),
        AutoRoute(
          page: CartRoute.page,
          path: '/cart',
        ),

        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
          //initial: true,
        ),
        AutoRoute(
          page: SignUpRoute.page,
          path: '/signup',
        ),
        AutoRoute(
          page: ResetPasswordRoute.page,
          path: '/reset',
        ),
        AutoRoute(
          page: OtpVerificationRoute.page,
          path: '/otp',
        ),
      ];
}
