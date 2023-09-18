import 'package:ecommerce_module/core/router/routers.dart';
import 'package:ecommerce_module/features/authentication/profile_and_password/presentation/pages/profile_and_password_page.dart';
import 'package:ecommerce_module/features/authentication/reset_password/presentation/pages/reset_password_page.dart';
import 'package:ecommerce_module/features/authentication/sign_in/presentation/pages/sign_in_page.dart';
import 'package:ecommerce_module/features/authentication/update_password/presentation/pages/update_password_page.dart';
import 'package:ecommerce_module/features/authentication/verification/presentation/pages/registration_verification_pages.dart';
import 'package:ecommerce_module/features/authentication/sign_up/presentation/pages/sign_up_page.dart';
import 'package:ecommerce_module/features/home/search_product/presentation/pages/search_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/authentication/verification/presentation/pages/verification_page.dart';
import '../../features/home/home_core/data/domain/featured_product_model.dart';
import '../../features/home/home_core/presentation/pages/home_page.dart';
import '../../features/home/home_core/presentation/pages/product_details.dart';

final GlobalKey<NavigatorState> _rootState = GlobalKey(debugLabel: 'root');

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      initialLocation: '/signin',
      navigatorKey: _rootState,
      routes: [
        GoRoute(
          path: '/signin',
          name: RoutersName.signIn,
          builder: (context, state) => SignInPage(key: state.pageKey),
        ),
        GoRoute(
          path: '/reset',
          name: RoutersName.reset,
          builder: (context, state) => ResetPasswordPage(key: state.pageKey),
        ),
        GoRoute(
          path: '/signup',
          name: RoutersName.signUp,
          builder: (context, state) => SignUpPage(key: state.pageKey),
        ),
        GoRoute(
          path: '/verification/:name',
          name: RoutersName.verification,
          builder: (context, state) {
            final name = state.pathParameters['name']!;
            return VerificationPage(key: state.pageKey, userEmail: name);
          },
        ),
        GoRoute(
          path: '/reg-verification/:email',
          name: RoutersName.regVerification,
          builder: (context, state) {
            final email = state.pathParameters['email']!;
            return RegistrationVerificationPage(
                key: state.pageKey, userEmail: email,);
          },
        ),
        GoRoute(
          path: '/update-new-password',
          name: RoutersName.updateNewPassword,
          builder: (context, state) {
            return UpdatePasswordPage(key: state.pageKey);
          },
        ),
        GoRoute(
          path: '/profile-and-password',
          name: RoutersName.profileAndPassword,
          builder: (context, state) {
            return ProfileAndPassword(key: state.pageKey);
          },
        ),
        GoRoute(
          path: '/home',
          name: RoutersName.home,
          builder: (context, state) {
            return HomePage(key: state.pageKey);
          },
          routes:<RouteBase>[
        GoRoute(
        name: RoutersName.searchProduct,
            path: 'search-product',
            builder:(BuildContext context, state) {
              return SearchProduct(key: state.pageKey);
            },
        ),
      ],
        ),
        GoRoute(
          path: '/product-details',
          name: RoutersName.productDetails,
          builder: (context, state) {
            // ignore: lines_longer_than_80_chars
            final FeaturedProductModel data = state.extra as FeaturedProductModel;
              return ProductDetails(key: state.pageKey, data: data, );
          },
        ),
      ],);
});
