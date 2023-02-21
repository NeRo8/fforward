import 'package:fforward_adm/models/models.dart';
import 'package:fforward_adm/resources/app_colors.dart';
import 'package:flutter/material.dart';

class LevelPicker extends StatefulWidget {
  final String? levelId;
  final Function(String id) onTapLevel;

  const LevelPicker({
    super.key,
    this.levelId,
    required this.onTapLevel,
  });

  @override
  State<LevelPicker> createState() => _LevelPickerState();
}

class _LevelPickerState extends State<LevelPicker> {
  bool isListVisible = false;

  void onTapChangeListVisible() => setState(() {
        isListVisible = !isListVisible;
      });

  void onTapSetLevel(String id) {
    onTapChangeListVisible();
    widget.onTapLevel(id);
  }

  @override
  Widget build(BuildContext context) {
    final currentLevel = levels[widget.levelId];

    return Stack(
      children: [
        LevelItem(
          title: currentLevel?.title,
          color: currentLevel?.color,
          onTap: onTapChangeListVisible,
        ),
        if (isListVisible)
          SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: levels.values
                  .map(
                    (e) => LevelItem(
                      color: e.color,
                      title: e.title,
                      onTap: () => onTapSetLevel(e.id),
                    ),
                  )
                  .toList(),
            ),
          ),
      ],
    );
  }
}

class LevelItem extends StatelessWidget {
  final String? title;
  final Color? color;
  final VoidCallback? onTap;

  const LevelItem({
    super.key,
    this.title,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 200,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: color ?? notSelectedLevel.color,
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title ?? notSelectedLevel.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
}
