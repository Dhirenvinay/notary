import 'dart:convert';
import 'package:apinew/apiresponse.dart';
import 'package:get/get.dart';

class StorageController extends GetxController {
  Rx<ApiResponse?> apiResponse = Rx<ApiResponse?>(null);

  void storeResponse(String responseBody) {
    final Map<String, dynamic> json = jsonDecode(responseBody);
    final ApiResponse response = ApiResponse.fromJson(json);
    apiResponse.value = response;
  }
}
