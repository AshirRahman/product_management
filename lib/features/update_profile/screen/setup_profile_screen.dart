import 'package:course_online/core/common/widgets/custom_button.dart';
import 'package:course_online/core/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../controller/setup_profile_controller.dart';

class SetupProfileScreen extends StatelessWidget {
  SetupProfileScreen({super.key});

  final SetupProfileController controller = Get.put(SetupProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                /// Back Button
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back),
                ),

                const SizedBox(height: 10),

                /// Title
                const Center(
                  child: Text(
                    "Set Up Profile",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// Profile Image
                const Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Upload profile picture",
                        style: TextStyle(
                          color: Color(0xff2D6CDF),
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// About
                const Text(
                  "About",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),

                const SizedBox(height: 8),

                TextField(
                  controller: controller.aboutController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText:
                        "We are a dedicated home service provider offering a wide range of expert solutions...",
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// Date of Birth
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      Container(
                        height: 350,
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: SfDateRangePicker(
                          selectionMode: DateRangePickerSelectionMode.single,
                          onSelectionChanged: controller.onDateSelected,
                        ),
                      ),
                    );
                  },
                  child: AbsorbPointer(
                    child: CustomTextField(
                      label: "Date of Birth",
                      hintText: "Date of birth",
                      controller: controller.dobController,
                      suffixIcon: const Icon(Icons.calendar_today),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// Gender Dropdown
                Obx(
                  () => DropdownButtonFormField<String>(
                    initialValue: controller.selectedGender.value.isEmpty
                        ? null
                        : controller.selectedGender.value,
                    items: controller.genders
                        .map(
                          (gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ),
                        )
                        .toList(),
                    onChanged: (value) => controller.selectGender(value!),
                    decoration: InputDecoration(
                      labelText: "Gender",
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// Next Button
                CustomButton(
                  title: "Next",
                  onTap: controller.next,
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
