import 'package:flutter/material.dart';
import 'package:openarc_employer/config/routes/k_router.dart';
import 'package:openarc_employer/config/routes/k_routes.dart';
import 'package:openarc_employer/constants/colors.dart';

class AvatarIcon extends StatelessWidget {
  final size;
  const AvatarIcon({
    this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => KRouter().push(KRoutes.companyProfileRoute),
      child: Container(
        height: size?.height ?? 50,
        width: size?.width ?? 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: KColor.purple,
        ),
      ),
    );
  }
}
