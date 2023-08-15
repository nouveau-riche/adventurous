import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../utils/const_color.dart';
import '../../../utils/constants.dart';
import '../../../data/controllers/map/filter_controller.dart';
import '../../../utils/widgets/rounded_elevated_bt_widget.dart';
import '../../../data/controllers/map/location_detail_controller.dart';

class FilterButtonWidget extends StatelessWidget {
  const FilterButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final locationDetailCtr = Get.put(LocationDetailController());
    final ctr = Get.put(FilterController());

    return GetBuilder<LocationDetailController>(
      builder: (_) {
        return locationDetailCtr.isLoading
            ? const Center(child: CircularProgressIndicator(color: oliveColor))
            : Center(
                child: RoundedElevatedButtonWidget(
                  width: 320,
                  text: Text(
                    constCtr.strings.filter,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () => ctr.searchFilteredData(),
                  radius: 10,
                ),
              );
      },
    );
  }
}
