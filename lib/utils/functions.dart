import 'package:flutter/material.dart';
import 'package:arcopen_enquirer/config/routes/k_router.dart';
import 'package:arcopen_enquirer/utils/extensions/build_context.dart';
import 'package:okito/src/okito_extensions/string_extensions.dart';

PreferredSize customAppBar(BuildContext context,
    {required String title, Widget? trailing}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(90),
    child: Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(width: 10),
            GestureDetector(
              onTap: KRouter().pop,
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black54,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                '$title',
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.headline3?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            trailing ?? Container()
          ],
        ),
      ),
    ),
  );
}

String month(int value) {
  List<String> months = [
    "January",
    "Febuary",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  return months[value - 1];
}

String getTotalHours(String endTime, String startTime) {
  int diffNotTreated = endTime.split(" ").first.split(":").join("").toInt() -
      startTime.split(" ").first.split(":").join("").toInt();

  if (diffNotTreated < 100) {
    return (diffNotTreated / 60).toStringAsPrecision(1);
  } else if (diffNotTreated < 1000) {
    return ((diffNotTreated / 60).toString().toDouble() +
            60 * diffNotTreated.toString().split("").first.toInt())
        .toStringAsPrecision(4);
  } else {
    return ((diffNotTreated / 60).toString().toDouble() +
            60 *
                (diffNotTreated.toString().split("")[0] +
                        diffNotTreated.toString().split("")[1])
                    .toInt())
        .toStringAsPrecision(4);
  }
}
