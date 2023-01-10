import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mvvm_flutter_custom/base/base_view_model.dart';
import 'package:mvvm_flutter_custom/data/response/api_response.dart';
import 'package:mvvm_flutter_custom/model/Categories.dart';
import 'package:mvvm_flutter_custom/model/CategoriesResponse.dart';
import 'package:mvvm_flutter_custom/repository/categories_repository.dart';
import 'package:mvvm_flutter_custom/view/home/home_state_data.dart';

@injectable
class HomeViewModel extends BaseViewModel<HomeStateData> {
  HomeViewModel(
    this._repository,
  ) : super(HomeStateData.initial());

  final CategoriesRepository _repository;

  StreamSubscription<List<Categories>>? _categoryList;

  void init() async {
    _repository.getCategories();
    await _repository
        .observeCategories()
        .map((event) => event)
        .listen(_onTodoChanged);
  }

  @override
  void dispose() {
    _categoryList?.cancel();
    super.dispose();
  }

  void _onCategoryListChange(ApiResponse<CategoriesResponse> categories) {
    _updateState(response: categories);
  }

  void _onTodoChanged(ApiResponse<CategoriesResponse> categories) {
    _updateState(response: categories);
  }

  void _updateState({
    ApiResponse<CategoriesResponse>? response,
  }) {
    response = response ?? value.response;

    stateData = HomeStateData(
      response: response,
    );
  }
}
