import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class ApiManager {
  static String baseUrl = 'http://192.168.1.120:8000/api/v1/';
  static AuthManager authEndpoint = AuthManager(baseUrl);
  static WorkerManager workerEndpoint = WorkerManager(baseUrl);
  static DispatherManager dispatcherEndpoint = DispatherManager(baseUrl);
}

class AuthManager {
  final String endpoint = 'auth';
  final String baseUrl;
  AuthManager(this.baseUrl);

  Future<String?> loginUser(login, password) async {
    try {
      var url = Uri.parse("$baseUrl$endpoint.loginUser");
      var response = await http.post(url,
          body: {'login': login, 'password': password, 'app_id': '3'});
      if (response.statusCode == 200) {
        return _userPaserser(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  _userPaserser(String value) {
    var req = json.decode(value);
    return req['token'];
  }

  getUser() {}
  getAllUser() {}
}

class WorkerManager {
  WorkerManager(this.baseUrl);
  final String endpoint = 'worker';
  final String baseUrl;
  Future<User?> getWorker(String token) async {
    try {
      var url = Uri.parse("$baseUrl$endpoint.getWorker?token=$token");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return _workerParser(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  _workerParser(String value) {
    debugPrint(value);
    var req = json.decode(value);
    var user = req['user'];
    return User(user['id'].toString(), user['first_name'], user['last_name'],
        user['patronymic'], req['stars']);
  }

  getOrders() {}
  getOrderById() {}
  createOrder() {}
  getMachines() {}
  getMachineById() {}
  createMachine() {}
}

class DispatherManager {
  DispatherManager(this.baseUrl);
  final String endpoint = 'dispather';
  final String baseUrl;
  getDispatcher() {}
}
