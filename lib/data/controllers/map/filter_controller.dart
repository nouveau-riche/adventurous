import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../utils/constants.dart';
import '../../apis/constant.dart';
import '../../modals/map/filter_model.dart';
import '../../modals/map/location_detail_response.dart';
import 'location_detail_controller.dart';

class FilterController extends GetxController {
  FilterModel? filterModel;
  LocationDetailResponse? locationDetailResponse;
  final constant = ApiConstants();
  LocationDetailController ctr = Get.put(LocationDetailController());
  // List<String> dropdownItems = <FilterModel>[].obs as List<String>;
  // var dropdownvalue = "".obs;
  // var isLoading = false.obs;
  List<LocationDetail> locationDetails = [];

  @override
  onInit() {
    super.onInit();
    fetchData();
  }

  List<String> opportunity = [];

  //TO GET ALL THE TAGS AND STATES
  Future<void> fetchData() async {
    log("CALL HERE");
    try {
      log(constant.getFilterStateAndTagsUrl);
      // isLoading(true);
      final response = await http.post(
        //Uri.parse('http://82.180.160.159:3006/api/v1/location/get-tags-and-state'),
        Uri.parse(constant.getFilterStateAndTagsUrl),

        headers: {
          'Content-Type': 'application/json',
          'x-access-token': constCtr.token
        },
      );
      print("STATUS CODE ::::${response.statusCode}");
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        filterModel = FilterModel.fromJson(data);

        // opportunity = response.body[''];
        print("CALL+++++++");
        print("DATA++++++======dssdvd=$data");
        //dropdownItems = FilterModel.fromJson(data) as List<String> ;
      }
    } catch (e, s) {
      log("ERROR ::: $s");
      print("Error while getting data is $e");
    }
  }

  //TO CALL FILTER
  Future<void> searchFilterByTagAndState(
      {required tag, required state, required filterType,required RxBool isFilter}) async {
    try {
      log(constant.searchFilterStateAndTagsUrl);
      final response = await http.post(
          Uri.parse(constant.searchFilterStateAndTagsUrl),
          headers: {
            'Content-Type': 'application/json',
            'x-access-token': constCtr.token
          },
          body: json.encode({
            "skip": 0,
            "limit": 10,
            "filter": true,
            "filterType": filterType,
            "tag": tag,
            "state": state
          }));
      print("TAG+++++++++1$tag");
      print("State+++++++++1$state");
      print("FilterType+++++++++1$filterType");

      if (response.statusCode == 200) {
        isFilter = true.obs;
        print("Done");
        Map<String, dynamic> data = json.decode(response.body);
        locationDetailResponse = LocationDetailResponse.fromJson(data);

        print("DATA++++++=======$data");
      } else {
        print("Failed");
      }
    } catch (e) {
      print("Failed 2");
      Get.snackbar("Error", e.toString());
    }
  }
}
