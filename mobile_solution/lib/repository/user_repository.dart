import '../models/user.dart';

abstract class UserRepository {
  Future<User?> fetchUser(token);
  Future<String?> fetchToken(login, password);
}
