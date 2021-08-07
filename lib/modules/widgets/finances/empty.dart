import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';
import 'package:openarc_employer/modules/widgets/shared/image_icon.dart'
    as imageIcon;

class EmptyFinance extends StatelessWidget {
  const EmptyFinance({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 60),
        imageIcon.ImageIcon(uri: 'qrcode.png'),
        SizedBox(height: 30),
        Text(
          'No transactions found',
          style: context.textTheme.headline4?.copyWith(
            fontSize: 20,
            color: Colors.black87,
            fontWeight: FontWeight.w800,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 8,
          ),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adispiscing elit, sed do eiusmod tempor incididunt ut labore et dolor magna aliqua',
            textAlign: TextAlign.center,
            style: context.textTheme.headline4?.copyWith(
              fontSize: 16,
              color: KColor.grey,
            ),
          ),
        )
      ],
    );
  }
}
