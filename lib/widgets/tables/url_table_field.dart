import 'package:fforward_adm/models/models.dart';
import 'package:fforward_adm/resources/app_colors.dart';
import 'package:flutter/material.dart';

class UrlTableField extends StatelessWidget {
  final List<Url>? urls;

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
              ...urls!
                  .map(
                    (e) => TextButton(
                      onPressed: () {},
                      child: Text(e.title),
                    ),
                  )
                  .toList()
                  .sublist(0, urls!.length > 2 ? 2 : urls!.length),
              if (urls!.isEmpty)
                const Text(
                  'None',
                  style: TextStyle(color: AppColors.secondaryColor),
                )
            ],
          ),
        ),
      );
}
