import './models.dart';

class Technology extends ListItem {
  const Technology({required super.id, required super.title});

  Technology.fromJson(json) : super.fromJson(json);
}
