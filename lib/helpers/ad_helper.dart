import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  // for initializing ads sdk
  static Future<void> initAds() async {
    await MobileAds.instance.initialize();
  }
}
