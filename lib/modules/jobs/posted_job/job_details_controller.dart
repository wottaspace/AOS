import 'package:arcopen_enquirer/core/base_controller.dart';
import 'package:arcopen_enquirer/core/models/applicant.dart';
import 'package:arcopen_enquirer/core/models/job.dart';
import 'package:arcopen_enquirer/utils/helpers/loading_state.dart';
import 'package:arcopen_enquirer/utils/mixins/dialog_mixin.dart';
import 'package:arcopen_enquirer/utils/repositories/jobs_repository.dart';

class PostedJobDetailsController extends BaseController with DialogMixin {
  PostedJobDetailsController._internal();
  static final PostedJobDetailsController _singleton =
      PostedJobDetailsController._internal();

  final JobsRepository _repository = JobsRepository();

  List<Applicant> applicants = [];
  Job? job;

  factory PostedJobDetailsController() {
    return _singleton;
  }

  @override
  void dispose() {
    applicants = [];
    job = null;
    super.dispose();
  }

  void loadJobDetails({required int jobId}) {
    setState(() {
      state = LoadingState.loading;
    });
    _repository.getJobDetails(jobId).then((value) {
      setState(() {
        state = LoadingState.success;
      });
      job = value.jobDetails.first;
      applicants = value.applicants;
    }).catchError((e) {
      setState(() {
        state = LoadingState.failed;
      });
    });
  }
}
