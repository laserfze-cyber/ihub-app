import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o1_booking_page_model.dart';
export 'o1_booking_page_model.dart';

/// booking moving  map with icon fixed in center
class O1BookingPageWidget extends StatefulWidget {
  const O1BookingPageWidget({super.key});

  static String routeName = 'O1-Booking_page';
  static String routePath = '/o1BookingPage';

  @override
  State<O1BookingPageWidget> createState() => _O1BookingPageWidgetState();
}

class _O1BookingPageWidgetState extends State<O1BookingPageWidget> {
  late O1BookingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => O1BookingPageModel());

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

    return StreamBuilder<List<PricesRecord>>(
      stream: queryPricesRecord(
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
        List<PricesRecord> o1BookingPagePricesRecordList = snapshot.data!;
        final o1BookingPagePricesRecord =
            o1BookingPagePricesRecordList.isNotEmpty
                ? o1BookingPagePricesRecordList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
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
                  FFAppState().City = '';
                  FFAppState().Area = '';
                  FFAppState().origin = '';
                  FFAppState().destination = '';
                  FFAppState().apigeo = '';
                  FFAppState().Distance = '';
                  safeSetState(() {});
                  context.pop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'j41xeeu7' /* Booking details */,
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
            body: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 878.12,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: Image.asset(
                        'assets/images/Image_Effect_prompt_Create_image_xxxxx.jpg',
                      ).image,
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.95,
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 20.0),
                      child: StreamBuilder<List<RideRequestsRecord>>(
                        stream: queryRideRequestsRecord(
                          queryBuilder: (rideRequestsRecord) =>
                              rideRequestsRecord
                                  .where(
                                    'customerId',
                                    isEqualTo: currentUserEmail,
                                  )
                                  .orderBy('timestamp', descending: true),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<RideRequestsRecord>
                              containerRideRequestsRecordList = snapshot.data!;
                          final containerRideRequestsRecord =
                              containerRideRequestsRecordList.isNotEmpty
                                  ? containerRideRequestsRecordList.first
                                  : null;

                          return Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0xCE000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: StreamBuilder<List<LoginRecord>>(
                              stream: queryLoginRecord(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<LoginRecord> containerLoginRecordList =
                                    snapshot.data!;

                                return Container(
                                  decoration: BoxDecoration(),
                                  child: StreamBuilder<List<OurPercentRecord>>(
                                    stream: queryOurPercentRecord(
                                      singleRecord: true,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<OurPercentRecord>
                                          columnOurPercentRecordList =
                                          snapshot.data!;
                                      final columnOurPercentRecord =
                                          columnOurPercentRecordList.isNotEmpty
                                              ? columnOurPercentRecordList.first
                                              : null;

                                      return SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0, 35.0, 30.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 49.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFEFFEF),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x27000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      3.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '47lrix63' /* Your location : */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                  lineHeight:
                                                                      1.2,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'cz039nby' /* Current location */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0, 30.0, 30.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 49.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFEFFEF),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x27000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      3.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'lqnbldiq' /* Your Destination : */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                FFAppState()
                                                                    .City,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                FFAppState()
                                                                    .Area,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0, 30.0, 30.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 49.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFEFFEF),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x27000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      3.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'aqt6d9ur' /* Distance KM : */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                FFAppState()
                                                                    .Distance,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0, 30.0, 30.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 49.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFEFFEF),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x27000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      3.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'i6ozcwnb' /* Estimated Duration MINS: */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                FFAppState()
                                                                    .Duration,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0, 30.0, 30.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 49.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFEFFEF),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x27000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      3.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'nvoo3fil' /* Estimated average price  : */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFAppState()
                                                                .ESTprice,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0, 30.0, 30.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 49.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFEFFEF),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x27000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      3.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '46vgyqcp' /* Initial price: */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                FFAppState()
                                                                    .Initialprice,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0, 30.0, 30.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 49.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFEFFEF),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x27000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      3.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'yrzpsdv6' /* Trip total: */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                ((double.tryParse(FFAppState().Initialprice) ??
                                                                            0) +
                                                                        (double.tryParse(FFAppState().ESTprice) ??
                                                                            0))
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0, 60.0, 30.0, 0.0),
                                                child: StreamBuilder<
                                                    List<SystemDelayRecord>>(
                                                  stream:
                                                      querySystemDelayRecord(
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<SystemDelayRecord>
                                                        buttonSystemDelayRecordList =
                                                        snapshot.data!;
                                                    final buttonSystemDelayRecord =
                                                        buttonSystemDelayRecordList
                                                                .isNotEmpty
                                                            ? buttonSystemDelayRecordList
                                                                .first
                                                            : null;

                                                    return FFButtonWidget(
                                                      onPressed: () async {
                                                        currentUserLocationValue =
                                                            await getCurrentUserLocation(
                                                                defaultLocation:
                                                                    LatLng(0.0,
                                                                        0.0));
                                                        // originpoint-current location
                                                        FFAppState()
                                                                .origingpoint =
                                                            currentUserLocationValue;
                                                        safeSetState(() {});
                                                        // LOGIN_state list filter
                                                        _model.lOGINState =
                                                            await queryLoginRecordOnce(
                                                          queryBuilder: (loginRecord) =>
                                                              loginRecord
                                                                  .where(
                                                                    'Is_this_em_lift',
                                                                    isEqualTo: FFAppState().craneortaxi ==
                                                                            'taxi'
                                                                        ? true
                                                                        : false,
                                                                  )
                                                                  .where(
                                                                    'is_this_driver',
                                                                    isEqualTo: FFAppState().craneortaxi ==
                                                                            'crane'
                                                                        ? true
                                                                        : false,
                                                                  )
                                                                  .where(
                                                                    'driver_on_off',
                                                                    isEqualTo:
                                                                        true,
                                                                  )
                                                                  .orderBy(
                                                                      'created_time',
                                                                      descending:
                                                                          true),
                                                        );
                                                        // Near 5 taxi
                                                        FFAppState().nearest5 = functions
                                                            .findNearestDrivers(
                                                                FFAppState()
                                                                    .origingpoint!,
                                                                _model
                                                                    .lOGINState
                                                                    ?.map((e) => e
                                                                        .latlong)
                                                                    .withoutNulls
                                                                    .toList()
                                                                    .toList(),
                                                                _model
                                                                    .lOGINState
                                                                    ?.map((e) =>
                                                                        e.email)
                                                                    .toList()
                                                                    .toList(),
                                                                _model
                                                                    .lOGINState
                                                                    ?.map((e) =>
                                                                        e.uid)
                                                                    .toList()
                                                                    .toList(),
                                                                _model
                                                                    .lOGINState
                                                                    ?.map((e) =>
                                                                        e.phoneNumber)
                                                                    .toList()
                                                                    .toList())!
                                                            .toList()
                                                            .cast<dynamic>();
                                                        safeSetState(() {});
                                                        // Create Ride_requests

                                                        var rideRequestsRecordReference =
                                                            RideRequestsRecord
                                                                .collection
                                                                .doc();
                                                        await rideRequestsRecordReference
                                                            .set({
                                                          ...createRideRequestsRecordData(
                                                            customerId:
                                                                currentUserEmail,
                                                            pickupLatlong:
                                                                currentUserLocationValue,
                                                            dropLatlong:
                                                                FFAppState()
                                                                    .latandlngCustomerdistination,
                                                            distanceKm:
                                                                FFAppState()
                                                                    .Distance,
                                                            etaMin: FFAppState()
                                                                .Duration,
                                                            status: 'searching',
                                                            fareEstimate: ((double.tryParse(FFAppState()
                                                                            .Initialprice) ??
                                                                        0) +
                                                                    (double.tryParse(
                                                                            FFAppState().ESTprice) ??
                                                                        0))
                                                                .toString(),
                                                            timestamp:
                                                                getCurrentTimestamp,
                                                            paymentStatus:
                                                                false,
                                                            tripStartTime:
                                                                getCurrentTimestamp,
                                                            tripEndTime:
                                                                getCurrentTimestamp,
                                                            dropAddress:
                                                                FFAppState()
                                                                    .Area,
                                                            dropAddressCity:
                                                                FFAppState()
                                                                    .City,
                                                            pickupAddress: '',
                                                            customerPhone: '',
                                                            whoTakeTheOrder:
                                                                'xxx',
                                                            carNO: 'xxx',
                                                            carType: 'xxx',
                                                            craneOrTaxi:
                                                                FFAppState()
                                                                    .craneortaxi,
                                                            uid:
                                                                containerRideRequestsRecord
                                                                    ?.reference
                                                                    .id,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'driverId':
                                                                  FFAppState()
                                                                      .nearest5
                                                                      .map((e) =>
                                                                          getJsonField(
                                                                            e,
                                                                            r'''$.email''',
                                                                          ))
                                                                      .toList()
                                                                      .map((e) =>
                                                                          e.toString())
                                                                      .toList(),
                                                              'driverPhone':
                                                                  FFAppState()
                                                                      .nearest5
                                                                      .map((e) =>
                                                                          getJsonField(
                                                                            e,
                                                                            r'''$.phone''',
                                                                          ))
                                                                      .toList()
                                                                      .map((e) =>
                                                                          e.toString())
                                                                      .toList(),
                                                              'driverLocationLatlong':
                                                                  FFAppState()
                                                                      .nearest5
                                                                      .map((e) =>
                                                                          getJsonField(
                                                                            e,
                                                                            r'''$.location''',
                                                                          ))
                                                                      .toList()
                                                                      .map((e) =>
                                                                          e.toString())
                                                                      .toList(),
                                                              'distance_cus_to_driver':
                                                                  FFAppState()
                                                                      .nearest5
                                                                      .map((e) =>
                                                                          getJsonField(
                                                                            e,
                                                                            r'''$.distance''',
                                                                          ))
                                                                      .toList()
                                                                      .map((e) =>
                                                                          e.toString())
                                                                      .toList(),
                                                            },
                                                          ),
                                                        });
                                                        _model.createdRide =
                                                            RideRequestsRecord
                                                                .getDocumentFromData({
                                                          ...createRideRequestsRecordData(
                                                            customerId:
                                                                currentUserEmail,
                                                            pickupLatlong:
                                                                currentUserLocationValue,
                                                            dropLatlong:
                                                                FFAppState()
                                                                    .latandlngCustomerdistination,
                                                            distanceKm:
                                                                FFAppState()
                                                                    .Distance,
                                                            etaMin: FFAppState()
                                                                .Duration,
                                                            status: 'searching',
                                                            fareEstimate: ((double.tryParse(FFAppState()
                                                                            .Initialprice) ??
                                                                        0) +
                                                                    (double.tryParse(
                                                                            FFAppState().ESTprice) ??
                                                                        0))
                                                                .toString(),
                                                            timestamp:
                                                                getCurrentTimestamp,
                                                            paymentStatus:
                                                                false,
                                                            tripStartTime:
                                                                getCurrentTimestamp,
                                                            tripEndTime:
                                                                getCurrentTimestamp,
                                                            dropAddress:
                                                                FFAppState()
                                                                    .Area,
                                                            dropAddressCity:
                                                                FFAppState()
                                                                    .City,
                                                            pickupAddress: '',
                                                            customerPhone: '',
                                                            whoTakeTheOrder:
                                                                'xxx',
                                                            carNO: 'xxx',
                                                            carType: 'xxx',
                                                            craneOrTaxi:
                                                                FFAppState()
                                                                    .craneortaxi,
                                                            uid:
                                                                containerRideRequestsRecord
                                                                    ?.reference
                                                                    .id,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'driverId':
                                                                  FFAppState()
                                                                      .nearest5
                                                                      .map((e) =>
                                                                          getJsonField(
                                                                            e,
                                                                            r'''$.email''',
                                                                          ))
                                                                      .toList()
                                                                      .map((e) =>
                                                                          e.toString())
                                                                      .toList(),
                                                              'driverPhone':
                                                                  FFAppState()
                                                                      .nearest5
                                                                      .map((e) =>
                                                                          getJsonField(
                                                                            e,
                                                                            r'''$.phone''',
                                                                          ))
                                                                      .toList()
                                                                      .map((e) =>
                                                                          e.toString())
                                                                      .toList(),
                                                              'driverLocationLatlong':
                                                                  FFAppState()
                                                                      .nearest5
                                                                      .map((e) =>
                                                                          getJsonField(
                                                                            e,
                                                                            r'''$.location''',
                                                                          ))
                                                                      .toList()
                                                                      .map((e) =>
                                                                          e.toString())
                                                                      .toList(),
                                                              'distance_cus_to_driver':
                                                                  FFAppState()
                                                                      .nearest5
                                                                      .map((e) =>
                                                                          getJsonField(
                                                                            e,
                                                                            r'''$.distance''',
                                                                          ))
                                                                      .toList()
                                                                      .map((e) =>
                                                                          e.toString())
                                                                      .toList(),
                                                            },
                                                          ),
                                                        }, rideRequestsRecordReference);
                                                        _model.resetQuery =
                                                            await queryRideRequestsRecordOnce(
                                                          queryBuilder: (rideRequestsRecord) =>
                                                              rideRequestsRecord
                                                                  .where(
                                                                    'customerId',
                                                                    isEqualTo:
                                                                        currentUserEmail,
                                                                  )
                                                                  .orderBy(
                                                                      'timestamp',
                                                                      descending:
                                                                          true),
                                                          singleRecord: true,
                                                        ).then((s) =>
                                                                s.firstOrNull);
                                                        for (int loop1Index = 0;
                                                            loop1Index <
                                                                _model
                                                                    .resetQuery!
                                                                    .driverId
                                                                    .length;
                                                            loop1Index++) {
                                                          final currentLoop1Item =
                                                              _model.resetQuery!
                                                                      .driverId[
                                                                  loop1Index];
                                                          _model.loginRead5neardriveronedocA =
                                                              await queryLoginRecordOnce(
                                                            queryBuilder: (loginRecord) =>
                                                                loginRecord
                                                                    .where(
                                                                      'Is_this_em_lift',
                                                                      isEqualTo: FFAppState().craneortaxi ==
                                                                              'taxi'
                                                                          ? true
                                                                          : false,
                                                                    )
                                                                    .where(
                                                                      'is_this_driver',
                                                                      isEqualTo: FFAppState().craneortaxi ==
                                                                              'crane'
                                                                          ? true
                                                                          : false,
                                                                    )
                                                                    .where(
                                                                      'email',
                                                                      isEqualTo:
                                                                          currentLoop1Item,
                                                                    )
                                                                    .orderBy(
                                                                        'created_time',
                                                                        descending:
                                                                            true),
                                                            singleRecord: true,
                                                          ).then((s) => s
                                                                  .firstOrNull);
                                                          if (_model
                                                                  .loginRead5neardriveronedocA !=
                                                              null) {
                                                            if (_model
                                                                    .loginRead5neardriveronedocA
                                                                    ?.lock ==
                                                                false) {
                                                              // Action 7-search

                                                              await _model
                                                                  .loginRead5neardriveronedocA!
                                                                  .reference
                                                                  .update(
                                                                      createLoginRecordData(
                                                                currentRideId:
                                                                    containerRideRequestsRecord
                                                                        ?.customerId,
                                                                status:
                                                                    'searching',
                                                                music: true,
                                                                lock: true,
                                                              ));
                                                              // Action 10/id-distance

                                                              await _model
                                                                  .loginRead5neardriveronedocA!
                                                                  .reference
                                                                  .update(
                                                                      createLoginRecordData(
                                                                customerDistance: _model
                                                                    .createdRide
                                                                    ?.distanceCusToDriver
                                                                    .elementAtOrNull(
                                                                        loop1Index),
                                                                iDRide: _model
                                                                    .createdRide
                                                                    ?.uid,
                                                                finishtime: functions
                                                                    .findfinishtime(
                                                                        buttonSystemDelayRecord
                                                                            ?.delay),
                                                              ));
                                                            }
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'docum not exisist??',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          }
                                                        }
                                                        if (FFAppState()
                                                                .craneortaxi ==
                                                            'crane') {
                                                          context.goNamed(
                                                              P2CustomerCranePageWidget
                                                                  .routeName);
                                                        } else {
                                                          context.goNamed(
                                                              P1CustomerTaxiPageWidget
                                                                  .routeName);
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'zwt3v7mz' /* Confirm your Order  */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xFFE2E3D4),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 4.0,
                                                        borderSide: BorderSide(
                                                          color: Colors.black,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
