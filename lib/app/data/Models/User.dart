class Todo {
  final int userID;
  final String userName;
  final String userPassword;
  Todo({
    required this.userID,
    required this.userName,
    required this.userPassword,
  });

  Map<String, dynamic> toJson() => {
    'user': userID,
    'username' : userName,
    'userPassword': userPassword,
  };

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    userID: json['userID'],
    userName: json['userName'],
    userPassword: json['userPassword'],
  );
}