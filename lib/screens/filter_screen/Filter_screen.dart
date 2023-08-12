import 'dart:developer';

import 'package:adventurous_learner_app/data/modals/map/widget/const_dailogue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../data/controllers/map/filter_controller.dart';
import '../../data/modals/map/filter_model.dart';
import '../../utils/const_color.dart';
import '../../utils/constants.dart';
import '../../utils/widgets/back_button_widget.dart';
import '../../utils/widgets/rounded_elevated_bt_widget.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({Key? key,required this.isFilter}) : super(key: key);
  RxBool isFilter;
  final FilterController controller = Get.put(FilterController());
  TextEditingController gender = TextEditingController();
  String selectedOpportunity = '';
  String selectedState = '';
  String filterType = '';
  List<Map<String, dynamic>> finalDataTags = [];
  List<Map<String, dynamic>> finalDataState = [];
  List<Map<String, dynamic>> finalDataBoth = [];
  List<Map<String, dynamic>> finalData = [];
  @override
  Widget build(BuildContext context) {
    log("OPPORTUNITY :::${controller.filterModel?.response?.length ?? ""}");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: oliveColor,
        leading: const BackButtonWidget(color: Colors.white),
        title: const Text(
          'Filter Screen',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),

                      const Text(
                        "Find your location by learning opportunity & states",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      const Text(
                        "Search by learning opportunity",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          customDialog(
                            context,
                            controller.filterModel?.response ?? [],
                                (val) {
                              selectedOpportunity = val;
                              Get.back();
                              FocusScope.of(context).unfocus();
                            },
                            'Opportunity',
                          );
                        },
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            border: Border.all(color: greyColor3, width: 0.7),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedOpportunity.isEmpty
                                    ? 'Search Learning Opportunity...'
                                    : selectedOpportunity,
                                style: const TextStyle(color: kSecondaryTextColor),
                              ),
                              const Icon(Icons.arrow_drop_down_sharp)
                            ],
                          ),
                        ),
                      ),
                      //FOR STATE
                      const SizedBox(
                        height: 35,
                      ),
                      const Text(
                        "Search by State",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //..........
                      InkWell(
                        onTap: () {
                          customDialog(
                            context,
                            controller.filterModel?.state?.values.toList(growable: true) ?? [],
                                (val) {
                                  selectedState = val;
                              Get.back();
                              FocusScope.of(context).unfocus();
                            },
                            'Search State',
                          );
                        },
                        child:   Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            border: Border.all(color: greyColor3, width: 0.7),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              Text(
                                selectedState.isEmpty ?   'Search State'
                                :selectedState,
                                style: const TextStyle(color: kSecondaryTextColor),
                              ),
                              const Icon(Icons.arrow_drop_down_sharp)
                            ],
                          ),
                        ) ,
                      )
                   ,

                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ))),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 25, left: 12, right: 12),
        child: RoundedElevatedButtonWidget(
          text: Text(
            constCtr.strings.filter,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          onPressed: () {
            if(selectedOpportunity.isEmpty){
              filterType = "STATE";
            }else if(selectedState.isEmpty){
              filterType = "TAGS";
            }else {
              filterType = "BOTH";
            }
            print("TAGE+++++++++$selectedOpportunity");
            print("STATE+++++++++$selectedState");
            print("FilterType+++++++++$filterType");
isFilter = true.obs;
log("IS FILTER ++ ${isFilter.value}");
            controller.searchFilterByTagAndState(filterType: filterType,state: selectedState,tag: selectedOpportunity,isFilter: isFilter);
            filterType = "";
          },
          radius: 10,
        ),
      ),
    );
  }
}

