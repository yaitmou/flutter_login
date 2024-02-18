import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/authentication/authentication.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  /// The HomePage route
  const HomePage({super.key});

  // Router specific settings
  // All widgets that are routes should provide the following:
  // - String pagePath (getter)
  // - MaterialPage<void> _materialPage(Key key) (static method)
  // - GoRoute route (GoRoute instance)
  static String get pagePath => '/';
  static MaterialPage<void> _materialPage(Key key) => MaterialPage(
        child: HomePage(key: key),
      );
  static GoRoute get route => GoRoute(
        path: pagePath,
        pageBuilder: (context, state) => _materialPage(state.pageKey),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Builder(
              builder: (context) {
                final userId = context.select(
                  (AuthenticationBloc bloc) => bloc.state.user.id,
                );
                return Text('UserID: $userId');
              },
            ),
            ElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
                context.read<AuthenticationBloc>().add(AuthenticationLogoutRequested());
              },
            ),
          ],
        ),
      ),
    );
  }
}
