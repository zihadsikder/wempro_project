import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../core/constants/app_text_style.dart';
import '../../../../data/models/entity.dart';
import '../../controllers/home_controller.dart';

class DropdownWidget extends StatelessWidget {
  final Attribute field;
  final HomeController controller;

  const DropdownWidget(
      {super.key, required this.field, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            field.title ?? "Title",
            style: AppTextStyles.titleStyle(),
          ),
          SizedBox(height: 8),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: field.title ?? "Title",
              errorText:
                  controller.responses[field.id ?? ""] == null && field.required
                      ? 'This field is required' // Error if not selected
                      : null,
            ),
            items: (field.options ?? []).map((option) {
              return DropdownMenuItem(value: option, child: Text(option));
            }).toList(),
            onChanged: (value) => controller.responses[field.id ?? ""] = value,
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter value';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
