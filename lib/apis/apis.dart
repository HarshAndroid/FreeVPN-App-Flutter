import 'dart:developer';

import 'package:csv/csv.dart';
import 'package:http/http.dart';

import '../models/vpn.dart';

class APIs {
  static Future<void> getVPNServers() async {
    final List<Vpn> vpnList = [];

    try {
      final res = await get(Uri.parse('http://www.vpngate.net/api/iphone/'));
      final csvString = res.body.split("#")[1].replaceAll('*', '');

      List<List<dynamic>> list = const CsvToListConverter().convert(csvString);

      final header = list[0];

      for (int i = 1; i < header.length; ++i) {
        Map<String, dynamic> tempJson = {};
        for (int j = 0; j < header.length; ++j) {
          tempJson.addAll({header[j].toString(): list[i][j]});
        }
        vpnList.add(Vpn.fromJson(tempJson));
      }

      log(vpnList.first.hostname);
    } catch (e) {
      log('\ngetVPNServersE: $e');
    }

    //  log(res.body);
  }
}

// For Understanding Purpose

//*** CSV Data ***
// Name,    Country,  Ping
// Test1,   JP,       12
// Test2,   US,       112
// Test3,   IN,       7

//*** List Data ***
// [ [Name, Country, Ping], [Test1, JP, 12], [Test2, US, 112], [Test3, IN, 7] ]

//*** Json Data ***
// {"Name": "Test1", "Country": "JP", "Ping": 12}

