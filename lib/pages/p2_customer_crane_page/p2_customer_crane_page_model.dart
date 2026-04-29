import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'p2_customer_crane_page_widget.dart' show P2CustomerCranePageWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class P2CustomerCranePageModel
    extends FlutterFlowModel<P2CustomerCranePageWidget> {
  ///  Local state fields for this page.

  LatLng? location;

  ///  State fields for stateful widgets in this page.

  List<LoginRecord>? p2CustomerCranePagePreviousSnapshot;
  // Stores action output result for [Firestore Query - Query a collection] action in P2-Customer-Crane-Page widget.
  SystemDelayRecord? queryDelay;
  // Stores action output result for [Firestore Query - Query a collection] action in P2-Customer-Crane-Page widget.
  RideRequestsRecord? whoTakeTheride;
  // Stores action output result for [Firestore Query - Query a collection] action in P2-Customer-Crane-Page widget.
  List<LoginRecord>? loginAfter5diriveravailable;
  InstantTimer? instantTimer;
  // Stores action output result for [Firestore Query - Query a collection] action in P2-Customer-Crane-Page widget.
  RideRequestsRecord? bell;
  AudioPlayer? soundPlayer;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
