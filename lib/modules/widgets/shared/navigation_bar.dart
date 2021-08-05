import 'package:flutter/material.dart';
import 'package:openarc_employer/modules/widgets/shared/image_icon.dart'
    as imageIcon;

class KNavigationBar extends StatelessWidget {
  const KNavigationBar({Key? key, this.index, this.onTap}) : super(key: key);
  final int? index;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedFontSize: 10,
        onTap: onTap,
        currentIndex: index ?? 0,
        items: [
          BottomNavigationBarItem(
              icon: imageIcon.ImageIcon(
                  uri: index == 0 ? "search_colored.png" : "search.png"),
              label: "EXPLORE"),
          BottomNavigationBarItem(
              icon: imageIcon.ImageIcon(
                  uri: index == 1 ? "comment_colored.png" : "comment.png"),
              label: "INBOX"),
          BottomNavigationBarItem(
              icon: imageIcon.ImageIcon(
                  uri: index == 2 ? "list_bag_colored.png" : "list_bag.png"),
              label: "JOB LISTING"),
          BottomNavigationBarItem(
              icon: imageIcon.ImageIcon(
                  uri: index == 3 ? "key.png" : "money.png"),
              label: "FINANCES"),
          BottomNavigationBarItem(
              icon: imageIcon.ImageIcon(
                  uri: index == 4 ? "favorite_colored.png" : "favorite.png"),
              label: "SAVED"),
        ]);
  }
}
