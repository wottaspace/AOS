import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/modules/widgets/shared/image_icon.dart'
    as imageIcon;

class Search extends StatelessWidget {
  const Search({Key? key, this.controller}) : super(key: key);

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(color: KColor.primary, width: .2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(40)),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: imageIcon.ImageIcon(
            uri: 'search.png',
          ),
          hintText: 'Search',
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
