import 'package:fforward_adm/admin/pages/questions/questions_list/controller/questions_list_controller.dart';
import 'package:fforward_adm/controller/developer_levels_store_controller.dart';
import 'package:fforward_adm/controller/technologies_store_controller.dart';
import 'package:fforward_adm/models/question.dart';
import 'package:fforward_adm/admin/widgets/tables/url_table_field.dart';
import 'package:fforward_adm/admin/widgets/tables/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutterfire_ui/database.dart';
import 'package:get/get.dart';

class QuestionsTable extends StatelessWidget {
  final QuestionListController _controller = Get.find<QuestionListController>();

  final DeveloperLevelsStoreController developerLevelsStoreController =
      Get.find<DeveloperLevelsStoreController>();
  final TechnologiesStoreController technologiesStoreController =
      Get.find<TechnologiesStoreController>();

  QuestionsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CTableRow(
          children: [
            CTableCell(flex: 2, title: "ID"),
            CVerticalDivider(),
            CTableCell(flex: 3, title: "Technology"),
            CVerticalDivider(),
            CTableCell(flex: 3, title: "Developer level"),
            CVerticalDivider(),
            CTableCell(flex: 4, title: "Title"),
            CVerticalDivider(),
            CTableCell(flex: 4, title: "Description"),
            CVerticalDivider(),
            CTableCell(flex: 3, title: "Links"),
          ],
        ),
        Expanded(
          child: FirebaseDatabaseListView(
            query: _controller.questionTable,
            itemBuilder: (context, snapshot) {
              final Question question =
                  Question.fromJson((snapshot.value as Map));

              return CTableRow(
                children: [
                  CTableCell(flex: 2, title: question.id ?? ""),
                  const CVerticalDivider(),
                  CTableCell(flex: 3, title: question.technology.title),
                  const CVerticalDivider(),
                  CTableCell(flex: 3, title: question.developerLevel.title),
                  const CVerticalDivider(),
                  CTableCell(flex: 4, title: question.title),
                  const CVerticalDivider(),
                  CTableCell(flex: 4, title: question.description),
                  const CVerticalDivider(),
                  UrlTableField(urls: question.getUrls),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
