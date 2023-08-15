import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../utils/const_color.dart';
import './widget/filter_button_widget.dart';
import './widget/clear_filter_button_widget.dart';
import '../../utils/widgets/back_button_widget.dart';
import '../../data/modals/map/widget/const_dailogue.dart';
import '../../data/controllers/map/filter_controller.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(FilterController());

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
        actions: const [ClearFilterButtonWidget()],
      ),
      body: GetBuilder<FilterController>(
        builder: (_) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  const Text(
                    "Find your location by learning opportunity & states",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 35),
                  const Text(
                    "Search by learning opportunity",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      customDialog(
                        context,
                        ctr.filterModel?.response ?? [],
                        (val) {
                          ctr.selectedOpportunity = val;
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
                            ctr.selectedOpportunity.isEmpty
                                ? 'Search Learning Opportunity...'
                                : ctr.selectedOpportunity,
                            style: const TextStyle(
                              color: kSecondaryTextColor,
                            ),
                          ),
                          const Icon(Icons.arrow_drop_down_sharp)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  const Text(
                    "Search by State",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      customDialog(
                        context,
                        ctr.filterModel?.state?.values
                                .toList(growable: true) ??
                            [],
                        (val) {
                          ctr.selectedState = val;
                          Get.back();
                          FocusScope.of(context).unfocus();
                        },
                        'Search State',
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
                            ctr.selectedState.isEmpty
                                ? 'Search State'
                                : ctr.selectedState,
                            style: const TextStyle(
                              color: kSecondaryTextColor,
                            ),
                          ),
                          const Icon(Icons.arrow_drop_down_sharp)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Spacer(),
                  const FilterButtonWidget(),
                  const SizedBox(height: 22),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
