import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapGoogle extends StatefulWidget {
   double? latitud;
   double? longitud;

   MapGoogle({Key? key, this.latitud, this.longitud}) : super(key: key);

  @override
  State<MapGoogle> createState() => _MapState();
}

class _MapState extends State<MapGoogle> {
  final Location _locationController =  Location();
  static const LatLng _pGooglePlex = LatLng(4.6587835, -74.1107824);
  LatLng? _currendP;
  late BitmapDescriptor _customMarkerIcon;
  
  @override
  void initState() {
    super.initState();
    _loadCustomMarkerIcon();
    if(widget.latitud == null && widget.longitud == null){
        getLocationUpdates();
    }else{
          setState(() {
            _currendP = LatLng(widget.latitud!, widget.longitud!);
          });
    }
  }

 Future<void> _loadCustomMarkerIcon() async {
    _customMarkerIcon = await getMarkerIconFromAsset('assets/icons/marker.png');
  }

  @override
  Widget build(BuildContext context) {
    return _currendP == null ? Container(
      child: const Text('Loading....'),
    ) : GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
           CameraPosition(target: _currendP!, zoom: 15.4746),
        markers: {
          Marker(
              markerId: const MarkerId('_currendPosition'),
              icon: _customMarkerIcon,
              position: _currendP!
            ),
        });
  }

  Future<BitmapDescriptor> getMarkerIconFromAsset(String assetPath) async {
    ByteData byteData = await rootBundle.load(assetPath);
    Uint8List byteList = byteData.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(byteList);
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGrande;

    _serviceEnabled = await _locationController.serviceEnabled();

    if(_serviceEnabled){
        _serviceEnabled = await _locationController.requestService();
    }else{
      return;
    }

    _permissionGrande = await _locationController.hasPermission();
    if(_permissionGrande == PermissionStatus.denied){
        _permissionGrande = await _locationController.requestPermission();
      if(_permissionGrande != PermissionStatus.granted){
        return;
      }
    }

    _locationController.onLocationChanged.listen((LocationData currentLocation) { 
        if(currentLocation.latitude != null && currentLocation.longitude != null){
          setState(() {
            _currendP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
          });
        }
    });
  }
}
