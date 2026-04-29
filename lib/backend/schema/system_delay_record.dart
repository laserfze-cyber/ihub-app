import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SystemDelayRecord extends FirestoreRecord {
  SystemDelayRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Delay" field.
  int? _delay;
  int get delay => _delay ?? 0;
  bool hasDelay() => _delay != null;

  void _initializeFields() {
    _delay = castToType<int>(snapshotData['Delay']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('System_Delay');

  static Stream<SystemDelayRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SystemDelayRecord.fromSnapshot(s));

  static Future<SystemDelayRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SystemDelayRecord.fromSnapshot(s));

  static SystemDelayRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SystemDelayRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SystemDelayRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SystemDelayRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SystemDelayRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SystemDelayRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSystemDelayRecordData({
  int? delay,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Delay': delay,
    }.withoutNulls,
  );

  return firestoreData;
}

class SystemDelayRecordDocumentEquality implements Equality<SystemDelayRecord> {
  const SystemDelayRecordDocumentEquality();

  @override
  bool equals(SystemDelayRecord? e1, SystemDelayRecord? e2) {
    return e1?.delay == e2?.delay;
  }

  @override
  int hash(SystemDelayRecord? e) => const ListEquality().hash([e?.delay]);

  @override
  bool isValidKey(Object? o) => o is SystemDelayRecord;
}
