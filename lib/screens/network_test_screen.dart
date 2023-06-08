import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/network_data.dart';
import '../widgets/network_card.dart';

class NetworkTestScreen extends StatelessWidget {
  const NetworkTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Network Test Screen')),

      //refresh button
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 10),
        child: FloatingActionButton(
            onPressed: () {}, child: Icon(CupertinoIcons.refresh)),
      ),

      body: ListView(
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
                    subtitle: 'Not available',
                    icon: Icon(CupertinoIcons.location_solid,
                        color: Colors.blue))),

            //isp
            NetworkCard(
                data: NetworkData(
                    title: 'Internet Provider',
                    subtitle: 'Unknown',
                    icon: Icon(Icons.business, color: Colors.orange))),

            //location
            NetworkCard(
                data: NetworkData(
                    title: 'Location',
                    subtitle: 'Fetching ...',
                    icon: Icon(CupertinoIcons.location, color: Colors.pink))),

            //pin code
            NetworkCard(
                data: NetworkData(
                    title: 'Pin-code',
                    subtitle: '- - - -',
                    icon: Icon(CupertinoIcons.location_solid,
                        color: Colors.cyan))),

            //timezone
            NetworkCard(
                data: NetworkData(
                    title: 'Timezone',
                    subtitle: 'Unknown',
                    icon: Icon(CupertinoIcons.time, color: Colors.green))),
          ]),
    );
  }
}
