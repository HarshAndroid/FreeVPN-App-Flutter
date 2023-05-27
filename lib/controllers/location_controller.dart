import 'package:get/get.dart';

import '../apis/apis.dart';
import '../models/vpn.dart';

class LocationController extends GetxController {
  List<Vpn> vpnList = [];

  final RxBool isLoading = false.obs;

  Future<void> getVpnData() async {
    isLoading.value = true;
    vpnList = await APIs.getVPNServers();
    isLoading.value = false;
  }
}
