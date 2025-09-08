

import 'package:untitled1/data/models/message_test.dart';
import 'package:untitled1/data/models/user.dart';
import 'package:untitled1/data/models/user_test.dart';
import 'package:untitled1/data/setting/rest_api_service.dart';


class UserService extends RestApiService<User> {
  UserService()
      : super(
          endpoint: "user", 
          fromJson: (json) => User.fromJson(json),
          toJson: (user) => user.toJson(),
        );
}

class UserServiceTest extends RestApiService<UserTest> {
  UserServiceTest()
      : super(
          endpoint: "Users", 
          fromJson: (json) => UserTest.fromJson(json),
          // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
          toJson: (UserTest) => UserTest.toJson(),
        );
}
class UserServiceMessage extends RestApiService<MessageUser> {
  UserServiceMessage()
      : super(
          endpoint: "MessageUsers", // API endpoint
          fromJson: (json) => MessageUser.fromJson(json),
          toJson: (message) => message.toJson(),
        );
}
// class UserServiceMessage extends RestApiService<UserTest> {
//   UserServiceMessage()
//       : super(
//           endpoint: "Users", 
//           fromJson: (json) => UserTest.fromJson(json),
//           toJson: (UserTest) => UserTest.toJson(),
//         );
// }