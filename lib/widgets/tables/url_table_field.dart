import 'dart:convert';

import 'package:fforward_adm/resources/app_colors.dart';
import 'package:flutter/material.dart';

class UrlTableField extends StatelessWidget {
  final String urls;

  const UrlTableField({super.key, required this.urls});

  @override
  Widget build(BuildContext context) {
    List<Widget> buildUrls() {
      final Map<String, dynamic>? value = json.decode(urls);

      if (value == null) {
        return [
          const Text(
            'None',
            style: TextStyle(color: AppColors.secondaryColor),
          )
        ];
      }

      final list = value.values
          .map(
            (url) => TextButton(
              onPressed: () {},
              child: Text(url['title']),
            ),
          )
          .toList();

      return list.sublist(0, list.length > 2 ? 2 : list.length);
    }

    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: buildUrls(),
        ),
      ),
    );
  }
}
