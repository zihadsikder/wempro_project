import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wempro_project/app/core/constants/app_text_style.dart';

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
          ),
        ],
      );
    });
  }
}

class DropdownWidget extends StatelessWidget {
  final Attribute field;
  final HomeController controller;

  const DropdownWidget({super.key, required this.field, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            errorText: controller.responses[field.id ?? ""] == null && field.required
                ? 'This field is required'  // Error if not selected
                : null,
          ),
          items: (field.options ?? []).map((option) {
            return DropdownMenuItem(value: option, child: Text(option));
          }).toList(),
          onChanged: (value) => controller.responses[field.id ?? ""] = value,
        ),
      ],
    );
  }
}

class RadioWidget extends StatelessWidget {
  final Attribute field;
  final HomeController controller;

  const RadioWidget({super.key, required this.field, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title with styling and padding
        Text(
          field.title ?? "Title",
          style: AppTextStyles.titleStyle(),
        ),
        SizedBox(height: 8), // Padding after the title

        // Radio options
        ...field.options?.map((option) {
          return RadioListTile<String>(
            title: Text(option),
            value: option,
            groupValue: controller.responses[field.id ?? ""],
            onChanged: (value) => controller.responses[field.id ?? ""] = value,
          );
        }).toList() ?? [],
      ],
    );
  }
}

class CheckboxWidget extends StatelessWidget {
  final Attribute field;
  final HomeController controller;

  const CheckboxWidget({super.key, required this.field, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title with styling and padding
        Text(
          field.title ?? "Title",
          style: AppTextStyles.titleStyle(),
        ),
        SizedBox(height: 8), // Padding after the title

        // Checkbox options
        ...field.options?.map((option) {
          return CheckboxListTile(
            title: Text(option),
            value: controller.responses[field.id ?? ""]?.contains(option) ?? false,
            onChanged: (bool? selected) {
              if (selected == true) {
                controller.responses[field.id ?? ""] = (controller.responses[field.id ?? ""] ?? [])..add(option);
              } else {
                controller.responses[field.id ?? ""]?.remove(option);
              }
            },
          );
        }).toList() ?? [],
      ],
    );
  }
}


