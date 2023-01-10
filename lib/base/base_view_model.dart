import 'package:flutter/foundation.dart';
import 'package:mvvm_flutter_custom/view/view_state_data.dart';

class BaseViewModel <T extends ViewStateData> implements ValueListenable<T>{

  BaseViewModel(T initial) : _stateDataNotifier = ValueNotifier(initial);

  final ValueNotifier<T> _stateDataNotifier;

  @protected
  set stateData(T value) => _stateDataNotifier.value = value;

  @override
  T get value  => _stateDataNotifier.value ;


  @override
  void addListener(VoidCallback listener) {
    _stateDataNotifier.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _stateDataNotifier.removeListener(listener);
  }

  @mustCallSuper
  void dispose(){
    _stateDataNotifier.dispose();
  }


}