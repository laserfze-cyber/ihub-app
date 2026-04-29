import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'q1_taxi_driver_page_widget.dart' show Q1TaxiDriverPageWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Q1TaxiDriverPageModel extends FlutterFlowModel<Q1TaxiDriverPageWidget> {
  ///  Local state fields for this page.

  LatLng? location;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  List<LoginRecord>? containerPreviousSnapshot;
  AudioPlayer? soundPlayer;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<LoginRecord>? loginSearchingQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  RideRequestsRecord? taxiRideendtime;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  RideRequestsRecord? iamhere;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
