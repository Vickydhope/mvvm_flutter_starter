import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mvvm_flutter_custom/di/dependency_injection.config.dart';

final getIt = GetIt.I;

@InjectableInit()
void initializeGetIt(){
  $initGetIt(getIt);
}
