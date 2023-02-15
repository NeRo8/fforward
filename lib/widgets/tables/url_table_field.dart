import 'package:fforward_adm/resources/app_colors.dart';
import 'package:flutter/material.dart';

class UrlTableField extends StatelessWidget {
  final Map<String, dynamic>? urls;

  const UrlTableField({super.key, required this.urls});

  @override
  Widget build(BuildContext context) => Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...urls!.values
                  .map((v) =>
                      TextButton(onPressed: () {}, child: Text(v['title'])))
                  .toList()
                  .sublist(0, urls!.values.length > 2 ? 2 : urls!.length),
              if (urls!.values.isEmpty)
                const Text(
                  'None',
                  style: TextStyle(color: AppColors.secondaryColor),
                )
            ],
          ),
        ),
      );
}
