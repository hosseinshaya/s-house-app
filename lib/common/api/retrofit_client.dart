import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:s_house/common/constants/app_config.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class RetrofitClient {
  factory RetrofitClient(Dio dio, {String baseUrl}) = _RetrofitClient;
}
