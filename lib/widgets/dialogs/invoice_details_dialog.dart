import 'package:arcopen_enquirer/constants/color_constants.dart';
import 'package:arcopen_enquirer/widgets/buttons/k_button.dart';
import 'package:arcopen_enquirer/widgets/finances/detail_item.dart';
import 'package:arcopen_enquirer/widgets/misc/rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class InvoiceDetailsDialog extends StatefulWidget {
  const InvoiceDetailsDialog({
    Key? key,
    this.isPaid = false,
  }) : super(key: key);

  final bool isPaid;

  @override
  _InvoiceDetailsDialogState createState() => _InvoiceDetailsDialogState();
}

class _InvoiceDetailsDialogState extends State<InvoiceDetailsDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CircleAvatar(),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Express Employment",
                      style: Okito.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    const RatingStars(score: 4.5),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          DetailItem(title: "Date Paid", value: "15th Jan"),
          DetailItem(title: "Total Hours", value: "20"),
          DetailItem(title: "Hourly Price", value: "\$20/hr"),
          DetailItem(title: "Billing Period", value: "15th Jan - 16th Jan 2021"),
          DetailItem(
            title: "Total Invoice Amount",
            value: "\$195.84",
            boldTitle: true,
            boldValue: true,
          ),
          SizedBox(height: 20),
          if (!widget.isPaid)
            KButton(
              expanded: true,
              onPressed: () {},
              title: "PAY NOW",
              color: ColorConstants.greenColor,
            ),
          SizedBox(height: 10),
          KButton(
            expanded: true,
            onPressed: () {},
            title: "DOWNLOAD INVOICE",
            color: Okito.theme.primaryColor,
          ),
        ],
      ),
    );
  }
}
