import 'models.dart';

class DeveloperLevel extends ListItem {
  const DeveloperLevel({required super.id, required super.title});

  DeveloperLevel.fromJson(json) : super.fromJson(json);
}
