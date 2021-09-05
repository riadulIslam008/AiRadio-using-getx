import 'package:ai_radio/Controller/HomeViewController.dart';
import 'package:get/get.dart';

class Binding implements Bindings{
  @override
  void dependencies() {
    Get.put<HomeViewController>(HomeViewController());
  }
  
}