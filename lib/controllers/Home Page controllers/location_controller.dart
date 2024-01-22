
import 'package:event_app/models/Home%20page%20models/locationModel.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';


class LocationController{

  late locationModel lc;

  Future<locationModel> getCurrentLocation() async{
    bool serviceEnabled;
    LocationPermission permission;


    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    lc=locationModel(country: "", locality: "");
    Position pos= await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    List<Placemark> placemarks = await placemarkFromCoordinates(pos.latitude, pos.longitude);
    if(placemarks.isNotEmpty){

      lc.locality="${placemarks[0].locality.toString()}, ${placemarks[0].street.toString()}";
      lc.country=placemarks[0].country.toString();

    }else{
      lc.locality="Enable location";
      lc.country="";
    }
    return lc;
  }
}