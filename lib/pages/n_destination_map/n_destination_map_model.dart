import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'n_destination_map_widget.dart' show NDestinationMapWidget;
import 'package:flutter/material.dart';

class NDestinationMapModel extends FlutterFlowModel<NDestinationMapWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Backend Call - API (get location name)] action in Button widget.
  ApiCallResponse? apiresponce;
  // Stores action output result for [Backend Call - API (Distance)] action in Button widget.
  ApiCallResponse? apiResult8lk;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<LoginRecord>? loginAfter5diriveravailableErase1;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
