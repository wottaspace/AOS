import 'package:okito/okito.dart';
import 'package:flutter/material.dart';
import 'package:arcopen_enquirer/config/routes/k_routes.dart';
import 'package:arcopen_enquirer/utils/mixins/toast_mixin.dart';
import 'package:arcopen_enquirer/utils/mixins/validation_mixin.dart';

class LoginController extends OkitoController with ValidationMixin, ToastMixin {
  LoginController._internal();
  static final LoginController _singleton = LoginController._internal();

  factory LoginController() {
    return _singleton;
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    Okito.pushNamed(KRoutes.homeRoute);
  }
}
