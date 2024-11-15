import 'package:get/get.dart';
import 'package:wempro_project/app/data/models/entity.dart';

import '../../../services/field_api_services.dart';

class HomeController extends GetxController {
  final FieldApiService _apiService = FieldApiService();

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
    errors.clear(); // Clear previous errors

    for (var attribute in entity.value?.jsonResponse?.attributes ?? []) {
      var value = responses[attribute.id ?? ""];
      if (attribute.required == true && (value == null || value.toString().trim().isEmpty)) {
        isValid = false;
        errors[attribute.id ?? ""] = 'This field is required';
      } else {
        errors[attribute.id ?? ""] = null; // Clear error for valid fields
      }
    }

    if (!isValid) {
      Get.snackbar("Validation Error", "Please fill in all required fields");
    }

    return isValid;
  }
}
