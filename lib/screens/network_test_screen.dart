import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../apis/apis.dart';
import '../main.dart';
import '../models/ip_details.dart';
import '../models/network_data.dart';
import '../widgets/network_card.dart';

class NetworkTestScreen extends StatelessWidget {
  const NetworkTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ipData = IPDetails.fromJson({}).obs;
    APIs.getIPDetails(ipData: ipData);

    return Scaffold(
      appBar: AppBar(title: Text('Network Test Screen')),

      //refresh button
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 10),
        child: FloatingActionButton(
            onPressed: () {
              ipData.value = IPDetails.fromJson({});
              APIs.getIPDetails(ipData: ipData);
            },
            child: Icon(CupertinoIcons.refresh)),
      ),

      body: Obx(
        () => ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(
                left: mq.width * .04,
                right: mq.width * .04,
                top: mq.height * .01,
                bottom: mq.height * .1),
            children: [
              //ip
              NetworkCard(
                  data: NetworkData(
                      title: 'IP Address',
                      subtitle: ipData.value.query,
                      icon: Icon(CupertinoIcons.location_solid,
                          color: Colors.blue))),

              //isp
              NetworkCard(
                  data: NetworkData(
                      title: 'Internet Provider',
                      subtitle: ipData.value.isp,
                      icon: Icon(Icons.business, color: Colors.orange))),

              //location
              NetworkCard(
                  data: NetworkData(
                      title: 'Location',
                      subtitle: ipData.value.country.isEmpty
                          ? 'Fetching ...'
                          : '${ipData.value.city}, ${ipData.value.regionName}, ${ipData.value.country}',
                      icon: Icon(CupertinoIcons.location, color: Colors.pink))),

              //pin code
              NetworkCard(
                  data: NetworkData(
                      title: 'Pin-code',
                      subtitle: ipData.value.zip,
                      icon: Icon(CupertinoIcons.location_solid,
                          color: Colors.cyan))),

              //timezone
              NetworkCard(
                  data: NetworkData(
                      title: 'Timezone',
                      subtitle: ipData.value.timezone,
                      icon: Icon(CupertinoIcons.time, color: Colors.green))),
            ]),
      ),
    );
  }
}
