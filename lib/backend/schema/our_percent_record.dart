import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OurPercentRecord extends FirestoreRecord {
  OurPercentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Pricepercent" field.
  double? _pricepercent;
  double get pricepercent => _pricepercent ?? 0.0;
  bool hasPricepercent() => _pricepercent != null;

  void _initializeFields() {
    _pricepercent = castToType<double>(snapshotData['Pricepercent']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('our-percent');

  static Stream<OurPercentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OurPercentRecord.fromSnapshot(s));

  static Future<OurPercentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OurPercentRecord.fromSnapshot(s));

  static OurPercentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OurPercentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OurPercentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OurPercentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OurPercentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OurPercentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOurPercentRecordData({
  double? pricepercent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Pricepercent': pricepercent,
    }.withoutNulls,
  );

  return firestoreData;
}

class OurPercentRecordDocumentEquality implements Equality<OurPercentRecord> {
  const OurPercentRecordDocumentEquality();

  @override
  bool equals(OurPercentRecord? e1, OurPercentRecord? e2) {
    return e1?.pricepercent == e2?.pricepercent;
  }

  @override
  int hash(OurPercentRecord? e) => const ListEquality().hash([e?.pricepercent]);

  @override
  bool isValidKey(Object? o) => o is OurPercentRecord;
}
