// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [CartScreen]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute({List<PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CartScreen();
    },
  );
}

/// generated route for
/// [CheckoutScreen]
class CheckoutRoute extends PageRouteInfo<void> {
  const CheckoutRoute({List<PageRouteInfo>? children})
      : super(
          CheckoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'CheckoutRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CheckoutScreen();
    },
  );
}

/// generated route for
/// [DetailsOrderScreen]
class DetailsOrderRoute extends PageRouteInfo<DetailsOrderRouteArgs> {
  DetailsOrderRoute({
    Key? key,
    required Order order,
    List<PageRouteInfo>? children,
  }) : super(
          DetailsOrderRoute.name,
          args: DetailsOrderRouteArgs(
            key: key,
            order: order,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsOrderRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailsOrderRouteArgs>();
      return DetailsOrderScreen(
        key: args.key,
        order: args.order,
      );
    },
  );
}

class DetailsOrderRouteArgs {
  const DetailsOrderRouteArgs({
    this.key,
    required this.order,
  });

  final Key? key;

  final Order order;

  @override
  String toString() {
    return 'DetailsOrderRouteArgs{key: $key, order: $order}';
  }
}

/// generated route for
/// [DetailsScreen]
class DetailsRoute extends PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    Key? key,
    int id = -1,
    List<PageRouteInfo>? children,
  }) : super(
          DetailsRoute.name,
          args: DetailsRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<DetailsRouteArgs>(orElse: () => const DetailsRouteArgs());
      return DetailsScreen(
        key: args.key,
        id: args.id,
      );
    },
  );
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    this.key,
    this.id = -1,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [FavouriteScreen]
class FavouriteRoute extends PageRouteInfo<void> {
  const FavouriteRoute({List<PageRouteInfo>? children})
      : super(
          FavouriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavouriteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FavouriteScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [ListingScreen]
class ListingRoute extends PageRouteInfo<ListingRouteArgs> {
  ListingRoute({
    Key? key,
    int index = 0,
    List<PageRouteInfo>? children,
  }) : super(
          ListingRoute.name,
          args: ListingRouteArgs(
            key: key,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'ListingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<ListingRouteArgs>(orElse: () => const ListingRouteArgs());
      return ListingScreen(
        key: args.key,
        index: args.index,
      );
    },
  );
}

class ListingRouteArgs {
  const ListingRouteArgs({
    this.key,
    this.index = 0,
  });

  final Key? key;

  final int index;

  @override
  String toString() {
    return 'ListingRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainScreen();
    },
  );
}

/// generated route for
/// [NotificationScreen]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotificationScreen();
    },
  );
}

/// generated route for
/// [OrdersScreen]
class OrdersRoute extends PageRouteInfo<void> {
  const OrdersRoute({List<PageRouteInfo>? children})
      : super(
          OrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OrdersScreen();
    },
  );
}

/// generated route for
/// [OtpVerificationScreen]
class OtpVerificationRoute extends PageRouteInfo<OtpVerificationRouteArgs> {
  OtpVerificationRoute({
    Key? key,
    required String email,
    List<PageRouteInfo>? children,
  }) : super(
          OtpVerificationRoute.name,
          args: OtpVerificationRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpVerificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpVerificationRouteArgs>();
      return OtpVerificationScreen(
        key: args.key,
        email: args.email,
      );
    },
  );
}

class OtpVerificationRouteArgs {
  const OtpVerificationRouteArgs({
    this.key,
    required this.email,
  });

  final Key? key;

  final String email;

  @override
  String toString() {
    return 'OtpVerificationRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [PopularScreen]
class PopularRoute extends PageRouteInfo<void> {
  const PopularRoute({List<PageRouteInfo>? children})
      : super(
          PopularRoute.name,
          initialChildren: children,
        );

  static const String name = 'PopularRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PopularScreen();
    },
  );
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [ResetPasswordScreen]
class ResetPasswordRoute extends PageRouteInfo<void> {
  const ResetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ResetPasswordScreen();
    },
  );
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignUpScreen();
    },
  );
}
