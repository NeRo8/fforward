import 'package:fforward_adm/admin/widgets/tables/widgets.dart';
import 'package:fforward_adm/models/models.dart';
import 'package:flutter/material.dart';

class ItemListTable extends StatelessWidget {
  final List<ListItem> data;

  const ItemListTable({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CTableRow(
          children: [
            CTableCell(flex: 2, title: "ID"),
            CVerticalDivider(),
            CTableCell(flex: 6, title: "Title"),
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
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
