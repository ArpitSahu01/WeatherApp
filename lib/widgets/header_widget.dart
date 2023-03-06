import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';

import '../controllers/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {


  final GlobalController globalController = Get.put(GlobalController(),permanent: true);
  String city = '';
  String date = DateFormat('MMMM d, yyyy').format(DateTime.now());

  @override
  void initState() {
    getAddress(globalController.getLattitude().value,globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat,lon) async{
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality ?? '';
    });
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20,right: 20),
          alignment: Alignment.topLeft,
          child: Text(city,style: const TextStyle(
            fontSize: 35,
            height: 2
          ),),),
        Container(
          margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(date,style: TextStyle(
              fontSize: 14,
              height: 1.5,
            color: Colors.grey[700],
          ),),),
      ],
    );
  }
}
