import 'package:ecommerce_module/core/router/routers.dart';
import 'package:ecommerce_module/features/authentication/reset_password/presentation/pages/reset_password_page.dart';
import 'package:ecommerce_module/features/authentication/sign_in/presentation/pages/sign_in_page.dart';
import 'package:ecommerce_module/features/authentication/sign_up/presentation/pages/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/authentication/verification/presentation/pages/verification_page.dart';

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
          builder: (context, state){
            final name = state.pathParameters['name']!;
            return VerificationPage(key: state.pageKey,userEmail:name);
          },
        ),
      ]);
});