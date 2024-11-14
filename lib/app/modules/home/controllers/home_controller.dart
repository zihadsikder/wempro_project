import 'package:get/get.dart';
import 'package:wempro_project/app/data/models/entity.dart';

import '../../../services/field_api_services.dart';

class HomeController extends GetxController {

  final FieldApiService _apiService = FieldApiService();

  var entity = Rxn<Entity>();  // Use Rxn to handle null initial state
  var responses = <String, dynamic>{}.obs;

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

    // Validate each attribute and ensure required fields are filled
    for (var attribute in entity.value?.jsonResponse?.attributes ?? []) {
      if (attribute.required == true && (responses[attribute.id ?? ""] == null || responses[attribute.id ?? ""] == "")) {
        isValid = false;
        break; // Stop on first invalid field
      }
    }
    return isValid;
  }
}

