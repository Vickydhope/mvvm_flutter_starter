
import 'package:mvvm_flutter_custom/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.initial() : status = Status.INIT;
  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.SUCCESS;

  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status: $status,\nMessage: $message,\nData: $data";
  }
}
