import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_enquirer/config/routes/k_routes.dart';
import 'package:arcopen_enquirer/utils/mixins/toast_mixin.dart';
import 'package:arcopen_enquirer/utils/mixins/validation_mixin.dart';

class PasswordController extends OkitoController with ToastMixin, ValidationMixin {
  PasswordController._internal();
  static final PasswordController _singleton = PasswordController._internal();

  factory PasswordController() {
    return _singleton;
  }

  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController resetPasswordEmailController = TextEditingController();

  void sendResetPasswordRequest() {
    Okito.pushNamed(KRoutes.resetPasswordSuccessRoute);
  }
}
