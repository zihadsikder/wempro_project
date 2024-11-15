import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../data/models/entity.dart';
import '../../controllers/home_controller.dart';

class TextFieldWidget extends StatelessWidget {
  final Attribute field;
  final HomeController controller;

  const TextFieldWidget({
    required this.field,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            field.title ?? "Title",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              labelText: field.title ?? "Title",
              errorText: controller.errors[field.id ?? ""], // Display error
            ),
            onChanged: (value) {
              controller.responses[field.id ?? ""] = value;
            },
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter value';
              }
              return null;
            },
          ),
        ],
      );
    });
  }
}
