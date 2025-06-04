import 'dart:convert';

import 'package:canary_template/data/model/request/auth/login_request_model.dart';
import 'package:canary_template/data/model/request/auth/register_request_model.dart';
import 'package:canary_template/data/model/response/login_response_model.dart';
import 'package:canary_template/service/service_http_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dartz/dartz.dart';

class AuthRepository {
  final ServiceHttpClient _serviceHttpClient;
  final secureStorage = FlutterSecureStorage();

  AuthRepository(this._serviceHttpClient);

  Future<Either<String, LoginResponseModel>>login(
    LoginRequestModel requestModel,
  ) async {
    try {
      final response = await _serviceHttpClient.post(
        'login',
        requestModel.toMap(),
      );
      final jsonResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        final loginResponse = LoginResponseModel.fromMap(jsonResponse);
        await secureStorage.write(
          key: "authToken",
          value: loginResponse.data!.token,
        );
        await secureStorage.write(
          key: "userRole",
          value: loginResponse.data!.role,
        );
        return Right(loginResponse);
      } else {
        return Left(jsonResponse['message'] ?? 'Login failed');
      }
    } catch (e) {
      return Left("An error occured while logging in:");
    }
  }

  Future<Either<String, String>>register(RegisterRequestModel requestModel) async {
    try {
      final response = await _serviceHttpClient.post(
        "register",
        requestModel.toMap(),
      );
      final jsonResponse = json.decode(response.body);
      final registerResponse = jsonResponse['message'];
      if (response.statusCode == 201) {
        return Right(registerResponse);
      } else {
        return Left(jsonResponse['message'] ?? 'Registration failed');
      }
    } catch (e) {
      return Left("An error occured while registering. : $e");
    }
  }
}