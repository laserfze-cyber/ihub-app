import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Token = prefs.getString('ff_Token') ?? _Token;
    });
    _safeInit(() {
      _Appcountry = prefs.getString('ff_Appcountry') ?? _Appcountry;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  LatLng? _latandlng;
  LatLng? get latandlng => _latandlng;
  set latandlng(LatLng? value) {
    _latandlng = value;
  }

  String _Adminemail = '';
  String get Adminemail => _Adminemail;
  set Adminemail(String value) {
    _Adminemail = value;
  }

  String _driverphone = '';
  String get driverphone => _driverphone;
  set driverphone(String value) {
    _driverphone = value;
  }

  String _driverwhats = '';
  String get driverwhats => _driverwhats;
  set driverwhats(String value) {
    _driverwhats = value;
  }

  String _uid = '';
  String get uid => _uid;
  set uid(String value) {
    _uid = value;
  }

  String _responseimageurlstring = '';
  String get responseimageurlstring => _responseimageurlstring;
  set responseimageurlstring(String value) {
    _responseimageurlstring = value;
  }

  String _responseimageurl = '';
  String get responseimageurl => _responseimageurl;
  set responseimageurl(String value) {
    _responseimageurl = value;
  }

  bool _thisisadriver = false;
  bool get thisisadriver => _thisisadriver;
  set thisisadriver(bool value) {
    _thisisadriver = value;
  }

  LatLng? _firstlocation;
  LatLng? get firstlocation => _firstlocation;
  set firstlocation(LatLng? value) {
    _firstlocation = value;
  }

  String _Token = '';
  String get Token => _Token;
  set Token(String value) {
    _Token = value;
    prefs.setString('ff_Token', value);
  }

  LatLng? _latandlngCustomerdistination;
  LatLng? get latandlngCustomerdistination => _latandlngCustomerdistination;
  set latandlngCustomerdistination(LatLng? value) {
    _latandlngCustomerdistination = value;
  }

  String _City = '';
  String get City => _City;
  set City(String value) {
    _City = value;
  }

  String _Area = '';
  String get Area => _Area;
  set Area(String value) {
    _Area = value;
  }

  String _origin = '';
  String get origin => _origin;
  set origin(String value) {
    _origin = value;
  }

  String _destination = '';
  String get destination => _destination;
  set destination(String value) {
    _destination = value;
  }

  String _apigeo = '';
  String get apigeo => _apigeo;
  set apigeo(String value) {
    _apigeo = value;
  }

  String _Distance = '';
  String get Distance => _Distance;
  set Distance(String value) {
    _Distance = value;
  }

  String _Duration = '';
  String get Duration => _Duration;
  set Duration(String value) {
    _Duration = value;
  }

  String _ESTprice = '';
  String get ESTprice => _ESTprice;
  set ESTprice(String value) {
    _ESTprice = value;
  }

  String _Totalprice = '';
  String get Totalprice => _Totalprice;
  set Totalprice(String value) {
    _Totalprice = value;
  }

  LatLng? _origingpoint;
  LatLng? get origingpoint => _origingpoint;
  set origingpoint(LatLng? value) {
    _origingpoint = value;
  }

  List<dynamic> _nearest5 = [];
  List<dynamic> get nearest5 => _nearest5;
  set nearest5(List<dynamic> value) {
    _nearest5 = value;
  }

  void addToNearest5(dynamic value) {
    nearest5.add(value);
  }

  void removeFromNearest5(dynamic value) {
    nearest5.remove(value);
  }

  void removeAtIndexFromNearest5(int index) {
    nearest5.removeAt(index);
  }

  void updateNearest5AtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    nearest5[index] = updateFn(_nearest5[index]);
  }

  void insertAtIndexInNearest5(int index, dynamic value) {
    nearest5.insert(index, value);
  }

  List<String> _driverstatus = [
    'searching',
    'accepted',
    'arriving',
    'on_trip',
    'completed',
    'cancelled'
  ];
  List<String> get driverstatus => _driverstatus;
  set driverstatus(List<String> value) {
    _driverstatus = value;
  }

  void addToDriverstatus(String value) {
    driverstatus.add(value);
  }

  void removeFromDriverstatus(String value) {
    driverstatus.remove(value);
  }

  void removeAtIndexFromDriverstatus(int index) {
    driverstatus.removeAt(index);
  }

  void updateDriverstatusAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    driverstatus[index] = updateFn(_driverstatus[index]);
  }

  void insertAtIndexInDriverstatus(int index, String value) {
    driverstatus.insert(index, value);
  }

  String _distancetodriver = '';
  String get distancetodriver => _distancetodriver;
  set distancetodriver(String value) {
    _distancetodriver = value;
  }

  int _indexdistancetodriver = 0;
  int get indexdistancetodriver => _indexdistancetodriver;
  set indexdistancetodriver(int value) {
    _indexdistancetodriver = value;
  }

  int _Systemdelay = 0;
  int get Systemdelay => _Systemdelay;
  set Systemdelay(int value) {
    _Systemdelay = value;
  }

  String _craneortaxi = '';
  String get craneortaxi => _craneortaxi;
  set craneortaxi(String value) {
    _craneortaxi = value;
  }

  String _Initialprice = '';
  String get Initialprice => _Initialprice;
  set Initialprice(String value) {
    _Initialprice = value;
  }

  double _Deposit = 0.0;
  double get Deposit => _Deposit;
  set Deposit(double value) {
    _Deposit = value;
  }

  String _ourbenifit = '';
  String get ourbenifit => _ourbenifit;
  set ourbenifit(String value) {
    _ourbenifit = value;
  }

  String _Appcountry = '';
  String get Appcountry => _Appcountry;
  set Appcountry(String value) {
    _Appcountry = value;
    prefs.setString('ff_Appcountry', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
