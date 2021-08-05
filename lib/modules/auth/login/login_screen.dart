import 'package:flutter/material.dart';
import 'package:openarc_employer/config/routes/k_router.dart';
import 'package:openarc_employer/config/routes/k_routes.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/modules/widgets/shared/rounded_button.dart';
import 'package:openarc_employer/modules/widgets/shared/text_field.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';
import 'package:openarc_employer/modules/widgets/shared/image_icon.dart'
    as imageIcon;
import 'package:openarc_employer/utils/helpers/asset_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 130),
          Container(
            height: 40,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetHelper.getAsset(name: 'logo.png')))),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Log In and get things done',
              style: context.textTheme.headline5
                  ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: KTextField(
                labelText: 'Login',
                hintText: 'timhortons',
                prefixIcon: imageIcon.ImageIcon(uri: "user.png")),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: KTextField(
                labelText: 'Password',
                hintText: '**********',
                prefixIcon: imageIcon.ImageIcon(uri: "key.png"),
                suffixIcon: Icon(
                  Icons.visibility,
                  size: 15,
                )),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: KRoundedButton(
              onTap: () => KRouter().push(KRoutes.homeRoute),
              label: 'LOG IN',
            ),
          ),
          SizedBox(height: 20),
          Align(
              alignment: Alignment.center,
              child: Text('Forgot Password ?',
                  style: context.textTheme.bodyText1?.copyWith(
                      fontSize: 15,
                      color: KColor.grey,
                      decoration: TextDecoration.underline))),
          Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => KRouter().push(KRoutes.registerRoute),
                child: Text('Sign Up',
                    style: context.textTheme.bodyText1?.copyWith(
                        fontSize: 15,
                        color: KColor.grey,
                        decoration: TextDecoration.underline)),
              ))
        ],
      ),
    );
  }
}
