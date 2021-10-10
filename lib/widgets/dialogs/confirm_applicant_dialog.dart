import 'package:arcopen_enquirer/config/routes/k_routes.dart';
import 'package:arcopen_enquirer/constants/color_constants.dart';
import 'package:arcopen_enquirer/widgets/buttons/k_button.dart';
import 'package:arcopen_enquirer/widgets/finances/detail_item.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class ConfirmApplicantDialog extends StatefulWidget {
  const ConfirmApplicantDialog({Key? key}) : super(key: key);

  @override
  _ConfirmApplicantDialogState createState() => _ConfirmApplicantDialogState();
}

class _ConfirmApplicantDialogState extends State<ConfirmApplicantDialog> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "\$130.99",
              style: Okito.theme.textTheme.bodyText2!.copyWith(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: ColorConstants.greenColor,
              ),
            ),
          ),
          SizedBox(height: 10),
          DetailItem(
            title: "Standard Pay per hour",
            value: "\$12/hr",
            boldValue: true,
          ),
          DetailItem(
            title: "AOS Standard addition per hour",
            value: "\$0",
            boldValue: true,
          ),
          DetailItem(
            title: "AOS One of Misc Payment",
            value: "\$0",
            boldValue: true,
          ),
          DetailItem(
            title: "Total Expected Hours",
            value: "20",
            boldTitle: true,
            boldValue: true,
          ),
          DetailItem(
            title: "Total Pay",
            value: "\$144",
            boldTitle: true,
            boldValue: true,
          ),
          DetailItem(
            title: "Admin charge @ \$1.5/hr",
            value: "\$18",
          ),
          DetailItem(
            title: "Bidding Fees @ \$0.1/hr",
            value: "\$1.20",
          ),
          DetailItem(
            title: "Subtotal",
            value: "\$163.20",
            boldValue: true,
          ),
          SizedBox(height: 10),
          Text(
            "Additions",
            style: Okito.theme.textTheme.bodyText2!.copyWith(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          DetailItem(
            title: "*AOS Account Refunds",
            value: "\$0",
            boldValue: true,
          ),
          DetailItem(
            title: "VAT @ 20%",
            value: "\$32.64",
            boldValue: true,
          ),
          DetailItem(
            title: "Net Pay",
            value: "\$198.50",
            boldValue: true,
            boldTitle: true,
          ),
          AspectRatio(aspectRatio: 10 / 2),
          KButton(
            onPressed: () {
              Okito.pushNamed(KRoutes.billingMethodsRoute);
            },
            title: "FUND NOW",
            expanded: true,
            color: Okito.theme.primaryColor,
          ),
        ],
      ),
    );
  }
}
