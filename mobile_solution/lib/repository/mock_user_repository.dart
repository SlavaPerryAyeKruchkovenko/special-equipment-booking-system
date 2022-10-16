import 'package:mobile_solution/models/user.dart';
import 'package:mobile_solution/repository/user_repository.dart';

class MockUserRepository extends UserRepository {
  @override
  Future<String?> fetchToken(login, password) {
    if (login == 'admin' && password == 'admin') {
      return Future.value("12345");
    } else {
      throw Exception('incorrect login or password');
    }
  }

  @override
  Future<User?> fetchUser(token) {
    if (token == '12345') {
      return Future.value(User('1', 'admin', 'slava', 'slava', 5));
    } else {
      throw Exception('incorrect token');
    }
  }
}
