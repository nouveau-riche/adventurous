import 'package:get/get.dart';

import 'package:adventurous_learner_app/data/apis/utils.dart';
import 'package:adventurous_learner_app/data/apis/apis.dart';
import 'package:adventurous_learner_app/utils/const_string.dart';
import 'package:adventurous_learner_app/data/preferences/pref_repoistry.dart';

class ConstantController extends GetxController {
  final strings = ConstString();
  final apis = Apis();
  final apiUtils = ApiUtils();
  final prefRepo = PrefRepository();
}
