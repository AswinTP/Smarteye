import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myfoodcartui_smarteyedevelopers/screens/screenDriverHome.dart';
import 'package:myfoodcartui_smarteyedevelopers/Utilities/constants.dart'
    as constants;
import 'package:http/http.dart' as http;

Future<void> goToScreen(BuildContext context) async {
  var url = Uri.parse(constants.IP + 'validateUserLogin?mobile=8606644266');
  print('ASwin API -->Request: ${url}');
  var response = await http.get(url);
  print('ASwin API -->Response status: ${response.statusCode}');
  print('ASwin API -->Response body: ${response.body}');
  Map<String, dynamic> loginResponse = jsonDecode(response.body);

  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
          builder: (context) => ScreenDriverHome(driverData: loginResponse)),
      (Route<dynamic> route) => false);
}
