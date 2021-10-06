import 'package:arcopen_enquirer/config/routes/k_routes.dart';
import 'package:arcopen_enquirer/constants/color_constants.dart';
import 'package:arcopen_enquirer/modules/inbox/inbox_list/inbox_list_controller.dart';
import 'package:arcopen_enquirer/utils/helpers/asset_helper.dart';
import 'package:arcopen_enquirer/utils/helpers/loading_state.dart';
import 'package:arcopen_enquirer/utils/inbox/inbox_card.dart';
import 'package:arcopen_enquirer/widgets/buttons/k_button.dart';
import 'package:arcopen_enquirer/widgets/forms/k_text_field.dart';
import 'package:arcopen_enquirer/widgets/states/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  final InboxListController controller = InboxListController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.getInboxList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OkitoBuilder(
      controller: controller,
      builder: () {
        Widget pageContent = SizedBox();

        Widget pageStateContainer(Widget child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child,
              ],
            ),
          );
        }

        switch (controller.loadingState) {
          case LoadingState.failed:
            pageContent = pageStateContainer(
              KButton(
                onPressed: controller.getInboxList,
                title: "Try again",
                color: Okito.theme.primaryColor,
              ),
            );
            break;
          case LoadingState.loading:
            pageContent = pageStateContainer(
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Container(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(),
                ),
              ),
            );
            break;
          case LoadingState.success:
            pageContent = controller.messages.isEmpty
                ? pageStateContainer(
                    EmptyState(
                      stateType: StateType.message,
                    ),
                  )
                : ListView.builder(
                    itemCount: controller.messages.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      ImageProvider userProfilePicture = AssetImage(AssetHelper.getAsset(name: "avatar.png"));
                      return InboxCard(
                        description: "Hello world",
                        sentAt: "6:80 PM",
                        title: "Harry Sahir",
                        userPicture: userProfilePicture,
                        onTap: () {
                          Okito.pushNamed(KRoutes.inboxDetailsRoute);
                        },
                      );
                    },
                  );
            break;
          case LoadingState.pending:
            pageContent = SizedBox();
            break;
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                KTextField.circular(
                  hintText: "Search",
                  leading: PhosphorIcons.magnifying_glass,
                  controller: controller.searchController,
                ),
                SizedBox(height: 20),
                Text(
                  "ALL MESSAGES",
                  style: Okito.theme.textTheme.bodyText2!.copyWith(
                    fontSize: 10.0,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.w600,
                    color: ColorConstants.greyColor,
                  ),
                ),
                pageContent,
              ],
            ),
          ),
        );
      },
    );
  }
}
