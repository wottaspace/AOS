import 'package:flutter/material.dart';
import 'package:openarc_employer/config/routes/k_router.dart';
import 'package:openarc_employer/config/routes/k_routes.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/modules/widgets/shared/rounded_button.dart';
import 'package:openarc_employer/utils/functions.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Change Password'),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Change password',
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.headline3?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ChangePasswordTextField(hintText: 'Old Password'),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ChangePasswordTextField(hintText: 'New Password'),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ChangePasswordTextField(hintText: 'New Password'),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 15),
                    child: KRoundedButton(
                      onTap: () => KRouter().push(KRoutes.homeRoute),
                      label: 'CHANGE PASSWORD',
                      width: double.infinity,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChangePasswordTextField extends StatelessWidget {
  const ChangePasswordTextField({Key? key, required this.hintText})
      : super(key: key);

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: KColor.grey.withOpacity(.2),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        style: context.textTheme.bodyText1!.copyWith(
            color: KColor.grey, fontSize: 16, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: context.textTheme.bodyText1!.copyWith(
              color: KColor.grey.withOpacity(.9),
              fontSize: 16,
              fontWeight: FontWeight.w400),
          border: UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
