import 'package:fforward_adm/admin/pages/questions/questions_detail/view/question_detail.dart';
import 'package:fforward_adm/resources/app_strings.dart';
import 'package:fforward_adm/widgets/tables/questions_table.dart';
import 'package:fforward_adm/widgets/views/page_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionsList extends StatelessWidget {
  static const routeName = '/questions-list';

  const QuestionsList({super.key});

  void onTapQuestion() => Get.toNamed(QuestionDetail.routeName);

  @override
  Widget build(BuildContext context) => PageContainer(
        headerTitle: AppStrings.questions,
        headerActions: [
          IconButton(
            onPressed: onTapQuestion,
            icon: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 32,
          ),
        ],
        child: QuestionsTable(),
      );
}
