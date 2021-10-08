import 'package:arcopen_enquirer/constants/color_constants.dart';
import 'package:arcopen_enquirer/modules/auth/profile/profile_controller.dart';
import 'package:arcopen_enquirer/utils/helpers/badge_input_formatter.dart';
import 'package:arcopen_enquirer/widgets/buttons/k_button.dart';
import 'package:arcopen_enquirer/widgets/forms/k_text_field.dart';
import 'package:arcopen_enquirer/widgets/misc/section_title.dart';
import 'package:arcopen_enquirer/widgets/navigation/kp_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = ProfileController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      profileController.prefillForm();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = Okito.theme.textTheme.bodyText2!.copyWith(
      fontSize: 10.0,
      letterSpacing: 1.3,
      fontWeight: FontWeight.w600,
      color: ColorConstants.greyColor,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: Scaffold(
        body: SingleChildScrollView(
          child: OkitoBuilder(
            activateLifecycleForOtherControllers: true,
            controller: profileController,
            builder: () {
              return Form(
                key: profileController.formKey,
                child: Column(
                  children: [
                    KPAppBar(
                      controller: profileController,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          KTextField.soft(
                            label: "ABOUT",
                            controller: profileController.aboutController,
                            minLines: 3,
                            maxLines: 4,
                            hintText: "Lorem ipsum dolor sit atmet, consectur adipiscing elit, sed do eiusmod tempor incicident ut labore et dolore magna aliqua",
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: KTextField.soft(
                                  label: "DO YOU DRIVE ?",
                                  controller: profileController.driveController,
                                  hintText: "Type Yes or No",
                                  validator: (String? value) {
                                    return profileController.validateValueEquals(fieldName: "Drive option", value: value!, equalValues: ["yes", "no"]);
                                  },
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: KTextField.soft(
                                  label: "BADGE NUMBER",
                                  controller: profileController.badgeNumberController,
                                  inputFormatters: [
                                    BadgeInputFormatter(
                                      mask: 'xxxx-xxxx-xxxx-xxxx',
                                      separator: '-',
                                    ),
                                  ],
                                  validator: (String? value) {
                                    return profileController.validateRequired(fieldName: "badge number", value: value);
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: KTextField.soft(
                                  label: "CONTACT*",
                                  prefixIcon: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: profileController.pickPhoneCode,
                                    icon: FittedBox(
                                      child: Text("${profileController.contactDialCode}"),
                                    ),
                                  ),
                                  keybordType: TextInputType.number,
                                  controller: profileController.contactController,
                                  validator: (String? value) {
                                    return profileController.validateRequired(fieldName: "contact", value: value);
                                  },
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: KTextField.soft(
                                  label: "HOURLY RATE",
                                  keybordType: TextInputType.number,
                                  controller: profileController.hourlyRateController,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          KTextField.soft(
                            label: "UNAVAILABILITY",
                            suffixIcon: PhosphorIcons.calendar,
                            readOnly: true,
                            onTap: profileController.selectUnavailabilityRange,
                            controller: profileController.unavailabilityController,
                          ),
                          SizedBox(height: 20),
                          KTextField.soft(
                            label: "ADRESS",
                            controller: profileController.addressController,
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: KTextField.soft(
                                  label: "CITY",
                                  controller: profileController.cityController,
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: KTextField.soft(
                                  label: "POSTAL CODE",
                                  controller: profileController.postalCodeController,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: KButton.outlined(
            onPressed: () {},
            title: "DONE",
            color: Okito.theme.primaryColor,
          ),
        ),
      ),
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Okito.theme.primaryColor,
      ),
    );
  }
}
