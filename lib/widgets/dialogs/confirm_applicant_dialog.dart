import 'package:arcopen_enquirer/config/routes/k_routes.dart';
import 'package:arcopen_enquirer/constants/color_constants.dart';
import 'package:arcopen_enquirer/core/models/applicant.dart';
import 'package:arcopen_enquirer/modules/jobs/job_application/job_application_controller.dart';
import 'package:arcopen_enquirer/widgets/buttons/k_button.dart';
import 'package:arcopen_enquirer/widgets/finances/detail_item.dart';
import 'package:arcopen_enquirer/widgets/misc/page_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class ConfirmApplicantDialog extends StatefulWidget {
  const ConfirmApplicantDialog({Key? key, this.applicant}) : super(key: key);

  final Applicant? applicant;

  @override
  _ConfirmApplicantDialogState createState() => _ConfirmApplicantDialogState();
}

class _ConfirmApplicantDialogState extends State<ConfirmApplicantDialog> {
  Applicant? applicant;
  final JobApplicationController controller = JobApplicationController();

  @override
  void initState() {
    super.initState();
    applicant = widget.applicant;
    print(applicant!.applicationId!);
    if (applicant!.applicationId != null) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        controller.loadFundDetails(applicant!.applicationId!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OkitoBuilder(
        controller: controller,
        builder: () => PageSkeleton(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      applicant!.profilePic.toString(),
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
                    value: "${controller.fundDetails?.payPerHour}",
                    boldValue: true,
                  ),
                  DetailItem(
                    title: "AOS Standard addition per hour",
                    value: "${controller.fundDetails?.aosStandard}",
                    boldValue: true,
                  ),
                  DetailItem(
                    title: "AOS One of Misc Payment",
                    value: "${controller.fundDetails?.aosOneOff}",
                    boldValue: true,
                  ),
                  DetailItem(
                    title: "Total Expected Hours",
                    value: "${controller.fundDetails?.totalExpected}",
                    boldTitle: true,
                    boldValue: true,
                  ),
                  DetailItem(
                    title: "Total Pay",
                    value: "${controller.fundDetails?.totalPay}",
                    boldTitle: true,
                    boldValue: true,
                  ),
                  DetailItem(
                    title: "Admin charge @ \$1.5/hr",
                    value: "${controller.fundDetails?.adminCharges}",
                  ),
                  DetailItem(
                    title: "Bidding Fees @ \$0.1/hr",
                    value: "${controller.fundDetails?.biddingFees}",
                  ),
                  DetailItem(
                    title: "Subtotal",
                    value: "${controller.fundDetails?.subTotal}",
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
                    value: "${controller.fundDetails?.aosAccountRefund}",
                    boldValue: true,
                  ),
                  DetailItem(
                    title: "VAT @ 20%",
                    value: "${controller.fundDetails?.aosAccountRefund}",
                    boldValue: true,
                  ),
                  DetailItem(
                    title: "Net Pay",
                    value: "${controller.fundDetails?.totalPay}",
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
            ),
            controller: controller,
            retryCallback: () =>
                controller.loadFundDetails(applicant!.applicationId!)));
  }
}
