import 'package:flutter/material.dart';
import 'package:openarc_employer/config/routes/k_router.dart';
import 'package:openarc_employer/config/routes/k_routes.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/modules/widgets/shared/rounded_button.dart';
import 'package:openarc_employer/utils/functions.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';
import 'package:openarc_employer/modules/widgets/shared/image_icon.dart'
    as imageIcon;

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int selectedId = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
        child: KRoundedButton(
          onTap: () => KRouter().push(KRoutes.successFundedJobRoute),
          label: 'Pay now',
          width: double.infinity,
          color: Colors.green,
        ),
      ),
      appBar: customAppBar(
        context,
        title: 'subscription',
        trailing: PopupMenuButton(
          child: Icon(
            Icons.more_vert,
            size: 30,
            color: Colors.black,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          itemBuilder: (context) {
            return [];
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Select your payment method',
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.headline3?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: SubscriptionItem(
                      icon: 'mastercard.png',
                      selected: true,
                      title: "Visa **** **** **** 2464",
                      bottom: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            'For security reasons, please re-enter your CVV',
                            style: context.textTheme.bodyText1?.copyWith(
                                fontSize: 10, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 52,
                            height: 38,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.orange.withOpacity(.3),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: '123',
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintStyle:
                                    context.textTheme.bodyText1?.copyWith(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: KColor.grey.withOpacity(.5),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: SubscriptionItem(
                      icon: 'mastercard.png',
                      selected: false,
                      title: "Add card",
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: SubscriptionItem(
                      icon: 'payment.png',
                      selected: false,
                      title: "Pre Added Money",
                      subtitle: "£500",
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubscriptionItem extends StatelessWidget {
  const SubscriptionItem(
      {Key? key,
      required this.icon,
      required this.title,
      this.subtitle,
      this.bottom,
      required this.selected})
      : super(key: key);

  final String icon, title;
  final String? subtitle;
  final Widget? bottom;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: selected
              ? EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                )
              : EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color:
                selected ? KColor.primary.withOpacity(.1) : Colors.transparent,
          ),
          child: Row(
            children: [
              imageIcon.ImageIcon(uri: icon),
              SizedBox(width: 10),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodyText1!.copyWith(
                        fontSize: 17,
                        fontWeight:
                            selected ? FontWeight.w700 : FontWeight.w400),
                  ),
                  if (subtitle != null) ...[
                    Column(
                      children: [
                        SizedBox(height: 6),
                        Text(
                          subtitle!,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.bodyText1!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: KColor.primary),
                        ),
                      ],
                    )
                  ]
                ],
              )),
              SizedBox(width: 10),
              selected
                  ? imageIcon.ImageIcon(uri: 'point.png')
                  : Icon(
                      Icons.circle_outlined,
                      size: 15,
                    )
            ],
          ),
        ),
        if (bottom != null) ...[bottom!]
      ],
    );
  }
}
