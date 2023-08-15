import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../data/controllers/map/filter_controller.dart';
import '../../../data/controllers/map/location_detail_controller.dart';

class ClearFilterButtonWidget extends StatelessWidget {
  const ClearFilterButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(FilterController());
    final locationDetailCtr = Get.put(LocationDetailController());

    return TextButton(
      onPressed: () {
        ctr.clearFilter();
        locationDetailCtr.clearFilter();
      },
      child: const Text(
        'Clear Filter',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
