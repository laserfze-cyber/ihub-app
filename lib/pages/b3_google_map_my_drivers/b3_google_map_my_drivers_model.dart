import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'b3_google_map_my_drivers_widget.dart' show B3GoogleMapMyDriversWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class B3GoogleMapMyDriversModel
    extends FlutterFlowModel<B3GoogleMapMyDriversWidget> {
  ///  Local state fields for this page.

  LatLng? location;

  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer;
  InstantTimer? instantTimer;
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
