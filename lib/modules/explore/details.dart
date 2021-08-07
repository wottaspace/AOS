import 'package:flutter/material.dart';
import 'package:openarc_employer/modules/explore/components/details1.dart';
import 'package:openarc_employer/modules/explore/components/details2.dart';
import 'package:openarc_employer/utils/functions.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class DetailsExploreMembers extends StatefulWidget {
  const DetailsExploreMembers({Key? key}) : super(key: key);

  @override
  _DetailsExploreMembersState createState() => _DetailsExploreMembersState();
}

class _DetailsExploreMembersState extends State<DetailsExploreMembers> {
  int currentView = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'Talwar\'s Residency',
        trailing: PopupMenuButton(
          child: Icon(
            Icons.more_vert,
            size: 30,
            color: Colors.black,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                  child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() => currentView = currentView == 1 ? 2 : 1);
                },
                child: Text(
                  'Switch',
                  style: context.textTheme.headline5?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              )),
              PopupMenuItem(
                  child: GestureDetector(
                onTap: () {},
                child: Text(
                  'Raise Dispute',
                  style: context.textTheme.headline5?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              )),
              PopupMenuItem(
                  child: Text(
                'Help',
                style: context.textTheme.headline5?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              )),
            ];
          },
        ),
      ),
      body: currentView == 1 ? Details1Screen() : Details2Screen(),
    );
  }
}
