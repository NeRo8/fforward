abstract class ListItem {
  final String? id;
  final String title;

  const ListItem({this.id, required this.title});

  ListItem.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        title = json['title'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}

class Url {
  final String? id;
  final String url;
  final String title;

  const Url({this.id, required this.url, required this.title});
}
