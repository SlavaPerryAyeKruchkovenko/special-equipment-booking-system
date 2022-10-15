import 'package:mobile_solution/repository/user_repository.dart';

import '../api_manager/api_manager.dart';
import '../models/user.dart';

class ProdUserRepository extends UserRepository {
  @override
  Future<String?> fetchToken(login, password) {
    return ApiManager.authEndpoint.loginUser(login, password);
  }

  @override
  Future<User?> fetchUser(token) {
    return ApiManager.workerEndpoint.getWorker(token);
  }
}
