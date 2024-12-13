import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wempro_project/app/core/config/app_colors.dart';
import 'package:wempro_project/app/modules/home/views/summary_page.dart';
import 'package:wempro_project/app/modules/home/views/widgets/check_box_widgets.dart';
import 'package:wempro_project/app/modules/home/views/widgets/drop_down_widgets.dart';
import 'package:wempro_project/app/modules/home/views/widgets/radio_widgets.dart';
import 'package:wempro_project/app/modules/home/views/widgets/text_field_widgets.dart';

import '../../../core/widgets/button_widgets.dart';
import '../controllers/home_controller.dart';

// class HomeView extends GetView<HomeController> {
//   const HomeView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.screenBgColor,
//       appBar: AppBar(title: Text("Input Types")),
//       body: SafeArea(
//         child: Form(
//           key: controller.formKey,
//           child: Obx(() {
//             if (controller.entity.value == null) {
//               return Center(child: CircularProgressIndicator());
//             } else {
//               final attributes =
//                   controller.entity.value!.jsonResponse?.attributes;
//               return ListView(
//                 padding: EdgeInsets.all(16),
//                 children: [
//                   ...attributes!.map((attribute) {
//                     switch (attribute.type) {
//                       case 'text':
//                       case 'textfield': // Ensure textField type is handled
//                         return TextFieldWidget(
//                             field: attribute, controller: controller);
//                       case 'dropdown':
//                         return DropdownWidget(
//                             field: attribute, controller: controller);
//                       case 'radio':
//                         return RadioWidget(
//                             field: attribute, controller: controller);
//                       case 'checkbox':
//                         return CheckboxWidget(
//                             field: attribute, controller: controller);
//                       default:
//                         return SizedBox.shrink();
//                     }
//                   }).toList(),
//                   SizedBox(height: 20),
//                   ButtonWidgets(
//                       text: 'Submit',
//                       onPressed: () {
//                         if (controller.formKey.currentState?.validate() ==
//                             true) {
//                           Get.to(SummaryPage());
//                         } else {
//                           Get.snackbar(
//                             'Validation Error',
//                             'Please fill in all required fields',
//                             snackPosition: SnackPosition.BOTTOM,
//                             backgroundColor: Colors.redAccent,
//                             colorText: Colors.white,
//                           );
//                         }
//                       }),
//                 ],
//               );
//             }
//           }),
//         ),
//       ),
//     );
//   }
// }
class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _selectedButton = 'login'; // Default selected button
  String? _selectedOption = 'Call'; // Default value for dropdown
  String _selectedGender = 'Gender'; // Default value
  String password = ''; // To track password input
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBgColor,
      appBar: AppBar(
        // title: Center(
        //   child:Image.asset('assets/images/texi_logo.png',height: 30,),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //Image.asset("assets/texi_logo.png"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.all(8.0),
                //margin: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedButton = 'login';
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: _selectedButton == 'login'
                            ? Colors.yellow.shade700
                            : Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:36,vertical: 8),
                        child: Text(
                          'Log in',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      width: 2,
                      thickness: 1,
                      color: Colors.red,

                    ),
                    // Container(
                    //   width: 1, // Width for the vertical divider
                    //   height: 30, // Height of the divider
                    //   color: Colors.grey, // Color of the divider
                    //   margin: EdgeInsets.symmetric(
                    //       horizontal: 10), // Space around the divider
                    // ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _selectedButton = 'signup';
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: _selectedButton == 'signup'
                              ? Colors.yellow.shade700
                              : Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:36,vertical: 8),
                          child: Text('Sign Up',  style: TextStyle(fontSize: 16, color: Colors.black)),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            DropdownButton<String>(
              value: _selectedOption,
              items: ['Call', 'Email']
                  .map((option) => DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              ))
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedOption = newValue;
                  _controller.clear(); // Clear input when switching
                });
              },
            ),

            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                // Add DropdownButton in prefix
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButton<String>(
                      value: _selectedOption,
                      items: [
                        DropdownMenuItem<String>(
                          value: 'Call',
                          child: Row(
                            children: [
                              Icon(Icons.phone, color: Colors.grey), // Call Icon
                            ],
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Email',
                          child: Row(
                            children: [
                              Icon(Icons.email, color: Colors.grey), // Email Icon
                            ],
                          ),
                        ),
                      ],
                      onChanged: (newValue) {
                        setState(() {
                          _selectedOption = newValue;
                          _controller.clear(); // Clear input when switching
                        });
                      },
                      underline: SizedBox(), // Removes default underline
                    ),
                    VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: Colors.red, // Divider color
                    ),
                  ],
                ),
                labelText: 'User Name',
                hintText: _selectedOption == 'Call' ? '+880 14....' : '.....@gmail.com',
                contentPadding: EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.yellow.shade700,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey, // Color when the field is not focused
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: _selectedOption == 'Call' ? TextInputType.phone : TextInputType.emailAddress,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gender Dropdown
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(Icons.male, color: Colors.grey), // Gender Icon
                      ),
                      VerticalDivider(
                        width: 1,
                        thickness: 1,
                        color: Colors.grey.shade300, // Divider color
                      ),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedGender,
                            items: ['Gender', 'Male', 'Female', 'Other']
                                .map((option) => DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            ))
                                .toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedGender = newValue!;
                              });
                            },
                            icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Password TextField with Strength Indicator
                TextField(
                  onChanged: (value) {
                    setState(() {
                      password = value; // Update password value
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.grey), // Lock Icon
                    suffixIcon: Icon(Icons.visibility_off, color: Colors.grey), // Eye Icon
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow.shade700, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Password Strength Indicator
                Row(
                  children: [
                    Text(
                      "Strong",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Row(
                        children: List.generate(5, (index) {
                          // Dynamic strength indicators
                          Color color;
                          if (password.length >= (index + 1) * 2) {
                            color = Colors.yellow; // Highlight if threshold is met
                          } else {
                            color = Colors.grey.shade300; // Default color
                          }
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2),
                              child: Container(
                                height: 5,
                                color: color,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
