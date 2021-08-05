import 'package:flutter/material.dart';
import 'package:openarc_employer/utils/helpers/asset_helper.dart';

class ImageIcon extends StatelessWidget {
  final String uri;
  const ImageIcon({
    required this.uri,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetHelper.getAsset(name: uri));
  }
}
