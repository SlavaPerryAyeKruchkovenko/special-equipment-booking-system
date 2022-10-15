import 'package:mobile_solution/models/user.dart';
import 'package:mobile_solution/repository/user_repository.dart';

class MockUserRepository extends UserRepository {
  @override
  Future<String?> fetchToken(login, password) {
    throw UnimplementedError();
  }

  @override
  Future<User?> fetchUser(token) {
    throw UnimplementedError();
  }
}
