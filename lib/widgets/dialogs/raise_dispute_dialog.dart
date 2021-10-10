import 'package:arcopen_enquirer/widgets/buttons/k_button.dart';
import 'package:arcopen_enquirer/widgets/forms/k_text_field.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class RaiseDisputeDialog extends StatefulWidget {
  const RaiseDisputeDialog({Key? key}) : super(key: key);

  @override
  _RaiseDisputeDialogState createState() => _RaiseDisputeDialogState();
}

class _RaiseDisputeDialogState extends State<RaiseDisputeDialog> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(child: KTextField.soft(label: "TYPE")),
              SizedBox(width: 10),
              Expanded(
                child: KTextField.soft(
                  label: "AMOUNT",
                  keybordType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          KTextField.soft(
            label: "DESCRIPTION",
            minLines: 4,
            maxLines: 4,
          ),
          SizedBox(height: 20),
          KButton(
            expanded: true,
            onPressed: () {},
            title: "SUBMIT",
            color: Okito.theme.primaryColor,
          ),
        ],
      ),
    );
  }
}
