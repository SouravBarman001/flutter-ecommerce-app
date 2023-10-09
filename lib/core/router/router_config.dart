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
import 'package:ecommerce_module/features/home/dashboard/root/data/models/feature_product_model.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/pages/home_page.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/pages/main_page.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/pages/product_review_page.dart';
import 'package:ecommerce_module/features/home/dashboard/root/presentation/pages/see_all_product_page.dart';
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
    initialLocation: '/${Routers.signIn}',
    navigatorKey: _rootState,
    routes: [
      GoRoute(
        path: '/${Routers.signIn}',
        name: Routers.signIn,
        builder: (context, state) => SignInPage(key: state.pageKey),
      ),
      GoRoute(
        path: '/${Routers.reset}',
        name: Routers.reset,
        builder: (context, state) => ResetPasswordPage(key: state.pageKey),
      ),
      GoRoute(
        path: '/${Routers.signUp}',
        name: Routers.signUp,
        builder: (context, state) => SignUpPage(key: state.pageKey),
      ),
      GoRoute(
        path: '/${Routers.verification}/:name',
        name: Routers.verification,
        builder: (context, state) {
          final name = state.pathParameters['name']!;
          return VerificationPage(key: state.pageKey, userEmail: name);
        },
      ),
      GoRoute(
        path: '/${Routers.registrationVerification}/:email',
        name: Routers.registrationVerification,
        builder: (context, state) {
          final email = state.pathParameters['email']!;
          return RegistrationVerificationPage(
            key: state.pageKey,
            userEmail: email,
          );
        },
      ),
      GoRoute(
        path: '/${Routers.updateNewPassword}',
        name: Routers.updateNewPassword,
        builder: (context, state) {
          return UpdatePasswordPage(key: state.pageKey);
        },
      ),
      GoRoute(
        path: '/${Routers.profileAndPassword}',
        name: Routers.profileAndPassword,
        builder: (context, state) {
          return ProfileAndPassword(key: state.pageKey);
        },
      ),
      GoRoute(
        path: '/${Routers.homeRoot}',
        name: Routers.homeRoot,
        builder: (context, state) {
          return HomePage(key: state.pageKey);
        },
        routes: <RouteBase>[
          GoRoute(
            name: Routers.searchProduct,
            path: Routers.searchProduct,
            builder: (BuildContext context, state) {
              return SearchProduct(key: state.pageKey);
            },
          ),
          GoRoute(
            name: Routers.seeAllProducts,
            path: Routers.seeAllProducts,
            builder: (BuildContext context, state) {
              return SeeAllProductsPage(key: state.pageKey);
            },
          ),
          GoRoute(
            name: Routers.categoryDetails,
            path: '${Routers.categoryDetails}/:name',
            builder: (BuildContext context, state) {
              final name = state.pathParameters['name']!;
              return CategoryDetails(key: state.pageKey, categoryName: name);
            },
          ),

        ],
      ),
      GoRoute(
        path: '/${Routers.productDetails}',
        name: Routers.productDetails,
        builder: (context, state) {
          // ignore: lines_longer_than_80_chars
          final data = state.extra! as FeaturedModel;
          return ProductDetails(
            key: state.pageKey,
            data: data,
          );
        },
        routes: [
            GoRoute(
              name: Routers.infoSeller,
              path: Routers.infoSeller,
              builder: (BuildContext context, state) {
                return InfoSeller(key: state.pageKey);
              },
            ),
            GoRoute(
              name: Routers.productReview,
              path: Routers.productReview,
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
                name: Routers.homeShell,
                path: '/${Routers.home}',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      child: HomePage(
                    key: state.pageKey,
                  ),);
                },),
            GoRoute(
                name: Routers.wishList,
                path: '/${Routers.wishList}',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      child: WishListPage(
                    key: state.pageKey,
                  ),);
                },),
            GoRoute(
                name: Routers.order,
                path: '/${Routers.order}',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      child: OrderPage(
                    key: state.pageKey,
                  ),);
                },),
            GoRoute(
                name: Routers.account,
                path: '/${Routers.account}',
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
