import 'package:arcopen_enquirer/utils/helpers/loading_state.dart';
import 'package:arcopen_enquirer/utils/mixins/toast_mixin.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class InboxListController extends OkitoController with ToastMixin {
  InboxListController._internal();
  static final InboxListController _singleton = InboxListController._internal();

  factory InboxListController() {
    return _singleton;
  }

  LoadingState loadingState = LoadingState.success;

  var messages = [];

  final TextEditingController searchController = TextEditingController();
  void getInboxList() {}
}
