import 'dart:io';

import 'package:arcopen_enquirer/utils/mixins/toast_mixin.dart';
import 'package:arcopen_enquirer/utils/mixins/validation_mixin.dart';
import 'package:arcopen_enquirer/utils/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:okito/okito.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:phone_code_picker/phone_code_picker.dart';

class ProfileController extends OkitoController with ToastMixin, ValidationMixin {
  ProfileController._internal();
  static final ProfileController _singleton = ProfileController._internal();

  factory ProfileController() {
    return _singleton;
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? resumeFile;
  File? profilePicFile;
  String contactDialCode = "+1";

  String companyContactDialCode = "+1";
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController registrationNumberController = TextEditingController();
  final TextEditingController acsRefNumberController = TextEditingController();
  final TextEditingController companyContactController = TextEditingController();

  String? get getResumeFilename => resumeFile == null ? null : basename(resumeFile!.path);

  void prefillForm() {}

  Future<void> pickPictureFile() async {
    // FilePickerResult? result = await FilePicker.platform.pickFiles(
    //   type: FileType.image,
    // );
    // if (result != null) {
    //   profilePicFile = File(result.files.single.path);
    //   setState(() {});
    // }
  }

  Future<String?> _pickPhoneCode() async {
    String? dialCode;
    await showModalBottomSheet(
      context: Okito.context!,
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      builder: (_) => Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(Okito.context!).viewPadding.bottom),
        child: PhoneCodePicker(
          primaryColor: Okito.theme.primaryColor,
          onSelected: (country) {
            dialCode = country.dialCode;
          },
        ),
      ),
    );
    return dialCode;
  }

  Future<void> pickPhoneCode() async {
    contactDialCode = await _pickPhoneCode() ?? "+1";
    setState(() {});
  }

  Future<void> pickCompanyPhoneCode() async {
    companyContactDialCode = await _pickPhoneCode() ?? "+1";
    setState(() {});
  }

  void createOrUpdateProfile() {
    if (formKey.currentState!.validate()) {
      if (Okito.use<AuthService>().profileExists)
        _updateProfile();
      else
        _createProfile();
    }
  }

  FormData computeFormData() {
    return FormData.fromMap({});
  }

  _createProfile() {}

  _updateProfile() {}
}
