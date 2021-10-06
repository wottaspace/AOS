import 'package:okito/okito.dart';
import 'package:flutter/material.dart';
import 'package:arcopen_enquirer/utils/mixins/toast_mixin.dart';
import 'package:arcopen_enquirer/utils/mixins/validation_mixin.dart';

class RegisterController extends OkitoController with ValidationMixin, ToastMixin {
  RegisterController._internal();
  static final RegisterController _singleton = RegisterController._internal();

  factory RegisterController() {
    return _singleton;
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void register() {
    print("login");
  }
}
