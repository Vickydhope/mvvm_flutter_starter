import 'package:get_it/get_it.dart' as g;
import 'package:injectable/injectable.dart' as i;
import 'package:mvvm_flutter_custom/data/network/api_client.dart';
import 'package:mvvm_flutter_custom/factory/viewmodel_factory.dart';
import 'package:mvvm_flutter_custom/repository/categories_repository.dart';
import 'package:mvvm_flutter_custom/view/home/home_view_model.dart';
import '';

g.GetIt $initGetIt(
  g.GetIt get, {
  String? environment,
  i.EnvironmentFilter? environmentFilter,
}) {

  final gh =i.GetItHelper(get,environment,environmentFilter);

  gh.singleton<ApiClient>(ApiClient());

  gh.singleton<CategoriesRepository>(CategoriesRepository(apiClient : get<ApiClient>()));

  gh.singleton<ViewModelFactory>(ViewModelFactoryImpl());

  gh.factory<HomeViewModel>(() => HomeViewModel(get<CategoriesRepository>()));

  print("Initializing dependencies");

  return get;
}
