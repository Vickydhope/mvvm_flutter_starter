
import 'package:flutter/cupertino.dart';
import 'package:mvvm_flutter_custom/base/base_view_model.dart';
import 'package:mvvm_flutter_custom/factory/viewmodel_factory.dart';
import 'package:mvvm_flutter_custom/view/view_state_data.dart';
import 'package:provider/provider.dart';

abstract class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);
}

abstract class ScreenState<T extends Screen, V extends BaseViewModel<T3>,
    T3 extends ViewStateData> extends State<T> {
  ScreenState();

  late final V viewmodel;

  Widget buildScreen(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ValueListenableProvider<T3>.value(value: viewmodel),
      ],
      builder: (context, _) {
        return buildScreen(context);
      },
    );
  }

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    viewmodel = context.read<ViewModelFactory>().create<V>();
    print(viewmodel);
  }

  @override
  @mustCallSuper
  void dispose() {
    viewmodel.dispose();
    super.dispose();
  }
}
