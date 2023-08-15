import 'package:get/get.dart';

import '../../../utils/constants.dart';
import './location_detail_controller.dart';
import '../../modals/map/filter_model.dart';

class FilterController extends GetxController {
  bool isLoading = false;

  String filterType = '';
  String selectedOpportunity = '';
  String selectedState = '';

  FilterModel? filterModel;

  @override
  onInit() {
    super.onInit();
    _fetchData();
  }

  _fetchData() async {
    final response = await constCtr.apis.getFilterTagsAndState(constCtr.token);

    if (response != null && response.status!) {
      filterModel = response;
      update();
    }
  }

  searchFilteredData() {
    if (selectedOpportunity.isEmpty) {
      filterType = "STATE";
    } else if (selectedState.isEmpty) {
      filterType = "TAGS";
    } else {
      filterType = "BOTH";
    }

    _startLoading();

    final ctr = Get.put(LocationDetailController());

    ctr.searchByFilter(
      tag: selectedOpportunity,
      state: selectedState,
      filterType: filterType,
    );
    filterType = "";

    _stopLoading();
  }

  clearFilter() {
    filterType = '';
    selectedOpportunity = '';
    selectedState = '';
  }

  _startLoading() {
    isLoading = true;
    update();
  }

  _stopLoading() {
    isLoading = false;
    update();
  }
}
