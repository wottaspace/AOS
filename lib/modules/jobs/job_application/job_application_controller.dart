import 'package:arcopen_enquirer/core/base_controller.dart';
import 'package:arcopen_enquirer/utils/helpers/loading_state.dart';
import 'package:arcopen_enquirer/utils/repositories/jobs_repository.dart';

class JobApplicationController extends BaseController {
  static final JobApplicationController shared = JobApplicationController();
  final JobsRepository repository = JobsRepository();

  rejectApplication(int id) {
    setState(() {
      state = LoadingState.loading;
    });
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        state = LoadingState.success;
      });
    });
    // repository.rejectApplication(id).then((value) {
    //   setState(() {
    //     state = LoadingState.success;
    //   });
    // }).catchError((e) {
    //   setState(() {
    //     state = LoadingState.failed;
    //   });
    // });
  }

  confirmApplication(int id) {
    setState(() {
      state = LoadingState.loading;
    });
    repository.rejectApplication(id).then((value) {
      setState(() {
        state = LoadingState.success;
      });
    }).catchError((e) {
      setState(() {
        state = LoadingState.failed;
      });
    });
  }
}
