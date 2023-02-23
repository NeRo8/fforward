import 'package:fforward_adm/admin/widgets/tables/widgets.dart';
import 'package:fforward_adm/models/models.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:flutterfire_ui/database.dart';
import 'package:get/get.dart';

class ItemListTable extends StatelessWidget {
  final List<ListItem> data;
  final Function(ListItem value) onTapDelete;
  final Function(ListItem value) onTapUpdate;

  const ItemListTable(
      {super.key,
      required this.data,
      required this.onTapUpdate,
      required this.onTapDelete});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CTableRow(
          children: [
            CTableCell(flex: 2, title: "ID"),
            CVerticalDivider(),
            CTableCell(flex: 6, title: "Title"),
            CVerticalDivider(),
            CTableCell(width: 100, title: "Actions"),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final ListItem item = data[index];
              return CTableRow(
                children: [
                  CTableCell(flex: 2, title: item.id),
                  const CVerticalDivider(),
                  CTableCell(flex: 6, title: item.title),
                  const CVerticalDivider(),
                  CTableCellActions(
                    width: 100,
                    onTapDelete: () => onTapDelete(item),
                    onTapUpdate: () => onTapUpdate(item),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
