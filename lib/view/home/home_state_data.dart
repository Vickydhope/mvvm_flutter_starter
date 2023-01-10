import 'package:mvvm_flutter_custom/data/response/api_response.dart';
import 'package:mvvm_flutter_custom/model/CategoriesResponse.dart';
import 'package:mvvm_flutter_custom/view/view_state_data.dart';

class HomeStateData extends ViewStateData {
  const HomeStateData({required this.response});

  final ApiResponse<CategoriesResponse> response;

  HomeStateData.initial() : response = ApiResponse.initial();

  @override
  List<Object?> get props => [response];
}
