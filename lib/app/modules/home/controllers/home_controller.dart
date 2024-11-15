import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wempro_project/app/data/models/entity.dart';

import '../../../services/field_api_services.dart';

class HomeController extends GetxController {
  final FieldApiService _apiService = FieldApiService();

  final formKey = GlobalKey<FormState>();

  var entity = Rxn<Entity>(); // Use Rxn to handle null initial state
  var responses = <String, dynamic>{}.obs;
  var errors = <String, String?>{}.obs; // Track validation errors

  @override
  void onInit() {
    super.onInit();
    fetchFields();
  }

  void fetchFields() async {
    try {
      entity.value = await _apiService.fetchFields();
    } catch (e) {
      Get.snackbar("Error", "Failed to load fields");
    }
  }

  bool validateFields() {
    bool isValid = true;
    errors.clear(); // Clear all previous errors before validating

    for (var attribute in entity.value?.jsonResponse?.attributes ?? []) {
      var fieldId = attribute.id ?? "";
      var response = responses[fieldId];

      if (attribute.required == true) {
        if (response == null || response.isEmpty) {
          isValid = false;
          errors[fieldId] = '${attribute.title ?? "This field"} is required';
        } else {
          errors[fieldId] = null; // Clear error if valid
        }
      }
    }

    if (!isValid) {
      Get.snackbar(
        "Validation Error",
        "Please fill all required fields.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    }

    return isValid;
  }
}
