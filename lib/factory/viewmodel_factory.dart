import 'package:injectable/injectable.dart';
import 'package:mvvm_flutter_custom/base/base_view_model.dart';
import 'package:mvvm_flutter_custom/di/dependency_injection.dart';

abstract class ViewModelFactory{
  T create<T extends BaseViewModel>();
}

@Singleton(as:ViewModelFactory)
class ViewModelFactoryImpl implements ViewModelFactory{
  @override
  T create<T extends BaseViewModel>() => getIt.get<T>();

}