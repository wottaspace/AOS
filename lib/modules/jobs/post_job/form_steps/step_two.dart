import 'package:arcopen_enquirer/widgets/buttons/k_button.dart';
import 'package:arcopen_enquirer/widgets/forms/k_text_field.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class StepTwo extends StatefulWidget {
  StepTwo({
    Key? key,
    required this.onNextButtonTapped,
    required this.onSaveDraftsTapped,
  }) : super(key: key);

  final Function onNextButtonTapped;
  final Function onSaveDraftsTapped;

  @override
  _StepTwoState createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  final TextEditingController businessController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController vacanciesCountController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  final List<String> shiftTypes = ["Day", "Night"];

  String? shiftType;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        shiftType = shiftTypes.first;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView(
        children: [
          KTextField.soft(
            label: "BUSINESS NAME",
            controller: businessController,
          ),
          SizedBox(height: 20),
          KTextField.soft(
            label: "DESCRIPTION",
            minLines: 3,
            maxLines: 4,
            controller: descriptionController,
          ),
          SizedBox(height: 20),
          KTextField.soft(
            label: "NO. OF VACANCIES",
            keybordType: TextInputType.number,
            controller: vacanciesCountController,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: KTextField.soft(
                  label: "SHIFT START DATE",
                  keybordType: TextInputType.number,
                  controller: startDateController,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: KTextField.soft(
                  label: "SHIFT END DATE",
                  keybordType: TextInputType.number,
                  controller: endDateController,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: KTextField.soft(
                  label: "SHIFT START TIME",
                  keybordType: TextInputType.number,
                  controller: startTimeController,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: KTextField.soft(
                  label: "SHIFT END TIME",
                  keybordType: TextInputType.number,
                  controller: endTimeController,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          if (shiftType != null)
            Wrap(
              children: [
                ...shiftTypes.map<Widget>((e) {
                  return RadioListTile<String>(
                    value: e,
                    groupValue: shiftType,
                    title: Text(e),
                    onChanged: (value) {
                      setState(() {
                        shiftType = value!;
                      });
                    },
                  );
                })
              ],
            ),
          SizedBox(height: 20),
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
                  title: "NEXT",
                  color: Okito.theme.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
