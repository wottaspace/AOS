import 'package:flutter/material.dart';
import 'package:openarc_employer/config/routes/k_router.dart';
import 'package:openarc_employer/config/routes/k_routes.dart';
import 'package:openarc_employer/modules/widgets/shared/rounded_button.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';
import "package:openarc_employer/modules/widgets/shared/image_icon.dart"
    as imageIcon;

class MessageSendRecoverScreen extends StatelessWidget {
  const MessageSendRecoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              imageIcon.ImageIcon(uri: "send.png"),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'A password reset link has been sent to',
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyText1
                      ?.copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'xxx@domain.com',
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyText1
                      ?.copyWith(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 60),
              KRoundedButton(
                onTap: () => KRouter().push(KRoutes.changePasswordRoute),
                label: "Done",
                width: 200.0,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
