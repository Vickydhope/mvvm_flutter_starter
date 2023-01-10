import 'package:flutter/material.dart';
import 'package:mvvm_flutter_custom/base/screen.dart';
import 'package:mvvm_flutter_custom/data/response/api_response.dart';
import 'package:mvvm_flutter_custom/data/response/status.dart';
import 'package:mvvm_flutter_custom/model/CategoriesResponse.dart';
import 'package:mvvm_flutter_custom/view/home/home_state_data.dart';
import 'package:mvvm_flutter_custom/view/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends Screen {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState
    extends ScreenState<HomeScreen, HomeViewModel, HomeStateData> {
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            viewmodel.init();
          },
          child: const Icon(Icons.add)),
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: const HomePageBody()
    );
  }

  @override
  void initState() {
    super.initState();
    viewmodel.init();
  }
}


class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HomeStateData, ApiResponse<CategoriesResponse>>(
      selector: (_, data) => data.response,
      builder: (context, response, _) {
        switch (response.status){
          case Status.INIT:
            return Container();
            break;
          case Status.LOADING:
            return Center(child: CircularProgressIndicator(),);
            break;
          case Status.ERROR:
            return Center(child: Text(response.message??"Error"),);
            break;
          case Status.SUCCESS:
            return ListView.separated(
              itemBuilder: (context, index) {
                var category = response.data?.categories[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(category!.strCategory),
                );
              },
              separatorBuilder: (_, __) => Divider(),
              itemCount: response.data?.categories.length??0,
            );
          default:
            return Container();
        }
      },
    );
  }
}
