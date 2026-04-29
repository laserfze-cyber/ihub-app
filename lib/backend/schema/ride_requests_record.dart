import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RideRequestsRecord extends FirestoreRecord {
  RideRequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "customerId" field.
  String? _customerId;
  String get customerId => _customerId ?? '';
  bool hasCustomerId() => _customerId != null;

  // "pickupAddress" field.
  String? _pickupAddress;
  String get pickupAddress => _pickupAddress ?? '';
  bool hasPickupAddress() => _pickupAddress != null;

  // "dropAddress" field.
  String? _dropAddress;
  String get dropAddress => _dropAddress ?? '';
  bool hasDropAddress() => _dropAddress != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "customerPhone" field.
  String? _customerPhone;
  String get customerPhone => _customerPhone ?? '';
  bool hasCustomerPhone() => _customerPhone != null;

  // "paymentStatus" field.
  bool? _paymentStatus;
  bool get paymentStatus => _paymentStatus ?? false;
  bool hasPaymentStatus() => _paymentStatus != null;

  // "tripStartTime" field.
  DateTime? _tripStartTime;
  DateTime? get tripStartTime => _tripStartTime;
  bool hasTripStartTime() => _tripStartTime != null;

  // "tripEndTime" field.
  DateTime? _tripEndTime;
  DateTime? get tripEndTime => _tripEndTime;
  bool hasTripEndTime() => _tripEndTime != null;

  // "driverId" field.
  List<String>? _driverId;
  List<String> get driverId => _driverId ?? const [];
  bool hasDriverId() => _driverId != null;

  // "dropLatlong" field.
  LatLng? _dropLatlong;
  LatLng? get dropLatlong => _dropLatlong;
  bool hasDropLatlong() => _dropLatlong != null;

  // "driverLocationLatlong" field.
  List<String>? _driverLocationLatlong;
  List<String> get driverLocationLatlong => _driverLocationLatlong ?? const [];
  bool hasDriverLocationLatlong() => _driverLocationLatlong != null;

  // "distanceKm" field.
  String? _distanceKm;
  String get distanceKm => _distanceKm ?? '';
  bool hasDistanceKm() => _distanceKm != null;

  // "driverPhone" field.
  List<String>? _driverPhone;
  List<String> get driverPhone => _driverPhone ?? const [];
  bool hasDriverPhone() => _driverPhone != null;

  // "etaMin" field.
  String? _etaMin;
  String get etaMin => _etaMin ?? '';
  bool hasEtaMin() => _etaMin != null;

  // "fareEstimate" field.
  String? _fareEstimate;
  String get fareEstimate => _fareEstimate ?? '';
  bool hasFareEstimate() => _fareEstimate != null;

  // "pickupLatlong" field.
  LatLng? _pickupLatlong;
  LatLng? get pickupLatlong => _pickupLatlong;
  bool hasPickupLatlong() => _pickupLatlong != null;

  // "distance_cus_to_driver" field.
  List<String>? _distanceCusToDriver;
  List<String> get distanceCusToDriver => _distanceCusToDriver ?? const [];
  bool hasDistanceCusToDriver() => _distanceCusToDriver != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "dropAddress_city" field.
  String? _dropAddressCity;
  String get dropAddressCity => _dropAddressCity ?? '';
  bool hasDropAddressCity() => _dropAddressCity != null;

  // "Who_take_the_order" field.
  String? _whoTakeTheOrder;
  String get whoTakeTheOrder => _whoTakeTheOrder ?? '';
  bool hasWhoTakeTheOrder() => _whoTakeTheOrder != null;

  // "Who_take_the_order_phone" field.
  String? _whoTakeTheOrderPhone;
  String get whoTakeTheOrderPhone => _whoTakeTheOrderPhone ?? '';
  bool hasWhoTakeTheOrderPhone() => _whoTakeTheOrderPhone != null;

  // "Who_take_the_order_distance" field.
  String? _whoTakeTheOrderDistance;
  String get whoTakeTheOrderDistance => _whoTakeTheOrderDistance ?? '';
  bool hasWhoTakeTheOrderDistance() => _whoTakeTheOrderDistance != null;

  // "Car_NO" field.
  String? _carNO;
  String get carNO => _carNO ?? '';
  bool hasCarNO() => _carNO != null;

  // "Car_type" field.
  String? _carType;
  String get carType => _carType ?? '';
  bool hasCarType() => _carType != null;

  // "Our_benefit" field.
  String? _ourBenefit;
  String get ourBenefit => _ourBenefit ?? '';
  bool hasOurBenefit() => _ourBenefit != null;

  // "Crane_or_taxi" field.
  String? _craneOrTaxi;
  String get craneOrTaxi => _craneOrTaxi ?? '';
  bool hasCraneOrTaxi() => _craneOrTaxi != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "iam_here" field.
  String? _iamHere;
  String get iamHere => _iamHere ?? '';
  bool hasIamHere() => _iamHere != null;

  void _initializeFields() {
    _customerId = snapshotData['customerId'] as String?;
    _pickupAddress = snapshotData['pickupAddress'] as String?;
    _dropAddress = snapshotData['dropAddress'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _customerPhone = snapshotData['customerPhone'] as String?;
    _paymentStatus = snapshotData['paymentStatus'] as bool?;
    _tripStartTime = snapshotData['tripStartTime'] as DateTime?;
    _tripEndTime = snapshotData['tripEndTime'] as DateTime?;
    _driverId = getDataList(snapshotData['driverId']);
    _dropLatlong = snapshotData['dropLatlong'] as LatLng?;
    _driverLocationLatlong = getDataList(snapshotData['driverLocationLatlong']);
    _distanceKm = snapshotData['distanceKm'] as String?;
    _driverPhone = getDataList(snapshotData['driverPhone']);
    _etaMin = snapshotData['etaMin'] as String?;
    _fareEstimate = snapshotData['fareEstimate'] as String?;
    _pickupLatlong = snapshotData['pickupLatlong'] as LatLng?;
    _distanceCusToDriver = getDataList(snapshotData['distance_cus_to_driver']);
    _status = snapshotData['status'] as String?;
    _dropAddressCity = snapshotData['dropAddress_city'] as String?;
    _whoTakeTheOrder = snapshotData['Who_take_the_order'] as String?;
    _whoTakeTheOrderPhone = snapshotData['Who_take_the_order_phone'] as String?;
    _whoTakeTheOrderDistance =
        snapshotData['Who_take_the_order_distance'] as String?;
    _carNO = snapshotData['Car_NO'] as String?;
    _carType = snapshotData['Car_type'] as String?;
    _ourBenefit = snapshotData['Our_benefit'] as String?;
    _craneOrTaxi = snapshotData['Crane_or_taxi'] as String?;
    _uid = snapshotData['uid'] as String?;
    _iamHere = snapshotData['iam_here'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Ride_requests');

  static Stream<RideRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RideRequestsRecord.fromSnapshot(s));

  static Future<RideRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RideRequestsRecord.fromSnapshot(s));

  static RideRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RideRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RideRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RideRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RideRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RideRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRideRequestsRecordData({
  String? customerId,
  String? pickupAddress,
  String? dropAddress,
  DateTime? timestamp,
  String? customerPhone,
  bool? paymentStatus,
  DateTime? tripStartTime,
  DateTime? tripEndTime,
  LatLng? dropLatlong,
  String? distanceKm,
  String? etaMin,
  String? fareEstimate,
  LatLng? pickupLatlong,
  String? status,
  String? dropAddressCity,
  String? whoTakeTheOrder,
  String? whoTakeTheOrderPhone,
  String? whoTakeTheOrderDistance,
  String? carNO,
  String? carType,
  String? ourBenefit,
  String? craneOrTaxi,
  String? uid,
  String? iamHere,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'customerId': customerId,
      'pickupAddress': pickupAddress,
      'dropAddress': dropAddress,
      'timestamp': timestamp,
      'customerPhone': customerPhone,
      'paymentStatus': paymentStatus,
      'tripStartTime': tripStartTime,
      'tripEndTime': tripEndTime,
      'dropLatlong': dropLatlong,
      'distanceKm': distanceKm,
      'etaMin': etaMin,
      'fareEstimate': fareEstimate,
      'pickupLatlong': pickupLatlong,
      'status': status,
      'dropAddress_city': dropAddressCity,
      'Who_take_the_order': whoTakeTheOrder,
      'Who_take_the_order_phone': whoTakeTheOrderPhone,
      'Who_take_the_order_distance': whoTakeTheOrderDistance,
      'Car_NO': carNO,
      'Car_type': carType,
      'Our_benefit': ourBenefit,
      'Crane_or_taxi': craneOrTaxi,
      'uid': uid,
      'iam_here': iamHere,
    }.withoutNulls,
  );

  return firestoreData;
}

class RideRequestsRecordDocumentEquality
    implements Equality<RideRequestsRecord> {
  const RideRequestsRecordDocumentEquality();

  @override
  bool equals(RideRequestsRecord? e1, RideRequestsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.customerId == e2?.customerId &&
        e1?.pickupAddress == e2?.pickupAddress &&
        e1?.dropAddress == e2?.dropAddress &&
        e1?.timestamp == e2?.timestamp &&
        e1?.customerPhone == e2?.customerPhone &&
        e1?.paymentStatus == e2?.paymentStatus &&
        e1?.tripStartTime == e2?.tripStartTime &&
        e1?.tripEndTime == e2?.tripEndTime &&
        listEquality.equals(e1?.driverId, e2?.driverId) &&
        e1?.dropLatlong == e2?.dropLatlong &&
        listEquality.equals(
            e1?.driverLocationLatlong, e2?.driverLocationLatlong) &&
        e1?.distanceKm == e2?.distanceKm &&
        listEquality.equals(e1?.driverPhone, e2?.driverPhone) &&
        e1?.etaMin == e2?.etaMin &&
        e1?.fareEstimate == e2?.fareEstimate &&
        e1?.pickupLatlong == e2?.pickupLatlong &&
        listEquality.equals(e1?.distanceCusToDriver, e2?.distanceCusToDriver) &&
        e1?.status == e2?.status &&
        e1?.dropAddressCity == e2?.dropAddressCity &&
        e1?.whoTakeTheOrder == e2?.whoTakeTheOrder &&
        e1?.whoTakeTheOrderPhone == e2?.whoTakeTheOrderPhone &&
        e1?.whoTakeTheOrderDistance == e2?.whoTakeTheOrderDistance &&
        e1?.carNO == e2?.carNO &&
        e1?.carType == e2?.carType &&
        e1?.ourBenefit == e2?.ourBenefit &&
        e1?.craneOrTaxi == e2?.craneOrTaxi &&
        e1?.uid == e2?.uid &&
        e1?.iamHere == e2?.iamHere;
  }

  @override
  int hash(RideRequestsRecord? e) => const ListEquality().hash([
        e?.customerId,
        e?.pickupAddress,
        e?.dropAddress,
        e?.timestamp,
        e?.customerPhone,
        e?.paymentStatus,
        e?.tripStartTime,
        e?.tripEndTime,
        e?.driverId,
        e?.dropLatlong,
        e?.driverLocationLatlong,
        e?.distanceKm,
        e?.driverPhone,
        e?.etaMin,
        e?.fareEstimate,
        e?.pickupLatlong,
        e?.distanceCusToDriver,
        e?.status,
        e?.dropAddressCity,
        e?.whoTakeTheOrder,
        e?.whoTakeTheOrderPhone,
        e?.whoTakeTheOrderDistance,
        e?.carNO,
        e?.carType,
        e?.ourBenefit,
        e?.craneOrTaxi,
        e?.uid,
        e?.iamHere
      ]);

  @override
  bool isValidKey(Object? o) => o is RideRequestsRecord;
}
