import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:web_monitoring/services/apiResponse.dart';

part 'apiService.g.dart';

@RestApi(baseUrl: 'https://resep-mau.herokuapp.com/api/')
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @FormUrlEncoded()
  @POST("login")
  Future<ApiResponse> login(@Field("email") String email,
      @Field("password") String password, @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @POST("signup")
  Future<ApiResponse> signup(
      @Field("nama") String name,
      @Field("email") String email,
      @Field("password") String password,
      @Header("DeviceID") String deviceID);

  @FormUrlEncoded()
  @POST("Authentication")
  Future<ApiResponse> auth(@Header("Authorization") String token,
      @Header("DeviceID") String deviceID);
}
