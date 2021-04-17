import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class GooglemapWidget extends StatefulWidget {
  const GooglemapWidget({
    Key key,
  }) : super(key: key);

  @override
  _GooglemapWidgetState createState() => _GooglemapWidgetState();
}

class _GooglemapWidgetState extends State<GooglemapWidget> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(28.752754508753736, 77.49804831305518);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height / 4,
          width: double.infinity,
          child: Card(
            margin: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Color(0xff0F9D58))),
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              minMaxZoomPreference: MinMaxZoomPreference(16, 100),
              buildingsEnabled: true,
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              mapType: MapType.normal,
              markers: {
                Marker(
                  markerId: MarkerId('kiet'),
                  draggable: false,
                  infoWindow: InfoWindow(title: "KIET Group Of Institutions"),
                  position: LatLng(28.752754508753736, 77.49804831305518),
                )
              },
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
          ),
        ),
        Positioned(
            top: 8,
            left: 8,
            child: PhysicalModel(
              elevation: 8,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2)),
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("KIET Group Of Institutions",
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    GestureDetector(
                      onTap: () {
                        launch("https://goo.gl/maps/Gfy2ZaxTah7s5y4J9");
                      },
                      child: Text('View in larger Map',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.blue)),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
