import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/data/controllers/map/map_controller.dart';
import 'package:adventurous_learner_app/utils/widgets/notification_bt_widget.dart';
import 'package:adventurous_learner_app/screens/home/widget/drawer_widget.dart';
import 'package:adventurous_learner_app/screens/map/widget/search_location_widget.dart';
import 'package:adventurous_learner_app/screens/map/widget/location_detail_parent_widget.dart';

class MapScreen extends StatelessWidget {
  MapScreen({Key? key}) : super(key: key);

  RxBool isFilter = true.obs;
  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(MapController());
    log("FILTER ::::::$isFilter");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: oliveColor,
        title: Text(
          constCtr.strings.appName,
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
        actions: const [NotificationBtWidget()],
      ),
      drawer: const Drawer(child: DrawerWidget()),
      body: SafeArea(
        child: Stack(
          children: [
            GetBuilder<MapController>(builder: (_) {
              return GoogleMap(
                initialCameraPosition: ctr.currentCameraPos,
                onMapCreated: (GoogleMapController controller) {
                  ctr.mapController = controller;
                },
                markers: ctr.mapMarker,
                circles: ctr.circlesSet,
                myLocationEnabled: true,
                compassEnabled: false,
                tiltGesturesEnabled: false,
                mapToolbarEnabled: false,
                padding: const EdgeInsets.only(top: 40),
              );
            }),
            SearchAndFilterLocationWidget(isFilter: isFilter),
            LocationDetailParentWidget(isFilter: isFilter),
          ],
        ),
      ),
    );
  }
}
