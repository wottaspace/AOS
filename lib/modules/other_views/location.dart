import 'package:flutter/material.dart';
import 'package:openarc_employer/config/routes/k_router.dart';
import 'package:openarc_employer/constants/fake_data.dart';
import 'package:openarc_employer/modules/widgets/other_views/location_item.dart';
import 'package:openarc_employer/modules/widgets/shared/grey_title.dart';
import 'package:openarc_employer/modules/widgets/shared/search.dart';
import 'package:openarc_employer/modules/widgets/shared/outline_button.dart'
    as outlinedButton;
import 'package:openarc_employer/utils/functions.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List locations = FakeData.locationData();
    return Scaffold(
        appBar: customAppBar(context, title: 'Location'),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
          child: outlinedButton.OutlinedButton(
            label: 'DONE',
            onTap: KRouter().pop,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Search(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GreyTitleScreen(label: 'Location'),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: locations.length,
                  itemBuilder: (context, index) {
                    Map location = locations[index];
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: LocationItem(location: location),
                    );
                  })
            ],
          ),
        ));
  }
}
