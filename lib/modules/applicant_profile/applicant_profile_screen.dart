import 'package:flutter/material.dart';

class ApplicantProfileScreen extends StatefulWidget {
  const ApplicantProfileScreen({Key? key}) : super(key: key);

  @override
  _ApplicantProfileScreenState createState() => _ApplicantProfileScreenState();
}

class _ApplicantProfileScreenState extends State<ApplicantProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Text("Hello"),
            ],
          ),
        ),
      ),
    );
  }
}
