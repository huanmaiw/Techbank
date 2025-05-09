import 'package:dio/dio.dart';
import '../../../MVC/Model/user_model3.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:3000/api/auth'));

  Future<Response> register(UserModel user) =>
      _dio.post('/register', data: user.toJson());

  Future<Response> login(UserModel user) =>
      _dio.post('/login', data: user.toJson());

  Future<Response> sendOtp(String email) =>
      _dio.post('/send-otp', data: {'email': email});

  Future<Response> verifyOtp(String email, String otp) =>
      _dio.post('/verify-otp', data: {'email': email, 'otp': otp});
}
