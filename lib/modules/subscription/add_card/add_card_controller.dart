import 'package:arcopen_enquirer/constants/app_constants.dart';
import 'package:arcopen_enquirer/core/base_controller.dart';
import 'package:arcopen_enquirer/core/models/payment_card.dart';
import 'package:arcopen_enquirer/utils/helpers/k_storage.dart';
import 'package:credit_card_input_form/model/card_info.dart';
import 'package:okito/okito.dart';

class AddCardController extends BaseController {
  AddCardController._internal();

  static final AddCardController _singleton = AddCardController._internal();

  factory AddCardController() {
    return _singleton;
  }

//  CardInfo? cardInfo;

//   addPaymentMethod() {}

  final AddCardController paymentController = AddCardController();

  CardInfo? cardInfo;

  // Payment methods management
  List<PaymentCard> getPaymentMethods() {
    return (KStorage.read<List<dynamic>>(key: AppConstants.paymentMethodsKey) ??
            [])
        .cast<Map<String, dynamic>>()
        .map(
          (e) => PaymentCard.fromJson(e),
        )
        .toList();
  }

  void addPaymentMethod() {
    if (cardInfo != null) {
      var paymentMethods = this.getPaymentMethods();
      if (paymentMethods
          .where((element) => element.cardNumber == cardInfo!.cardNumber)
          .isNotEmpty) {
        this.showErrorToast("You've already added this card.");
        return;
      }
      if ((int.tryParse(cardInfo!.validate!.split("/").first) ?? 0) > 12) {
        this.showErrorToast("Invalid validity date.");
        return;
      }
      paymentMethods.add(
        PaymentCard.fromJson({
          "cardNumber": cardInfo!.cardNumber,
          "expirationMonth": cardInfo!.validate!.split("/").first,
          "expirationYear": cardInfo!.validate!.split("/").last,
        }),
      );

      _savePaymentMethods(paymentMethods);
      paymentController.getPaymentMethods();
      Okito.pop();
      this.showSuccessToast("Payment method successfully added.");
    } else {
      this.showErrorToast("Please fill all the card info.");
    }
  }

  void removeCard(PaymentCard e) {
    var paymentMethods = this.getPaymentMethods();
    paymentMethods.removeWhere((element) => element.cardNumber == e.cardNumber);
    _savePaymentMethods(paymentMethods);
    paymentController.getPaymentMethods();
    Okito.pop();
    this.showSuccessToast("Payment method successfully removed.");
  }

  _savePaymentMethods(List<PaymentCard> paymentMethods) {
    KStorage.write(
        key: AppConstants.paymentMethodsKey,
        value: paymentMethods.map((e) => e.toJson()).toList());
  }
}
