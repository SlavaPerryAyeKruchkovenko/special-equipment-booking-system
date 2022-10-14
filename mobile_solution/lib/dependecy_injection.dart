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
}
