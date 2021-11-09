import 'package:arcopen_enquirer/core/models/applicant.dart';
import 'package:arcopen_enquirer/core/models/project.dart';
import 'package:arcopen_enquirer/modules/disputes/dispute_controller.dart';
import 'package:arcopen_enquirer/widgets/buttons/k_button.dart';
import 'package:arcopen_enquirer/widgets/forms/k_dropdown_button.dart';
import 'package:arcopen_enquirer/widgets/forms/k_text_field.dart';
import 'package:arcopen_enquirer/widgets/misc/page_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class RaiseDisputeDialog extends StatefulWidget {
  const RaiseDisputeDialog({Key? key}) : super(key: key);

  @override
  _RaiseDisputeDialogState createState() => _RaiseDisputeDialogState();
}

class _RaiseDisputeDialogState extends State<RaiseDisputeDialog> {
  DisputeController controller = DisputeController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.loadJobs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: OkitoBuilder(
          controller: controller,
          builder: () {
            return PageSkeleton(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: KDropdownButton<Project>(
                              title: "JOB",
                              value: controller.newJob,
                              onChanged: (value) {
                                setState(() {
                                  controller.newJob = value;
                                });
                              },
                              items: controller.jobs.map((e) {
                                return DropdownMenuItem<Project>(
                                    value: e, child: Text(e.businessName));
                              }).toList(),
                            ),
                          ),
                          if (controller.newJob != null) ...[
                            SizedBox(width: 10),
                            Expanded(
                              child: KDropdownButton<Applicant>(
                                title: "Member",
                                value: controller.newApplicant,
                                onChanged: (value) {
                                  setState(() {
                                    controller.newApplicant = value;
                                  });
                                },
                                items:
                                    controller.newJob!.applicantsArray.map((e) {
                                  return DropdownMenuItem<Applicant>(
                                      value: e, child: Text(e.applicantName!));
                                }).toList(),
                              ),
                            ),
                          ]
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                              child: KTextField.soft(
                                  label: "TYPE",
                                  validator: (value) {
                                    return controller.validateRequired(
                                        value: controller.disputeType.text,
                                        fieldName: "type");
                                  },
                                  controller: controller.disputeType)),
                          SizedBox(width: 10),
                          Expanded(
                            child: KTextField.soft(
                              label: "AMOUNT",
                              validator: (value) {
                                return controller.validateRequired(
                                    fieldName: "amount",
                                    value: controller.amount.text);
                              },
                              controller: controller.amount,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      KTextField.soft(
                        label: "DESCRIPTION",
                        controller: controller.description,
                        validator: (value) {
                          return controller.validateRequired(
                              fieldName: "description",
                              value: controller.description.text);
                        },
                        minLines: 4,
                        maxLines: 4,
                      ),
                      SizedBox(height: 20),
                      KButton(
                        expanded: true,
                        onPressed: controller.addDispute,
                        title: "SUBMIT",
                        color: Okito.theme.primaryColor,
                      ),
                    ],
                  ),
                ),
                controller: controller,
                retryCallback: controller.loadJobs);
          }),
    );
  }
}
