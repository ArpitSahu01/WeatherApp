import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class GlobalController extends GetxController{

  // create various variables
  final RxBool _isLoading = true.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxDouble _lattitude = 0.0.obs;


  //instance for them to be called
RxBool checkLoading()=> _isLoading;
RxDouble getLongitude()=> _longitude;
RxDouble getLattitude()=> _lattitude;

@override
  void onInit() async{
  if(_isLoading.isTrue){
    getLocation();
  }
    super.onInit();
  }

  getLocation() async{

    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    // return if service is not enabled
    if(!isServiceEnabled){
      return Future.error('Location not enabled');
    }

    // status of permission
    locationPermission = await Geolocator.checkPermission();

    if(locationPermission == LocationPermission.deniedForever){
      return Future.error('Location permission are denied forever');
    }else if( locationPermission == LocationPermission.denied){
      // request permission
      locationPermission = await Geolocator.requestPermission();
      if(locationPermission == LocationPermission.denied){
        return Future.error('Location permission is denied');
      }
    }

    // getting the current position
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then(
            (value) {
              // update our lattitude and longitude
              _lattitude.value = value.latitude;
              _longitude.value = value.longitude;
              _isLoading.value = false;
            }
    );


  }


}