import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../core/constants/app_text_style.dart';
import '../../../../data/models/entity.dart';
import '../../controllers/home_controller.dart';

class CheckboxWidget extends StatelessWidget {
  final Attribute field;
  final HomeController controller;

  const CheckboxWidget(
      {super.key, required this.field, required this.controller});

  @override
  Widget build(BuildContext context) {
    final containerDecoration = BoxDecoration(
      color: Colors.white, // White background color
      borderRadius: BorderRadius.circular(8), // Optional: rounded corners
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
    );

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title with styling and padding
          Text(
            field.title ?? "Title",
            style: AppTextStyles.titleStyle(),
          ),
          SizedBox(height: 8), // Padding after the title

          // Checkbox options (single selection)
          ...field.options?.map((option) {
                return Container(
                  decoration: containerDecoration,
                  // Use theme decoration
                  margin: EdgeInsets.symmetric(vertical: 4),
                  // Add margin for spacing
                  child: CheckboxListTile(
                    title: Text(option),
                    value: controller.responses[field.id ?? ""] == option,
                    // Only one can be selected at a time
                    onChanged: (bool? selected) {
                      if (selected == true) {
                        // Select the current checkbox and deselect others
                        controller.responses[field.id ?? ""] = option;
                      } else {
                        // Deselect if unchecked
                        controller.responses[field.id ?? ""] = null;
                      }
                    },
                    tileColor: Colors
                        .transparent, // Make sure the background of the checkbox tile itself is transparent
                  ),
                );
              }).toList() ??
              [],

          // Add error text if validation fails
          if (controller.responses[field.id ?? ""] == null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Select one!',
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
