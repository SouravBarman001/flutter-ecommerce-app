import 'package:ecommerce_module/core/router/routers.dart';
import 'package:ecommerce_module/features/account/presentation/pages/account_page.dart';
import 'package:ecommerce_module/features/authentication/profile_and_password/presentation/pages/profile_and_password_page.dart';
import 'package:ecommerce_module/features/authentication/reset_password/presentation/pages/reset_password_page.dart';
import 'package:ecommerce_module/features/authentication/sign_in/presentation/pages/sign_in_page.dart';
import 'package:ecommerce_module/features/authentication/sign_up/presentation/pages/sign_up_page.dart';
import 'package:ecommerce_module/features/authentication/update_password/presentation/pages/update_password_page.dart';
import 'package:ecommerce_module/features/authentication/verification/presentation/pages/registration_verification_pages.dart';
import 'package:ecommerce_module/features/authentication/verification/presentation/pages/verification_page.dart';
import 'package:ecommerce_module/features/home/category_details/presentation/pages/category_details.dart';
import 'package:ecommerce_module/features/home/home_core/data/domain/featured_product_model.dart';
import 'package:ecommerce_module/features/home/home_core/presentation/pages/home_page.dart';
import 'package:ecommerce_module/features/home/home_core/presentation/pages/main_page.dart';
import 'package:ecommerce_module/features/home/home_core/presentation/pages/product_review_page.dart';
import 'package:ecommerce_module/features/home/info_seller/presentation/pages/info_seller.dart';
import 'package:ecommerce_module/features/home/search_product/presentation/pages/search_product.dart';
import 'package:ecommerce_module/features/order/presentation/pages/order_page.dart';
import 'package:ecommerce_module/features/wish_list/presentation/pages/wish_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootState = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellState = GlobalKey(debugLabel: 'shell');

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
            key: state.pageKey,
            userEmail: email,
          );
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
        name: RoutersName.homeRoot,
        builder: (context, state) {
          return HomePage(key: state.pageKey);
        },
        routes: <RouteBase>[
          GoRoute(
            name: RoutersName.searchProduct,
            path: 'search-product',
            builder: (BuildContext context, state) {
              return SearchProduct(key: state.pageKey);
            },
          ),
          GoRoute(
            name: RoutersName.categoryDetails,
            path: 'category-details/:name',
            builder: (BuildContext context, state) {
              final name = state.pathParameters['name']!;
              return CategoryDetails(key: state.pageKey, categoryName: name);
            },
          ),

        ],
      ),
      GoRoute(
        path: '/product-details',
        name: RoutersName.productDetails,
        builder: (context, state) {
          // ignore: lines_longer_than_80_chars
          final data = state.extra! as FeaturedProductModel;
          return ProductDetails(
            key: state.pageKey,
            data: data,
          );
        },
        routes: [
            GoRoute(
              name: RoutersName.infoSeller,
              path: 'info-seller',
              builder: (BuildContext context, state) {
                return InfoSeller(key: state.pageKey);
              },
            ),
            GoRoute(
              name: RoutersName.productReview,
              path: 'product-review',
              builder: (BuildContext context, state) {
                return ProductReviewPage(key: state.pageKey);
              },
            ),
        ],
      ),
      ShellRoute(
          navigatorKey: _shellState,
          builder: (context, state, child) =>
              MainPage(key: state.pageKey, child: child),
          routes: [
            GoRoute(
                name: RoutersName.homeShell,
                path: '/home',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      child: HomePage(
                    key: state.pageKey,
                  ),);
                },),
            GoRoute(
                name: RoutersName.wishList,
                path: '/wish-list',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      child: WishListPage(
                    key: state.pageKey,
                  ),);
                },),
            GoRoute(
                name: RoutersName.order,
                path: '/order',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      child: OrderPage(
                    key: state.pageKey,
                  ),);
                },),
            GoRoute(
                name: RoutersName.account,
                path: '/account',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      child: AccountPage(
                    key: state.pageKey,
                  ),);
                },),
          ],),
    ],
  );
});
