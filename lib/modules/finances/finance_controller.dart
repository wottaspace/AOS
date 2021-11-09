import 'package:arcopen_enquirer/core/base_controller.dart';
import 'package:arcopen_enquirer/core/models/finance.dart';
import 'package:arcopen_enquirer/utils/helpers/loading_state.dart';
import 'package:arcopen_enquirer/utils/mixins/toast_mixin.dart';
import 'package:arcopen_enquirer/utils/repositories/finance_repository.dart';

class FinanceController extends BaseController with ToastMixin {
  final FinanceRepository repository = FinanceRepository();
  String funded = "£0";
  List<Finance> paidTransactions = [];
  String totalJobs = "";
  String totalPaid = "£0";
  List<Finance> unpaidTransactions = [];

  void loadFinanceDetails() {
    setState(() {
      state = LoadingState.loading;
    });
    repository.loadFinances().then((value) {
      setState(() {
        state = LoadingState.success;
        funded = value.funded;
        paidTransactions = value.paidTransactions;
        totalJobs = value.totalJobs;
        totalPaid = value.totalPaid;
        unpaidTransactions = value.unpaidTransactions;
      });
    }).catchError((e) {
      setState(() {
        state = LoadingState.failed;
      });
    });
  }
}
