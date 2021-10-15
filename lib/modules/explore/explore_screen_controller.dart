import 'package:arcopen_enquirer/core/base_controller.dart';
import 'package:arcopen_enquirer/http/responses/get_members_response.dart';
import 'package:arcopen_enquirer/utils/helpers/loading_state.dart';
import 'package:arcopen_enquirer/utils/mixins/toast_mixin.dart';
import 'package:arcopen_enquirer/utils/repositories/members_repository.dart';
import 'package:flutter/cupertino.dart';

class ExploreScreenController extends BaseController with ToastMixin {
  static final ExploreScreenController shared = ExploreScreenController();

  final TextEditingController searchController = TextEditingController();
  final MembersRepository repository = MembersRepository();

  List<Member> allMembers = [];
  List<Member> topRatedMembers = [];

  void loadMembers() {
    setState(() {
      state = LoadingState.loading;
    });
    repository.exploreMembers().then((value) {
      setState(() {
        allMembers = value.allMembers;
        topRatedMembers = value.highRated;
      });
    }).catchError((e) {
      setState(() {
        state = LoadingState.failed;
      });
    });
  }
}
