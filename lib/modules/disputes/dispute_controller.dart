import 'package:arcopen_enquirer/core/base_controller.dart';
import 'package:arcopen_enquirer/core/models/dispute.dart';
import 'package:arcopen_enquirer/utils/helpers/loading_state.dart';
import 'package:arcopen_enquirer/utils/mixins/toast_mixin.dart';
import 'package:arcopen_enquirer/utils/repositories/jobs_repository.dart';

class DisputeController extends BaseController with ToastMixin {
  final JobsRepository repository = JobsRepository();
  List<Dispute> disputes = [];

  void loadDispute() {
    setState(() {
      state = LoadingState.loading;
    });
    repository.getDisputeJobs().then((value) {
      setState(() {
        state = LoadingState.success;
        disputes = value.disputes;
      });
    }).catchError((e) {
      setState(() {
        state = LoadingState.failed;
      });
    });
  }
}
