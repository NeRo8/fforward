import 'package:fforward_adm/services/fb_technology_service.dart';
import 'package:fforward_adm/widgets/fields/technology_form_field/technology_form_field_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TechnologyFormField extends StatelessWidget {
  final String? selectedTechnologyId;
  final Function(String technologyId) onTapTechnology;

  final technologyService = FBTechnologyService(
    fbDB: FirebaseDatabase.instance,
  );

  TechnologyFormField(
      {super.key,
      required this.selectedTechnologyId,
      required this.onTapTechnology});

  @override
  Widget build(BuildContext context) {
    TechnologyFormFieldController controller = Get.put(
      TechnologyFormFieldController(
        selectedTechnologyId: selectedTechnologyId,
        technologyService: technologyService,
      ),
    );
    return Column(children: [
      TextFormField(
        onTap: () => controller.onChangeTechnologyListVisible(true),
        onTapOutside: (event) => {
          FocusScope.of(context).unfocus(),
          controller.onChangeTechnologyListVisible(false)
        },
        decoration: const InputDecoration(
          labelText: 'Technology',
          hintText: 'Select technology',
        ),
      ),
      Obx(
        () => controller.isFieldSelected.value
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: controller.technologies.length,
                itemBuilder: (ctx, idx) =>
                    Text(controller.technologies[idx].title),
              )
            : const SizedBox(),
      ),
    ]);
  }
}
