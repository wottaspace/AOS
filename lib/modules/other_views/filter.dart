import 'package:flutter/material.dart';
import 'package:openarc_employer/utils/functions.dart';
import 'package:openarc_employer/config/routes/k_router.dart';
import 'package:openarc_employer/constants/fake_data.dart';
import 'package:openarc_employer/modules/widgets/other_views/hourly_rate.dart';
import 'package:openarc_employer/modules/widgets/other_views/rating_item.dart';
import 'package:openarc_employer/modules/widgets/shared/grey_title.dart';
import 'package:openarc_employer/modules/widgets/shared/search.dart';
import 'package:openarc_employer/modules/widgets/shared/outline_button.dart'
    as outlinedButton;

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List hourlyRates = FakeData.hourlyRateData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, title: 'Filter'),
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
                child: GreyTitleScreen(label: 'Rating'),
              ),
              SizedBox(height: 10),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 9, horizontal: 15.0),
                      child: RatingItem(index: index),
                    );
                  }),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GreyTitleScreen(label: 'Hourly Rate'),
              ),
              SizedBox(height: 10),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: hourlyRates.length,
                  itemBuilder: (context, index) {
                    Map hourlyRate = hourlyRates[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 9, horizontal: 15.0),
                      child: HourlyItem(hourlyRate: hourlyRate),
                    );
                  })
            ],
          ),
        ));
  }
}
