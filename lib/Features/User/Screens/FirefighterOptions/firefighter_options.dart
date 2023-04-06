import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:public_emergency_app/Common%20Widgets/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Controllers/message_sending.dart';

class FireFighterOptions extends StatelessWidget {
  const FireFighterOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final smsController = Get.put(messageController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(color),
        centerTitle: true,
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(Get.height * 0.1),
            child: Container(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: const AssetImage(
                              "assets/logos/emergencyAppLogo.png"),
                          height: Get.height * 0.08),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Fire Fighter Options",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: ListTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                tileColor: Color(color),
                leading: const Icon(Icons.map, color: Colors.yellowAccent),
                title: const Text('Fire Station Map Display',style: TextStyle(
                  color: Colors.white
                ),),
                subtitle:
                    const Text('Find the nearest fire station on the map',style: TextStyle(
                      color: Colors.white
                    ),),
                onTap: () async {
                  Position position = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high);
                  var lat= position.latitude;
                  var long= position.longitude;
                  String url = '';
                  String urlAppleMaps = '';
                  if (Platform.isAndroid) {
                    url = "https://www.google.com/maps/search/fire+brigade/@$lat,$long,12.5z";
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    } else {
                      throw 'Could not launch $url';
                    }
                  } else {
                    urlAppleMaps = 'https://maps.apple.com/?q=$lat,$long';
                    url = 'comgooglemaps://?saddr=&daddr=$lat,$long&directionsmode=driving';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    } else if (await canLaunchUrl(Uri.parse(urlAppleMaps))) {
                      await launchUrl(Uri.parse(urlAppleMaps));
                    } else {
                      throw 'Could not launch $url';
                    }
                  }
                  // Add code here to display the nearest police station on the map
                },
              ),
            ),
            Card(
              child: ListTile(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  tileColor: Color(color),
                  leading: const Icon(Icons.call,color: Colors.yellowAccent,),
                  title: const Text('Call',style: TextStyle(
                    color: Colors.white
                  ),),
                  subtitle:
                      const Text('Directly call the fire station helpline',style: TextStyle(
                        color: Colors.white

                      ),),
                  onTap: () async {
                    if (await Permission.phone.request().isGranted) {
                      debugPrint("In making phone call");
                      var url = Uri.parse("tel:16");
                      await launchUrl(url);

                      debugPrint("Location Permission is granted");
                    } else {
                      debugPrint("Location Permission is denied.");
                    }
                  }),
            ),
            Card(
              child: ListTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                tileColor: const Color(0xfff85757),
                leading: const Icon(Icons.message,color: Colors.white,),
                title: const Text('Send Distress Message',style: TextStyle(
                  color: Colors.white
                ),),
                subtitle:
                    const Text('Send a distress message to emergency contacts',style: TextStyle(
                      color: Colors.white
                    ),),
                onTap: () async {
                  // await BackgroundSms.sendMessage(
                  //     phoneNumber: "03325106960",
                  //     message: "Testing SMS Service");
                  // if (result == SmsStatus.sent) {
                  //   print("Sent");
                  // } else {
                  //   print("Failed");
                  // }
                  smsController.sendLocationViaSMS("Fire Emergency\nSend Help at");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

// Function for send SMS
}
