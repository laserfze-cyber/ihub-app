import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LoginRecord extends FirestoreRecord {
  LoginRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "latlong" field.
  LatLng? _latlong;
  LatLng? get latlong => _latlong;
  bool hasLatlong() => _latlong != null;

  // "whats" field.
  String? _whats;
  String get whats => _whats ?? '';
  bool hasWhats() => _whats != null;

  // "Payment_verification" field.
  bool? _paymentVerification;
  bool get paymentVerification => _paymentVerification ?? false;
  bool hasPaymentVerification() => _paymentVerification != null;

  // "ADV_time_remain" field.
  String? _aDVTimeRemain;
  String get aDVTimeRemain => _aDVTimeRemain ?? '';
  bool hasADVTimeRemain() => _aDVTimeRemain != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "driver_on_off" field.
  bool? _driverOnOff;
  bool get driverOnOff => _driverOnOff ?? false;
  bool hasDriverOnOff() => _driverOnOff != null;

  // "ADV_end_time" field.
  String? _aDVEndTime;
  String get aDVEndTime => _aDVEndTime ?? '';
  bool hasADVEndTime() => _aDVEndTime != null;

  // "is_this_driver" field.
  bool? _isThisDriver;
  bool get isThisDriver => _isThisDriver ?? false;
  bool hasIsThisDriver() => _isThisDriver != null;

  // "Is_this_em_lift" field.
  bool? _isThisEmLift;
  bool get isThisEmLift => _isThisEmLift ?? false;
  bool hasIsThisEmLift() => _isThisEmLift != null;

  // "Token" field.
  String? _token;
  String get token => _token ?? '';
  bool hasToken() => _token != null;

  // "currentRideId" field.
  String? _currentRideId;
  String get currentRideId => _currentRideId ?? '';
  bool hasCurrentRideId() => _currentRideId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "music" field.
  bool? _music;
  bool get music => _music ?? false;
  bool hasMusic() => _music != null;

  // "lock" field.
  bool? _lock;
  bool get lock => _lock ?? false;
  bool hasLock() => _lock != null;

  // "Customer_distance" field.
  String? _customerDistance;
  String get customerDistance => _customerDistance ?? '';
  bool hasCustomerDistance() => _customerDistance != null;

  // "Order_time" field.
  DateTime? _orderTime;
  DateTime? get orderTime => _orderTime;
  bool hasOrderTime() => _orderTime != null;

  // "Order_Dismiss_time" field.
  DateTime? _orderDismissTime;
  DateTime? get orderDismissTime => _orderDismissTime;
  bool hasOrderDismissTime() => _orderDismissTime != null;

  // "Car_NO" field.
  String? _carNO;
  String get carNO => _carNO ?? '';
  bool hasCarNO() => _carNO != null;

  // "Car_type" field.
  String? _carType;
  String get carType => _carType ?? '';
  bool hasCarType() => _carType != null;

  // "Country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "ID_Ride" field.
  String? _iDRide;
  String get iDRide => _iDRide ?? '';
  bool hasIDRide() => _iDRide != null;

  // "finishtime" field.
  DateTime? _finishtime;
  DateTime? get finishtime => _finishtime;
  bool hasFinishtime() => _finishtime != null;

  // "Driver_deposit" field.
  double? _driverDeposit;
  double get driverDeposit => _driverDeposit ?? 0.0;
  bool hasDriverDeposit() => _driverDeposit != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _latlong = snapshotData['latlong'] as LatLng?;
    _whats = snapshotData['whats'] as String?;
    _paymentVerification = snapshotData['Payment_verification'] as bool?;
    _aDVTimeRemain = snapshotData['ADV_time_remain'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _driverOnOff = snapshotData['driver_on_off'] as bool?;
    _aDVEndTime = snapshotData['ADV_end_time'] as String?;
    _isThisDriver = snapshotData['is_this_driver'] as bool?;
    _isThisEmLift = snapshotData['Is_this_em_lift'] as bool?;
    _token = snapshotData['Token'] as String?;
    _currentRideId = snapshotData['currentRideId'] as String?;
    _status = snapshotData['status'] as String?;
    _music = snapshotData['music'] as bool?;
    _lock = snapshotData['lock'] as bool?;
    _customerDistance = snapshotData['Customer_distance'] as String?;
    _orderTime = snapshotData['Order_time'] as DateTime?;
    _orderDismissTime = snapshotData['Order_Dismiss_time'] as DateTime?;
    _carNO = snapshotData['Car_NO'] as String?;
    _carType = snapshotData['Car_type'] as String?;
    _country = snapshotData['Country'] as String?;
    _iDRide = snapshotData['ID_Ride'] as String?;
    _finishtime = snapshotData['finishtime'] as DateTime?;
    _driverDeposit = castToType<double>(snapshotData['Driver_deposit']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('LOGIN');

  static Stream<LoginRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LoginRecord.fromSnapshot(s));

  static Future<LoginRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LoginRecord.fromSnapshot(s));

  static LoginRecord fromSnapshot(DocumentSnapshot snapshot) => LoginRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LoginRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LoginRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LoginRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LoginRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLoginRecordData({
  String? email,
  String? displayName,
  String? phoneNumber,
  String? uid,
  DateTime? createdTime,
  LatLng? latlong,
  String? whats,
  bool? paymentVerification,
  String? aDVTimeRemain,
  String? photoUrl,
  bool? driverOnOff,
  String? aDVEndTime,
  bool? isThisDriver,
  bool? isThisEmLift,
  String? token,
  String? currentRideId,
  String? status,
  bool? music,
  bool? lock,
  String? customerDistance,
  DateTime? orderTime,
  DateTime? orderDismissTime,
  String? carNO,
  String? carType,
  String? country,
  String? iDRide,
  DateTime? finishtime,
  double? driverDeposit,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'phone_number': phoneNumber,
      'uid': uid,
      'created_time': createdTime,
      'latlong': latlong,
      'whats': whats,
      'Payment_verification': paymentVerification,
      'ADV_time_remain': aDVTimeRemain,
      'photo_url': photoUrl,
      'driver_on_off': driverOnOff,
      'ADV_end_time': aDVEndTime,
      'is_this_driver': isThisDriver,
      'Is_this_em_lift': isThisEmLift,
      'Token': token,
      'currentRideId': currentRideId,
      'status': status,
      'music': music,
      'lock': lock,
      'Customer_distance': customerDistance,
      'Order_time': orderTime,
      'Order_Dismiss_time': orderDismissTime,
      'Car_NO': carNO,
      'Car_type': carType,
      'Country': country,
      'ID_Ride': iDRide,
      'finishtime': finishtime,
      'Driver_deposit': driverDeposit,
    }.withoutNulls,
  );

  return firestoreData;
}

