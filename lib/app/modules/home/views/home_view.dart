import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wempro_project/app/core/config/app_colors.dart';
import 'package:wempro_project/app/modules/home/views/summary_page.dart';
import 'package:wempro_project/app/modules/home/views/widgets/form_field_widgets.dart';

import '../../../core/widgets/button_widgets.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBgColor,
      appBar: AppBar(title: Text("Input Types")),
      body: Obx(() {
        if (controller.entity.value == null) {
          return Center(child: CircularProgressIndicator());
        } else {
          final attributes = controller.entity.value!.jsonResponse?.attributes;
          return ListView(
            padding: EdgeInsets.all(16),
            children: [
              ...attributes!.map((attribute) {
                switch (attribute.type) {
                  case 'text':
                    return TextFieldWidget(field: attribute, controller: controller);
                  case 'dropdown':
                    return DropdownWidget(field: attribute, controller: controller);
                  case 'radio':
                    return RadioWidget(field: attribute, controller: controller);
                  case 'checkbox':
                    return CheckboxWidget(field: attribute, controller: controller);
                  default:
                    return SizedBox.shrink();
                }
              }).toList(),
              SizedBox(height: 20),
              ButtonWidgets(
                text: 'Submit',
                onPressed: () {
                  if (controller.validateFields()) {
                    // Navigate to Summary Page
                    Get.to(SummaryPage());
                  }
                },
              ),
            ],
          );
        }
      }),
    );
  }
}
