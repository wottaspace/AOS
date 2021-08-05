import 'package:flutter/material.dart';
import 'package:openarc_employer/config/routes/k_router.dart';
import 'package:openarc_employer/config/routes/k_routes.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 25,
                    color: KColor.grey,
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Sign up',
                    style: context.textTheme.headline3?.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: LabelTextField(label: "Organisation name"),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: LabelTextField(label: "Email"),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: LabelTextField(label: "Password"),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: LabelTextField(label: "Confirm Password"),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: OutlineButton(
                      onTap: () => KRouter().push(KRoutes.homeRoute),
                      label: "CREATE ACCOUNT"),
                )
              ],
            ),
          ),
        ));
  }
}

class LabelTextField extends StatelessWidget {
  const LabelTextField({Key? key, required this.label, this.controller})
      : super(key: key);

  final TextEditingController? controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(),
            style: context.textTheme.headline6?.copyWith(
                color: KColor.grey, fontSize: 12, fontWeight: FontWeight.w800)),
        Card(
          elevation: 2,
          shadowColor: Colors.black54,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
      ],
    );
  }
}

class OutlineButton extends StatelessWidget {
  const OutlineButton({
    Key? key,
    this.onTap,
    required this.label,
    this.color,
  }) : super(key: key);

  final Function()? onTap;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: color ?? KColor.primary,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: context.textTheme.bodyText1?.copyWith(
            color: color ?? KColor.primary,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
