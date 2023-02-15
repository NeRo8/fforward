class ListItem {
  final String id;
  final String title;

  const ListItem({required this.id, required this.title});

  ListItem.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        title = json['title'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}

class Url {
  final String url;
  final String title;

  const Url({required this.url, required this.title});

  Url.fromJson(Map<dynamic, dynamic> json)
      : url = json['url'],
        title = json['title'];

  Map<String, dynamic> toJson() => {
        'url': url,
        'title': title,
      };
}

const reviewStatus = <ListItem>[
  ListItem(id: "0", title: "Pending"),
  ListItem(id: "1", title: "In Progress"),
  ListItem(id: "2", title: "Complete"),
];
