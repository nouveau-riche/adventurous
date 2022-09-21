import 'package:get/get.dart';

import 'package:adventurous_learner_app/data/controllers/constant_controller.dart';

final constCtr = Get.put(ConstantController(), permanent: true);

const defaultLatitude = 28.394589;
const defaultLongitude = 76.958222;
const defaultMapZoomValue = 15.0;
const googleKey = 'AIzaSyAY8bdJfjP73I_20hJCtrFN6RptBsYvcRw';
const mapForMarkerBottomUiHeight = 258.0;
const readPdfBaseUrl = 'https://adventurelearner.herokuapp.com/api/v1/app/read-file';
