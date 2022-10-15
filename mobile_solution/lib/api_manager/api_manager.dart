class ApiManager {
  static String baseUrl = '192.168.1.120:800/api/v1/';
  static AuthManager authEndpoint = AuthManager();
  static WorkerManager workerEndpoint = WorkerManager();
  static String dispatcherEndpoint = 'dispatcher';
}

class AuthManager {
  final String endpoint = 'auth';
  loginUser() {}
  getUser() {}
  getAllUser() {}
}

class WorkerManager {
  final String endpoint = 'worker';
  getWorker() {}
  getOrders() {}
  getOrderById() {}
  createOrder() {}
  getMachines() {}
  getMachineById() {}
  createMachine() {}
}

class DispatherManager {
  getDispatcher() {}
}
