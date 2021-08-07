import 'package:flutter/material.dart';
import 'package:openarc_employer/utils/helpers/asset_helper.dart';

class ImageIcon extends StatelessWidget {
  final String uri;
  final Function()? onTap;

  const ImageIcon({
    required this.uri,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap, child: Image.asset(AssetHelper.getAsset(name: uri)));
  }
}
