import 'package:arcopen_enquirer/constants/color_constants.dart';
import 'package:arcopen_enquirer/modules/jobs/post_job/form_steps/step_five.dart';
import 'package:arcopen_enquirer/modules/jobs/post_job/form_steps/step_four.dart';
import 'package:arcopen_enquirer/modules/jobs/post_job/form_steps/step_one.dart';
import 'package:arcopen_enquirer/modules/jobs/post_job/form_steps/step_three.dart';
import 'package:arcopen_enquirer/modules/jobs/post_job/form_steps/step_two.dart';
import 'package:arcopen_enquirer/widgets/jobs/title_bar.dart';
import 'package:flutter/material.dart';

class PostJobScreen extends StatefulWidget {
  const PostJobScreen({Key? key}) : super(key: key);

  @override
  _PostJobScreenState createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  late int _currentIndex;
  final PageController pageController = PageController();

  @override
  void initState() {
    _currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.lightBlue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleBar(
            activeIndex: _currentIndex,
            onBackPressed: () {
              // TODO: block navigation to index 4, same in title bar
              if (_currentIndex < 5) {
                print("$_currentIndex Next");
                _goTo(++_currentIndex);
              }
            },
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              physics: PageScrollPhysics(),
              children: [
                StepOne(
                  onCategorySelected: (category) {
                    _goTo(++_currentIndex);
                  },
                ),
                StepTwo(
                  onNextButtonTapped: () {
                    _goTo(++_currentIndex);
                  },
                  onSaveDraftsTapped: () {
                    // TODO: save draft
                  },
                ),
                StepThree(
                  onNextButtonTapped: () {
                    _goTo(++_currentIndex);
                  },
                  onSaveDraftsTapped: () {
                    // TODO: save draft
                  },
                ),
                StepFour(
                  onNextButtonTapped: () {
                    _goTo(++_currentIndex);
                  },
                  onSaveDraftsTapped: () {
                    // TODO: save draft
                  },
                ),
                StepFive(
                  onNextButtonTapped: () {
                    _goTo(++_currentIndex);
                  },
                  onSaveDraftsTapped: () {
                    // TODO: save draft
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _goTo(int index) {
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }
}
