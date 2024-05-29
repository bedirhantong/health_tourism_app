import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../utils/services/api_service.dart';
import '../home/components/clinics_detail.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(36.88, 30.70);
  Set<Marker> markers = {};
  late APIService apiService;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiService = APIService();
    _addMarkers();
  }

  Future<void> _addMarkers() async {
    final clinics = await apiService.getAllClinics();
    if (clinics != null) {
      setState(() {
        markers = clinics
            .map((clinic) => Marker(
                  markerId: MarkerId(clinic.name!),
                  position: LatLng(clinic.latitude!, clinic.longitude!),
                  infoWindow: InfoWindow(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreenClinic(product: clinic),
                        ),
                      );
                    },
                    title: clinic.name,
                  ),
                ))
            .toSet();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    APIService apiService = APIService();
    // OfferPointMarkers offerPointMarkers = OfferPointMarkers(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Clinic Points"),
        centerTitle: true,
      ),
      body: GoogleMap(
        mapType: MapType.values[1],
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 12.0,
          // tilt: 20.0,
          // bearing: 15.0,
        ),
        markers: markers,
      ),
    );
  }
}
