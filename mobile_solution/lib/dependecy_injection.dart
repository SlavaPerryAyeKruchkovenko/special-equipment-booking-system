import 'package:mobile_solution/repository/mock_user_repository.dart';
import 'package:mobile_solution/repository/prod_user_repository.dart';
import 'package:mobile_solution/repository/user_repository.dart';

enum Flavor { mock, prod }

//DI
class Injector {
  static final Injector _singleton = Injector._internal();
  static Flavor _flavor = Flavor.mock;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  static UserRepository get userRepository {
    switch (_flavor) {
      case Flavor.mock:
        return MockUserRepository();
      case Flavor.prod:
        return ProdUserRepository();
      default:
        return MockUserRepository();
    }
  }
}
