import 'package:arcopen_enquirer/core/base_controller.dart';
import 'package:arcopen_enquirer/core/models/fund_details.dart';
import 'package:arcopen_enquirer/utils/helpers/loading_state.dart';
import 'package:arcopen_enquirer/utils/repositories/jobs_repository.dart';
import 'package:arcopen_enquirer/widgets/dialogs/k_loader.dart';

class JobApplicationController extends BaseController {
  static final JobApplicationController shared = JobApplicationController();
  final JobsRepository repository = JobsRepository();

  FundDetails? fundDetails;

  rejectApplication(int id) {
    KLoader(message: "Decline in progress").show();
    repository.rejectApplication(id).then((value) {
      KLoader.hide();
    }).catchError((e) {
      KLoader.hide();
    });
  }

  loadFundDetails(int id) {
    print(id);
    setState(() {
      state = LoadingState.loading;
    });
    repository.fundDetailsApplication(id).then((value) {
      setState(() {
        state = LoadingState.success;
      });
      fundDetails = value.fundDetails.first;
    }).catchError((e) {
      setState(() {
        state = LoadingState.failed;
      });
      print(e);
      this.showErrorToast(e ?? "failed to load data. please try later");
    });
  }
}
