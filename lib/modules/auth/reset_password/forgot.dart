import 'package:flutter/material.dart';
import 'package:openarc_employer/config/routes/k_router.dart';
import 'package:openarc_employer/config/routes/k_routes.dart';
import 'package:openarc_employer/modules/widgets/shared/rounded_button.dart';
import 'package:openarc_employer/modules/widgets/shared/text_field.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';
import "package:openarc_employer/modules/widgets/shared/image_icon.dart"
    as imageIcon;

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            imageIcon.ImageIcon(uri: "keys.png"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Enter your email and we\'ll send yuo instruction to set new password',
                textAlign: TextAlign.center,
                style: context.textTheme.bodyText1
                    ?.copyWith(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: KTextField(
                  labelText: "Email",
                  hintText: "Email",
                  prefixIcon: imageIcon.ImageIcon(
                    uri: 'message.png',
                  )),
            ),
            SizedBox(height: 20),
            KRoundedButton(
              onTap: () => KRouter().push(KRoutes.messageSendRoute),
              label: "Reset Password",
              width: 200.0,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
