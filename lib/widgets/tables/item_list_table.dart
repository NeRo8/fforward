import 'package:fforward_adm/widgets/tables/widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:flutterfire_ui/database.dart';

class ItemListTable extends StatelessWidget {
  final Query tableQuery;

  const ItemListTable({super.key, required this.tableQuery});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CTableRow(
          children: [
            CTableCell(flex: 2, title: "ID"),
            CVerticalDivider(),
            CTableCell(flex: 4, title: "Title"),
          ],
        ),
        Expanded(
          child: FirebaseDatabaseListView(
            query: tableQuery,
            itemBuilder: (context, snapshot) {
              final Map user = (snapshot.value as Map);
              return CTableRow(
                children: [
                  CTableCell(flex: 2, title: user['id']),
                  const CVerticalDivider(),
                  CTableCell(flex: 4, title: user['title']),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
