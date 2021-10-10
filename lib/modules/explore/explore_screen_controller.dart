import 'package:arcopen_enquirer/utils/mixins/toast_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:okito/okito.dart';

class ExploreScreenController extends OkitoController with ToastMixin {
  ExploreScreenController._internal();
  static final ExploreScreenController _singleton = ExploreScreenController._internal();

  factory ExploreScreenController() {
    return _singleton;
  }

  final TextEditingController searchController = TextEditingController();
}