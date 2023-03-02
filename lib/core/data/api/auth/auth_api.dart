import 'package:dio/dio.dart';
import 'package:mobile_banking/core/base/base_models.dart';
import 'package:mobile_banking/core/data/request/auth/login_request.dart';
import 'package:mobile_banking/core/data/request/auth/register_request.dart';
import 'package:mobile_banking/core/data/response/auth/register_response.dart';
import 'package:mobile_banking/core/data/response/auth/token_response.dart';

class AuthApi {
  Dio dio;

  AuthApi(this.dio);

  Future<BaseResponse<RegisterResponse>> registerUser(
    RegisterRequest registerRequest,
  ) async {
    BaseResponse<RegisterResponse> response = Message("send request");
    try {
      var result =
          await dio.post("/auth/sign-up", data: registerRequest.toJson());
      int? code = result.statusCode ?? 200;
      if (code >= 200 && code < 300) {
        var data = RegisterResponse.fromJson(result.data);
        response = Success(data);
      } else if (code >= 400 && code < 500) {
        response = Error(Exception(result.statusMessage ?? ""));
      } else if (code >= 500) {
        response = ServerError(Exception(result.statusMessage ?? ""));
      } else {
        response = Message("Unknown exception");
      }
    } catch (e) {
      response = Error(Exception(e));
    }
    return response;
  }

  Future<BaseResponse<TokenResponse>> loginUser(
    LoginRequest loginRequest,
  ) async {
    BaseResponse<TokenResponse> response = Message("send request");
    try {
      var result = await dio.post("/auth/sign-in", data: loginRequest.toJson());
      int? code = result.statusCode ?? 200;
      if (code >= 200 && code < 300) {
        var token = TokenResponse.fromJson(result.data);
        response = Success(token);
      } else if (code >= 400 && code < 500) {
        response = Error(Exception(result.statusMessage ?? ""));
      } else if (code >= 500) {
        response = ServerError(Exception(result.statusMessage ?? ""));
      } else {
        response = Message("Unknown exception");
      }
    } catch (e) {
      response = Error(Exception(e));
    }
    return response;
  }
}
