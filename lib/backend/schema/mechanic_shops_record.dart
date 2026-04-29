import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MechanicShopsRecord extends FirestoreRecord {
  MechanicShopsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "shop_name" field.
  String? _shopName;
  String get shopName => _shopName ?? '';
  bool hasShopName() => _shopName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "Details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "Specialist" field.
  String? _specialist;
  String get specialist => _specialist ?? '';
  bool hasSpecialist() => _specialist != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "ADV_end_time" field.
  String? _aDVEndTime;
  String get aDVEndTime => _aDVEndTime ?? '';
  bool hasADVEndTime() => _aDVEndTime != null;

  // "ADV_time_remain" field.
  String? _aDVTimeRemain;
  String get aDVTimeRemain => _aDVTimeRemain ?? '';
  bool hasADVTimeRemain() => _aDVTimeRemain != null;

  // "Payment_verification" field.
  bool? _paymentVerification;
  bool get paymentVerification => _paymentVerification ?? false;
  bool hasPaymentVerification() => _paymentVerification != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "whats" field.
  String? _whats;
  String get whats => _whats ?? '';
  bool hasWhats() => _whats != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _shopName = snapshotData['shop_name'] as String?;
    _email = snapshotData['email'] as String?;
    _details = snapshotData['Details'] as String?;
    _specialist = snapshotData['Specialist'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _aDVEndTime = snapshotData['ADV_end_time'] as String?;
    _aDVTimeRemain = snapshotData['ADV_time_remain'] as String?;
    _paymentVerification = snapshotData['Payment_verification'] as bool?;
    _phone = snapshotData['phone'] as String?;
    _whats = snapshotData['whats'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Mechanic_shops');

  static Stream<MechanicShopsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MechanicShopsRecord.fromSnapshot(s));

  static Future<MechanicShopsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MechanicShopsRecord.fromSnapshot(s));

  static MechanicShopsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MechanicShopsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MechanicShopsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MechanicShopsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MechanicShopsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MechanicShopsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMechanicShopsRecordData({
  String? shopName,
  String? email,
  String? details,
  String? specialist,
  DateTime? createdTime,
  String? aDVEndTime,
  String? aDVTimeRemain,
  bool? paymentVerification,
  String? phone,
  String? whats,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'shop_name': shopName,
      'email': email,
      'Details': details,
      'Specialist': specialist,
      'created_time': createdTime,
      'ADV_end_time': aDVEndTime,
      'ADV_time_remain': aDVTimeRemain,
      'Payment_verification': paymentVerification,
      'phone': phone,
      'whats': whats,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class MechanicShopsRecordDocumentEquality
    implements Equality<MechanicShopsRecord> {
  const MechanicShopsRecordDocumentEquality();

  @override
  bool equals(MechanicShopsRecord? e1, MechanicShopsRecord? e2) {
    return e1?.shopName == e2?.shopName &&
        e1?.email == e2?.email &&
        e1?.details == e2?.details &&
        e1?.specialist == e2?.specialist &&
        e1?.createdTime == e2?.createdTime &&
        e1?.aDVEndTime == e2?.aDVEndTime &&
        e1?.aDVTimeRemain == e2?.aDVTimeRemain &&
        e1?.paymentVerification == e2?.paymentVerification &&
        e1?.phone == e2?.phone &&
        e1?.whats == e2?.whats &&
        e1?.image == e2?.image;
  }

  @override
  int hash(MechanicShopsRecord? e) => const ListEquality().hash([
        e?.shopName,
        e?.email,
        e?.details,
        e?.specialist,
        e?.createdTime,
        e?.aDVEndTime,
        e?.aDVTimeRemain,
        e?.paymentVerification,
        e?.phone,
        e?.whats,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is MechanicShopsRecord;
}
