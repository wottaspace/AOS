import 'package:arcopen_enquirer/constants/color_constants.dart';
import 'package:arcopen_enquirer/widgets/buttons/k_button.dart';
import 'package:arcopen_enquirer/widgets/forms/k_text_field.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class StepFour extends StatefulWidget {
  const StepFour({
    Key? key,
    required this.onNextButtonTapped,
    required this.onSaveDraftsTapped,
  }) : super(key: key);

  final Function onSaveDraftsTapped;
  final Function onNextButtonTapped;

  @override
  _StepFourState createState() => _StepFourState();
}

class _StepFourState extends State<StepFour> {
  final TextEditingController contractTermsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        children: [
          SizedBox(height: 20),
          KTextField.soft(
            label: "CONTRACT TERMS",
            minLines: 6,
            maxLines: 6,
            controller: contractTermsController,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Divider()),
              SizedBox(width: 5),
              Text(
                "OR",
                style: Okito.theme.textTheme.bodyText2!.copyWith(
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.greyColor,
                ),
              ),
              SizedBox(width: 5),
              Expanded(child: Divider()),
            ],
          ),
          SizedBox(height: 20),
          KButton(
            onPressed: () {},
            title: "UPLOAD CONTRACT",
            color: Okito.theme.primaryColor,
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: KButton.outlined(
                  onPressed: () {
                    widget.onSaveDraftsTapped();
                  },
                  title: "SAVE TO DRAFTS",
                  color: Okito.theme.primaryColor,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: KButton.outlined(
                  onPressed: () {
                    widget.onNextButtonTapped();
                  },
                  title: "DONE",
                  color: Okito.theme.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
