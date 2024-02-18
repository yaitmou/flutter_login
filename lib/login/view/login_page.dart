import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/login/login.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  // Router specific settings
  // All widgets that are routes should provide the following:
  // - String pagePath (getter)
  // - MaterialPage<void> _materialPage(Key key) (static method)
  // - GoRoute route (GoRoute instance)
  static String get _pagePath => '/login';

  static MaterialPage<void> _materialPage(Key key) => MaterialPage(
        child: LoginPage(key: key),
      );
  static GoRoute get route => GoRoute(
        path: _pagePath,
        pageBuilder: (context, state) => _materialPage(state.pageKey),
        // we can process local redirects here ...
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationRepository: RepositoryProvider.of<AuthenticationRepository>(context),
            );
          },
          child: const Center(
            child: SizedBox(
              width: 600,
              child: Card(
                margin: EdgeInsets.all(24),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: LoginForm(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
