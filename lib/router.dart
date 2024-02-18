import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/authentication/authentication.dart';
import 'package:flutter_login/home/home.dart';
import 'package:flutter_login/login/login.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      HomePage.route,
      LoginPage.route,
    ],
    errorPageBuilder: (context, state) => const MaterialPage(
      child: Scaffold(
        body: Center(
          child: Text('Route not found!'),
        ),
      ),
    ),
    redirect: (context, state) async {
      final status = context.read<AuthenticationBloc>().state.status;
      if (status == AuthenticationStatus.authenticated) {
        return null;
      }
      return '/login';
    },
  );
}
