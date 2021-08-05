import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class FinanceStatCards extends StatelessWidget {
  const FinanceStatCards({
    Key? key,
    required this.title,
    required this.price,
    this.color,
    this.details,
  }) : super(key: key);

  final String title, price;
  final String? details;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: context.textTheme.headline5
                  ?.copyWith(fontSize: 15, fontWeight: FontWeight.w800),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                price,
                style: context.textTheme.headline5?.copyWith(
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                    color: color ?? KColor.primary),
              ),
            ),
            if (details != null)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  details ?? '',
                  style: context.textTheme.headline5?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: KColor.grey),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
