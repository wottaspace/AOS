import 'package:flutter/material.dart';
import 'package:openarc_employer/config/routes/k_router.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/modules/widgets/shared/label_text_field.dart';
import 'package:openarc_employer/modules/widgets/shared/outline_button.dart'
    as outlineButton;
import 'package:openarc_employer/utils/helpers/asset_helper.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class CompanyProfile extends StatefulWidget {
  const CompanyProfile({Key? key}) : super(key: key);

  @override
  _CompanyProfileState createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.primary,
      appBar: customAppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: LabelTextField(
                label: 'About',
                maxLines: 3,
                hint:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididut ut labare et dolore magna aliqua.',
              ),
            ),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                        child: LabelTextField(
                      label: 'Registration NO.',
                      hint: "xyz-1234",
                    )),
                    Expanded(
                        child: LabelTextField(
                      label: 'ACS REFERENCE NUMBER',
                      hint: 'xyz-abc-efgh',
                    )),
                  ],
                )),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                        child: LabelTextField(
                      label: 'CONTACT*',
                      hint: '+1(893)-000-00000',
                    )),
                    Expanded(
                        child: LabelTextField(
                      label: 'COMPANY CONTACT*',
                      hint: "+1(893)-000-00000",
                    )),
                  ],
                )),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: LabelTextField(
                label: 'ADDRESS',
                hint: '9 Richmond Road',
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: LabelTextField(
                label: 'ADDRESS',
                hint: '9 Richmond Road',
              ),
            ),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                        child: LabelTextField(
                      label: 'CITY',
                      hint: 'Bradford',
                    )),
                    Expanded(
                        child: LabelTextField(
                      label: 'Postal Code',
                      hint: "BD12 3ZY",
                    )),
                  ],
                )),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: outlineButton.OutlinedButton(
                label: "DONE",
              ),
            ),
            SizedBox(height: 100),
          ],
        )),
      ),
    );
  }

  PreferredSize customAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                  onTap: KRouter().pop,
                  child: Icon(Icons.arrow_back_ios, size: 25)),
              SizedBox(width: 15),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      AssetHelper.getAsset(name: 'avatar.jpg'),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tri-City Staffing',
                    style: context.textTheme.headline3?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'Cambridge, ON',
                    style: context.textTheme.headline3?.copyWith(
                      fontSize: 12,
                      color: Colors.white60,
                    ),
                  ),
                ],
              )
            ],
          ),
          actions: [Icon(Icons.more_vert, size: 30), SizedBox(width: 10)],
        ),
      ),
    );
  }
}
