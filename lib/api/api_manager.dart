
import 'package:dio/dio.dart';
import 'package:padora/auth/login/model/res_login_model.dart';
import 'package:padora/auth/signup/model/res_signup_model.dart';


import 'api_constant.dart';
import 'api_service.dart';
import 'error_model.dart';

class ApiManager {
  final ApiService _apiService = ApiService();

  Future<ResLoginModel> login(Map<String, dynamic> requestModel) async {
    try {
      final response = await _apiService.post(
        loginEndPoint,
        data: requestModel,
      );
      return ResLoginModel.fromJson(response.data);
    } on DioError catch (error) {
      throw ErrorModel.fromJson(error.response.data);
    }
  }

  Future<ResSignupModel> registerUser(
      Map<String, dynamic> requestModel) async {
    try {
      final response = await _apiService.post(
        registerEndPoint,
        data: requestModel,
      );
      return ResSignupModel.fromJson(response.data);
    } on DioError catch (error) {
      throw ErrorModel.fromJson(error.response.data);
    }
  }




}
