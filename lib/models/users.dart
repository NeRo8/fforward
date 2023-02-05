abstract class UsersPermission {
  static const admin = 'admin';
  static const worker = 'worker';
}

class Users {
  final String uid;
  final String firstname;
  final String lastname;
  final String email;
  final UsersPermission permission;

  const Users({
    required this.uid,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.permission,
  });

  Users.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        firstname = json['firstname'],
        lastname = json['lastname'],
        email = json['email'],
        permission = json['permission'];

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'permission': permission,
      };
}
