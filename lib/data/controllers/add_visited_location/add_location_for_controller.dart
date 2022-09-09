import 'package:get/get.dart';

class AddLocationForController extends GetxController {
  bool forYourself = true;

  updateFor() {
    forYourself = !forYourself;
    update();
  }
}
