import 'package:arcopen_enquirer/modules/jobs/post_job/create_job_controller.dart';
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
  final CreateJobController jobController = CreateJobController();
  final List<String> shiftTypes = ["Day", "Night"];

  String? shiftType;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      jobController.shiftType = shiftTypes.first;
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
              controller: jobController.businessController,
              validator: (value) {
                jobController.validateDate(
                    fieldName: "business name",
                    value: jobController.businessController.text);
              }),
          SizedBox(height: 20),
          KTextField.soft(
              label: "DESCRIPTION",
              minLines: 3,
              maxLines: 4,
              controller: jobController.descriptionController,
              validator: (value) {
                jobController.validateRequired(
                    fieldName: "description",
                    value: jobController.descriptionController.text);
              }),
          SizedBox(height: 20),
          KTextField.soft(
              label: "NO. OF VACANCIES",
              keybordType: TextInputType.number,
              controller: jobController.vacanciesCountController,
              validator: (value) {
                jobController.validateRequired(
                    fieldName: "no. of vacancies",
                    value: jobController.vacanciesCountController.text);
              }),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: KTextField.soft(
                    label: "SHIFT START DATE",
                    keybordType: TextInputType.text,
                    controller: jobController.startDateController,
                    validator: (value) {
                      jobController.validateDate(
                          fieldName: "shift start date",
                          value: jobController.endDateController.text);
                    }),
              ),
              SizedBox(width: 10),
              Expanded(
                child: KTextField.soft(
                    label: "SHIFT END DATE",
                    keybordType: TextInputType.text,
                    controller: jobController.endDateController,
                    validator: (value) {
                      jobController.validateDate(
                          fieldName: "shift end date",
                          value: jobController.endDateController.text);
                    }),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: KTextField.soft(
                    label: "SHIFT START TIME",
                    keybordType: TextInputType.text,
                    controller: jobController.startTimeController,
                    validator: (value) {
                      jobController.validateTime(
                          fieldName: "shift start time",
                          value: jobController.endDateController.text);
                    }),
              ),
              SizedBox(width: 10),
              Expanded(
                child: KTextField.soft(
                    label: "SHIFT END TIME",
                    keybordType: TextInputType.text,
                    controller: jobController.endTimeController,
                    validator: (value) {
                      jobController.validateTime(
                          fieldName: "shift end time",
                          value: jobController.endTimeController.text);
                    }),
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
                      jobController.shiftType = value!;
                      setState(() {
                        shiftType = value;
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
