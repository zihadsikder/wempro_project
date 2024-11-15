import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wempro_project/app/core/config/app_colors.dart';
import 'package:wempro_project/app/core/constants/app_text_style.dart';
import 'package:wempro_project/app/core/widgets/button_widgets.dart';
import 'package:wempro_project/app/modules/home/controllers/home_controller.dart';

class SummaryPage extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBgColor,
      appBar: AppBar(
        title: Text("Summary"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Selected Input',
                  style: AppTextStyles.normalStyle(),
                ),
                // Show number of selected inputs (responses)
                Text(
                  '${controller.responses.length} items',
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              padding: EdgeInsets.only(top: 16, right: 16, left: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.white),
              child: ListView(
                shrinkWrap: true, // Prevent ListView from growing too large
                children: [
                  // Check if there are any responses to show
                  if (controller.responses.isNotEmpty)
                    // Iterate over each response in controller.responses
                    for (var entry in controller.responses.entries)
                      // Find the corresponding attribute using the ID
                      if (controller.entity.value?.jsonResponse?.attributes !=
                          null)
                        // Find the attribute by ID
                        for (var attribute in controller
                            .entity.value!.jsonResponse!.attributes!)
                          if (attribute.id == entry.key)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Display the title of the attribute (bolded)
                                Icon(
                                  Icons.square_outlined,
                                  size: 18,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '${attribute.title} : ',
                                  style: AppTextStyles.normalStyle().copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8),
                                // Display the selected value or "No Value"
                                Expanded(
                                  child: Text(
                                    entry.value?.toString() ?? "No Value",
                                    style: AppTextStyles.normalStyle(),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ), // Row with field title and value
                  SizedBox(height: 8.0),
                  Container(height: 2, color: AppColors.hintTextColor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Edit Selections"),
                      IconButton(
                        onPressed: () {
                          // Navigate back to the input page
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ButtonWidgets(
              text: 'Back',
              onPressed: () {
                Get.back(); // Navigate back to the input screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
