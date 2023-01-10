import 'package:dio/dio.dart';
import 'package:mvvm_flutter_custom/data/app_exceptions.dart';
import 'package:mvvm_flutter_custom/data/network/base_api_services.dart';
import 'package:mvvm_flutter_custom/data/network/interceptors/logging.dart';

class ApiClient extends BaseApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: 30000,
      receiveTimeout: 30000,
    ),
  )..interceptors.add(Logging());

  @override
  Future callGetApi(String uri) async {
    dynamic responseJson;

    try {
      Response response = await _dio.get(uri);

      responseJson = returnResponse(response);
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print("Dio Error" + e.toString());
        throw NoInternetException();
      }
    }
    return responseJson;
  }

  @override
  Future callPostApi(String uri, data) {
    return Future.value("");
  }
}


dynamic returnResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic responseJson = response.data;
      return responseJson;
    case 400:
      throw BadRequestException(response.data.toString());
    case 404:
      throw BadRequestException(response.data.toString());
    case 500:
      throw BadRequestException(response.data.toString());
    default:
      throw FetchDataException(
          "Error occurred while communicating with server with status code ${response.statusCode}");
  }
}


class CustomException implements Exception {
  String? message;

  CustomException(this.message);
}
