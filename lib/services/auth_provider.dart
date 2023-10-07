import 'package:flutter/material.dart';

import 'auth.dart';


class AuthProvider extends InheritedWidget {
  const AuthProvider({super.key, required super.child, this.auth});
  final AuthBase? auth;




  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  // final auth = AuthProvider.of(context);
  static AuthBase? of(BuildContext context) {
    AuthProvider? provider = context.dependOnInheritedWidgetOfExactType<AuthProvider>();
    return provider?.auth;
  }
}