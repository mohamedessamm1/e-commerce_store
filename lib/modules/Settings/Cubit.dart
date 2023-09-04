import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart';
import 'package:store/modules/Settings/States.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit() : super(SettingsPageInitialState());

  static SettingsCubit get(context) => BlocProvider.of(context);

  final Uri _urlface = Uri.parse(
      'https://www.facebook.com/profile.php?id=100006263594549&mibextid=ZbWKwL');
  final Uri _urlwhats = Uri.parse('https://wa.link/q5ok2d');

  Future<void> launchUrllfacebook() async {
    if (!await launchUrl(
      _urlface,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $_urlface');
    }
  }

  Future<void> launchUrllwhats() async {
    if (!await launchUrl(
      _urlwhats,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $_urlwhats');
    }
  }

  Location location = new Location();
  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  LocationPermission() async {
    emit(GetLocationloading());

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
  }

  double? lat;
  double? long;

  getLocation() async {
    emit(GetLocationloading());

    lat = await _locationData?.latitude;
    long = await _locationData?.longitude;
  }

  List<geo.Placemark>? placemarks;

  getmyaddress() async {
    emit(GetLocationloading());
    placemarks = await geo.placemarkFromCoordinates(lat!, long!);

    emit(GetLocation());
  }
}
