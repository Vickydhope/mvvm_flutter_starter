import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mvvm_flutter_custom/data/app_exceptions.dart';
import 'package:mvvm_flutter_custom/data/network/api_client.dart';
import 'package:mvvm_flutter_custom/data/network/base_api_services.dart';
import 'package:mvvm_flutter_custom/data/response/api_response.dart';
import 'package:mvvm_flutter_custom/model/Categories.dart';
import 'package:mvvm_flutter_custom/model/CategoriesResponse.dart';

@singleton
class CategoriesRepository {
  final ApiClient apiClient;

  CategoriesRepository({required this.apiClient});

  ApiResponse<CategoriesResponse> _categoryApiResponse = ApiResponse.initial();

  final _categoryApiResponseSC =
      StreamController<ApiResponse<CategoriesResponse>>.broadcast();

  Stream<ApiResponse<CategoriesResponse>> observeCategories() async* {
    yield _categoryApiResponse;
    yield* _categoryApiResponseSC.stream;
  }

  void getCategories() async {
    updateApiResponse(ApiResponse.loading());
    await _getCategories()
        .then((value) => updateApiResponse(ApiResponse.completed(value)))
        .onError((AppException error, stackTrace) =>
        updateApiResponse(ApiResponse.error(error.message)));
  }

  Future<CategoriesResponse> _getCategories() async {
    try {
      dynamic response = await apiClient
          .callGetApi("https://www.themealdb.com/api/json/v1/1/categories.php");
      return response = CategoriesResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  updateApiResponse(ApiResponse<CategoriesResponse> response) {
    _categoryApiResponse = response;
    _categoryApiResponseSC.add(_categoryApiResponse);
  }
}
