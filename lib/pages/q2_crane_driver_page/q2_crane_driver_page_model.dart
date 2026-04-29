import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'q2_crane_driver_page_widget.dart' show Q2CraneDriverPageWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Q2CraneDriverPageModel extends FlutterFlowModel<Q2CraneDriverPageWidget> {
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
  RideRequestsRecord? crainRideendtime;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  RideRequestsRecord? iamhere;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
