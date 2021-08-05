import 'package:flutter/material.dart';
import 'package:openarc_employer/utils/helpers/asset_helper.dart';

class StackAvatar extends StatelessWidget {
  const StackAvatar({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22.0 + 13 * data['avatar'].length,
      child: Stack(
        children: List<Widget>.from(data['avatar'].map((data) {
          return Positioned(
            left: data['index'] * 13.0,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                image: DecorationImage(
                  image: AssetImage(
                    AssetHelper.getAsset(name: data['photo']),
                  ),
                ),
              ),
            ),
          );
        }).toList()),
      ),
    );
  }
}