class LoginRecordDocumentEquality implements Equality<LoginRecord> {
  const LoginRecordDocumentEquality();

  @override
  bool equals(LoginRecord? e1, LoginRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.latlong == e2?.latlong &&
        e1?.whats == e2?.whats &&
        e1?.paymentVerification == e2?.paymentVerification &&
        e1?.aDVTimeRemain == e2?.aDVTimeRemain &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.driverOnOff == e2?.driverOnOff &&
        e1?.aDVEndTime == e2?.aDVEndTime &&
        e1?.isThisDriver == e2?.isThisDriver &&
        e1?.isThisEmLift == e2?.isThisEmLift &&
        e1?.token == e2?.token &&
        e1?.currentRideId == e2?.currentRideId &&
        e1?.status == e2?.status &&
        e1?.music == e2?.music &&
        e1?.lock == e2?.lock &&
        e1?.customerDistance == e2?.customerDistance &&
        e1?.orderTime == e2?.orderTime &&
        e1?.orderDismissTime == e2?.orderDismissTime &&
        e1?.carNO == e2?.carNO &&
        e1?.carType == e2?.carType &&
        e1?.country == e2?.country &&
        e1?.iDRide == e2?.iDRide &&
        e1?.finishtime == e2?.finishtime &&
        e1?.driverDeposit == e2?.driverDeposit;
  }

  @override
  int hash(LoginRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.phoneNumber,
        e?.uid,
        e?.createdTime,
        e?.latlong,
        e?.whats,
        e?.paymentVerification,
        e?.aDVTimeRemain,
        e?.photoUrl,
        e?.driverOnOff,
        e?.aDVEndTime,
        e?.isThisDriver,
        e?.isThisEmLift,
        e?.token,
        e?.currentRideId,
        e?.status,
        e?.music,
        e?.lock,
        e?.customerDistance,
        e?.orderTime,
        e?.orderDismissTime,
        e?.carNO,
        e?.carType,
        e?.country,
        e?.iDRide,
        e?.finishtime,
        e?.driverDeposit
      ]);

  @override
  bool isValidKey(Object? o) => o is LoginRecord;
}
