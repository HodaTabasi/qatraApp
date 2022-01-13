import 'dart:collection';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/helper/providers/main_provider.dart';
import 'package:qatra_app/models/HomeResponse.dart';
import 'package:qatra_app/models/Mosque.dart';
import 'package:qatra_app/models/ProductsResponse.dart';
import 'package:qatra_app/screens/home/components/bottom_sheet.dart';
import 'package:qatra_app/screens/home/components/chooeser_layout.dart';
import 'package:qatra_app/helper/http_service.dart';
import 'package:qatra_app/utils/constant.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Set<Marker> _markersMakkah = HashSet<Marker>();
  Set<Marker> _markersAlharam = HashSet<Marker>();
  Set<Polygon> _polygons = HashSet<Polygon>();
  Set<Polyline> _polylines = HashSet<Polyline>();
  Set<Circle> _circles = HashSet<Circle>();
  bool _isDataLoading = true;

  GoogleMapController _mapController;
  BitmapDescriptor _markerIcon;
  Uint8List _markerIcon1;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _setMarkerIcon();
    // _setPolygons();
    // _setPolylines();
    // _setCircles();
  }

  void _setMarkerIcon() async {
    // _markerIcon =
    //     await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/map_icon.png');
    _markerIcon1 = await getBytesFromAsset('assets/map_icon.png', 150);
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  void _onMapCreated(GoogleMapController controller) async {
    // final progress = ProgressHUD.of(context);

    _mapController = controller;

    // progress.show();
    setState(() {
      isLoading = true;
    });

    HomeResponse homeResponse = await HttpService.apiHelper.getMosque(context);

    if (homeResponse.status) {
      // progress.dismiss();

      setState(() {
        _isDataLoading = true;
        isLoading = false;

        Iterable<Mosque> makka = homeResponse.data;
        mosqueList.addAll(homeResponse.data);
            // .where((element) => element.type.contains("Makkah"));
        // Iterable<Mosque> Alharam = homeResponse.data
        //     .where((element) => element.type.contains("Alharam"));

        // print("${makka.length} ffffffff ${Alharam.length}");

        makka.map((e) {
          return _markersMakkah.add(
            Marker(
                onTap: () async {
                  // progress.show();
                  setState(() {
                    isLoading = true;
                  });
                  Provider.of<MainProvider>(context, listen: false).mosqueId =
                      e.id;
                  products productsResponse =
                      await HttpService.apiHelper.getProducts();
                  if (productsResponse.status) {
                    setState(() {
                      isLoading = false;
                    });
                    BottomSheets().getBottom(context, productsResponse.data);
                  } else {
                    addToastMessage(
                        error: productsResponse.message[0], type: false);
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                markerId: MarkerId("${e.id}"),
                position: LatLng(double.parse(e.lat), double.parse(e.lng)),
                infoWindow: InfoWindow(
                  title: "${e.name}",
                  snippet: "${e.type}",
                ),
                icon: BitmapDescriptor.fromBytes(_markerIcon1)),
          );
        }).toList();

        // Alharam.map((e) {
        //   return _markersAlharam.add(
        //     Marker(
        //         onTap: () async {
        //           // progress.show();
        //           setState(() {
        //             isLoading = true;
        //           });
        //           Provider.of<MainProvider>(context, listen: false).mosqueId =
        //               e.id;
        //           products productsResponse =
        //               await HttpService.apiHelper.getProducts();
        //           if (productsResponse.status) {
        //             // progress.dismiss();
        //             setState(() {
        //               isLoading = false;
        //             });
        //             BottomSheets().getBottom(context, productsResponse.data);
        //           } else {
        //             addToastMessage(
        //                 error: productsResponse.message[0], type: false);
        //             setState(() {
        //               isLoading = false;
        //             });
        //           }
        //         },
        //         markerId: MarkerId("${e.id}"),
        //         position: LatLng(double.parse(e.lat), double.parse(e.lng)),
        //         infoWindow: InfoWindow(
        //           title: "${e.name}",
        //           snippet: "${e.type}",
        //         ),
        //         icon: BitmapDescriptor.fromBytes(_markerIcon1)),
        //   );
        // }).toList();
      });
    } else {
      addToastMessage(error: homeResponse.message[0], type: true);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            // target: LatLng(28.5904656, 35.3894415),
            target: LatLng(21.4227473, 39.8226583),
            zoom: 8,
          ),
          markers: _markersMakkah,
          // markers: Provider.of<MainProvider>(context).mosqueType == 1
          //     ? _markersMakkah
          //     : _markersAlharam,
          // polygons: _polygons,
          // polylines: _polylines,
          // circles: _circles,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        ),
        // Choosere(),
        isLoading
            ? Align(
                alignment: Alignment.center,
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                  child: SpinKitPouringHourGlassRefined(
                    color: Color(0xff00DAFD),
                    size: 50.0,
                  ),
                ),
              )
            : Center()
      ],
    );

    // return _isDataLoading
    //     ? Stack(
    //         children: <Widget>[
    //           GoogleMap(
    //             onMapCreated: _onMapCreated,
    //             initialCameraPosition: CameraPosition(
    //               target: LatLng(23.885942, 45.079163),
    //               zoom: 10,
    //             ),
    //             markers: _markers,
    //             // polygons: _polygons,
    //             // polylines: _polylines,
    //             // circles: _circles,
    //             myLocationEnabled: true,
    //             myLocationButtonEnabled: true,
    //           ),
    //           Choosere(),
    //         ],
    //       )
    //     : new Center(
    //         child: new SizedBox(
    //           height: 50.0,
    //           width: 50.0,
    //           child: new CircularProgressIndicator(
    //             value: null,
    //             strokeWidth: 7.0,
    //           ),
    //         ),
    //       );
  }
}


