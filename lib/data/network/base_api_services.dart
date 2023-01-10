abstract class BaseApiServices {
  Future<dynamic> callGetApi(String url);

  Future<dynamic> callPostApi(String url, dynamic data);
}
