import 'package:flutter/material.dart';
import 'package:mvvm_flutter_custom/di/dependency_injection.dart';
import 'package:mvvm_flutter_custom/factory/viewmodel_factory.dart';
import 'package:provider/provider.dart';

class GlobalProvider extends StatelessWidget {
  const GlobalProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: getIt.get<ViewModelFactory>()),
      ],
      child: child,
    );
  }
}