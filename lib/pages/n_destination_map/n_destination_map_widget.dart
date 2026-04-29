import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'n_destination_map_model.dart';
export 'n_destination_map_model.dart';

/// booking moving  map with icon fixed in center
class NDestinationMapWidget extends StatefulWidget {
  const NDestinationMapWidget({super.key});

  static String routeName = 'N-Destination_map';
  static String routePath = '/nDestinationMap';

  @override
  State<NDestinationMapWidget> createState() => _NDestinationMapWidgetState();
}

class _NDestinationMapWidgetState extends State<NDestinationMapWidget>
    with TickerProviderStateMixin {
  late NDestinationMapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NDestinationMapModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.5, 1.5),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return StreamBuilder<List<PricesRecord>>(
      stream: queryPricesRecord(
        queryBuilder: (pricesRecord) => pricesRecord.where(
          'Country_App',
          isEqualTo: FFAppState().Appcountry,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<PricesRecord> nDestinationMapPricesRecordList = snapshot.data!;
        final nDestinationMapPricesRecord =
            nDestinationMapPricesRecordList.isNotEmpty
                ? nDestinationMapPricesRecordList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: Color(0xFF14181B),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pushNamed(B2TaxiWidget.routeName);
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'yt3uzsys' /* My destination */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.interTight(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFF9F9E4),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: SafeArea(
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFFF9F9E4),
                              ),
                              child: Stack(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                children: [
                                  FlutterFlowGoogleMap(
                                    controller: _model.googleMapsController,
                                    onCameraIdle: (latLng) => safeSetState(
                                        () => _model.googleMapsCenter = latLng),
                                    initialLocation: _model.googleMapsCenter ??=
                                        currentUserLocationValue!,
                                    markerColor: GoogleMarkerColor.yellow,
                                    mapType: MapType.normal,
                                    style: GoogleMapStyle.silver,
                                    initialZoom: 14.0,
                                    allowInteraction: true,
                                    allowZoom: true,
                                    showZoomControls: true,
                                    showLocation: true,
                                    showCompass: true,
                                    showMapToolbar: false,
                                    showTraffic: true,
                                    centerMapOnMarkerTap: true,
                                    mapTakesGesturePreference: false,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0x4C4F3DF8),
                          width: 3.0,
                        ),
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.black,
                        size: 32.0,
                      ).animateOnPageLoad(
                          animationsMap['iconOnPageLoadAnimation']!),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 24.0, 32.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x5B000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Icon(
                                              Icons.location_on,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 20.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '2vxrlqrr' /* Pin Location */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .interTight(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            GetLocationNameCall
                                                                .apicity(
                                                              (_model.apiresponce
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            '-',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            GetLocationNameCall
                                                                .apiarea(
                                                              (_model.apiresponce
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            '-',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 12.0)),
                                      ),
                                    ].divide(SizedBox(height: 12.0)),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      currentUserLocationValue =
                                          await getCurrentUserLocation(
                                              defaultLocation:
                                                  LatLng(0.0, 0.0));
                                      // Api get location name
                                      _model.apiresponce =
                                          await GetLocationNameCall.call(
                                        apigeo: functions.latLngToString(
                                            _model.googleMapsCenter),
                                      );

                                      // City-Area
                                      FFAppState().City =
                                          GetLocationNameCall.apicity(
                                        (_model.apiresponce?.jsonBody ?? ''),
                                      )!;
                                      FFAppState().Area =
                                          GetLocationNameCall.apiarea(
                                        (_model.apiresponce?.jsonBody ?? ''),
                                      )!;
                                      safeSetState(() {});
                                      // latandlngCustomerdistination-origin-destinition-origingpoint
                                      FFAppState()
                                              .latandlngCustomerdistination =
                                          _model.googleMapsCenter;
                                      FFAppState().origin =
                                          functions.latLngToString(
                                              currentUserLocationValue)!;
                                      FFAppState().destination =
                                          functions.latLngToString(
                                              _model.googleMapsCenter)!;
                                      FFAppState().origingpoint =
                                          currentUserLocationValue;
                                      safeSetState(() {});

                                      safeSetState(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'axx0w080' /* 1- Confirm destination */,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 50.0,
                                      padding: EdgeInsets.all(8.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Colors.white,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 4.0,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      // Distance API
                                      _model.apiResult8lk =
                                          await DistanceCall.call(
                                        start: FFAppState().origin,
                                        end: FFAppState().destination,
                                      );

                                      // Update State distance duration
                                      FFAppState().Distance =
                                          DistanceCall.distance(
                                        (_model.apiResult8lk?.jsonBody ?? ''),
                                      )!;
                                      FFAppState().Duration =
                                          DistanceCall.duration(
                                        (_model.apiResult8lk?.jsonBody ?? ''),
                                      )!;
                                      safeSetState(() {});
                                      _model.loginAfter5diriveravailableErase1 =
                                          await queryLoginRecordOnce(
                                        queryBuilder: (loginRecord) =>
                                            loginRecord.where(
                                          'finishtime',
                                          isLessThan: getCurrentTimestamp,
                                        ),
                                      );
                                      for (int loop1Index = 0;
                                          loop1Index <
                                              _model
                                                  .loginAfter5diriveravailableErase1!
                                                  .length;
                                          loop1Index++) {
                                        final currentLoop1Item = _model
                                                .loginAfter5diriveravailableErase1![
                                            loop1Index];
                                        if (currentLoop1Item.status !=
                                            'accepted') {
                                          await currentLoop1Item.reference
                                              .update(createLoginRecordData(
                                            status: 'Free',
                                            music: false,
                                            lock: false,
                                            customerDistance: '0',
                                          ));
                                        }
                                      }
                                      if (FFAppState().craneortaxi == 'crane') {
                                        // crane EST price
                                        FFAppState().ESTprice =
                                            (String var1, double var2) {
                                          return ((double.tryParse(
                                                          var1.replaceAll(
                                                              ' km', '')) ??
                                                      0) *
                                                  var2)
                                              .toStringAsFixed(2);
                                        }(
                                                FFAppState().Distance,
                                                valueOrDefault<double>(
                                                  nDestinationMapPricesRecord
                                                      ?.cranePricePerKM,
                                                  0.0,
                                                ));
                                        safeSetState(() {});
                                        FFAppState().Initialprice =
                                            valueOrDefault<String>(
                                          nDestinationMapPricesRecord
                                              ?.craneStartingPrice
                                              .toString(),
                                          '0',
                                        );
                                        safeSetState(() {});
                                        if (FFAppState().Initialprice == '0') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'This country is not currently supported..هذه الدولة غير مدعومة ',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  Color(0xFFFBEB02),
                                            ),
                                          );

                                          context.pushNamed(
                                              FSettingsWidget.routeName);
                                        } else {
                                          // Alert
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Please confirm your booking request. A nearby driver will be notified immediately.   You can track the driver on map after confirmation.'),
                                                        content: Text(
                                                            '  الرجاء تأكيد الحجز سوف نعلم السائق بالجوار فورا ,يمكنك متابعة السائق على الخارطة'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child:
                                                                Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child:
                                                                Text('Confirm'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                          if (confirmDialogResponse) {
                                            context.pushNamed(
                                                O1BookingPageWidget.routeName);
                                          } else {
                                            context.pushNamed(
                                                B2TaxiWidget.routeName);
                                          }
                                        }
                                      } else {
                                        // taxi EST price
                                        FFAppState().ESTprice =
                                            (String var1, double var2) {
                                          return ((double.tryParse(
                                                          var1.replaceAll(
                                                              ' km', '')) ??
                                                      0) *
                                                  var2)
                                              .toStringAsFixed(2);
                                        }(
                                                FFAppState().Distance,
                                                valueOrDefault<double>(
                                                  nDestinationMapPricesRecord
                                                      ?.taxPricePerKM,
                                                  0.0,
                                                ));
                                        safeSetState(() {});
                                        FFAppState().Initialprice =
                                            valueOrDefault<String>(
                                          nDestinationMapPricesRecord
                                              ?.taxiStartingPrice
                                              .toString(),
                                          '0',
                                        );
                                        safeSetState(() {});
                                        if (FFAppState().Initialprice == '0') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'This country is not currently supported..هذه الدولة غير مدعومة ',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  Color(0xFFFBEB02),
                                            ),
                                          );

                                          context.pushNamed(
                                              FSettingsWidget.routeName);
                                        } else {
                                          // Alert
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Please confirm your booking request. A nearby driver will be notified immediately.   You can track the driver on map after confirmation.'),
                                                        content: Text(
                                                            '  الرجاء تأكيد الحجز سوف نعلم السائق بالجوار فورا ,يمكنك متابعة السائق على الخارطة'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child:
                                                                Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child:
                                                                Text('Confirm'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                          if (confirmDialogResponse) {
                                            context.pushNamed(
                                                O1BookingPageWidget.routeName);
                                          } else {
                                            context.pushNamed(
                                                B2TaxiWidget.routeName);
                                          }
                                        }
                                      }

                                      safeSetState(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'n4hn6ooj' /* 2- Book a ride */,
                                    ),
                                    icon: FaIcon(
                                      FontAwesomeIcons.taxi,
                                      size: 26.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 50.0,
                                      padding: EdgeInsets.all(8.0),
                                      iconAlignment: IconAlignment.end,
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              5.0, 0.0, 20.0, 0.0),
                                      iconColor: Colors.black,
                                      color: Colors.white,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 4.0,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, -0.94),
                          child: FlutterFlowPlacePicker(
                            iOSGoogleMapsApiKey:
                                'AIzaSyDDi3TJUYtjrHrUitNc2WMuwZ-8-Xpj0jA',
                            androidGoogleMapsApiKey:
                                'AIzaSyD3EPsDHrrz1WKLc8Lidcfr6v0ZGr9M3BA',
                            webGoogleMapsApiKey:
                                'AIzaSyCXD65age_lNXLVse0fyLwWQQltNoMz2z0',
                            onSelect: (place) async {
                              safeSetState(
                                  () => _model.placePickerValue = place);
                            },
                            defaultText: FFLocalizations.of(context).getText(
                              '2c5g7glv' /* Select destination */,
                            ),
                            icon: Icon(
                              Icons.place,
                              color: Colors.black,
                              size: 16.0,
                            ),
                            buttonOptions: FFButtonOptions(
                              width: 200.0,
                              height: 40.0,
                              color: Colors.white,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.black,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 4.0,
                              borderSide: BorderSide(
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, -0.94),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await _model.googleMapsController.future.then(
                                  (c) => c.animateCamera(
                                    CameraUpdate.newLatLng(_model
                                        .placePickerValue.latLng
                                        .toGoogleMaps()),
                                  ),
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'ua1nu11d' /* Confirm */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.black,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
