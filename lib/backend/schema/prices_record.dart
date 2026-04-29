import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PricesRecord extends FirestoreRecord {
  PricesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Taxi_starting_price" field.
  int? _taxiStartingPrice;
  int get taxiStartingPrice => _taxiStartingPrice ?? 0;
  bool hasTaxiStartingPrice() => _taxiStartingPrice != null;

  // "Tax_price_per_KM" field.
  double? _taxPricePerKM;
  double get taxPricePerKM => _taxPricePerKM ?? 0.0;
  bool hasTaxPricePerKM() => _taxPricePerKM != null;

  // "Crane_starting_price" field.
  int? _craneStartingPrice;
  int get craneStartingPrice => _craneStartingPrice ?? 0;
  bool hasCraneStartingPrice() => _craneStartingPrice != null;

  // "Crane_price_per_KM" field.
  double? _cranePricePerKM;
  double get cranePricePerKM => _cranePricePerKM ?? 0.0;
  bool hasCranePricePerKM() => _cranePricePerKM != null;

  // "Country_App" field.
  String? _countryApp;
  String get countryApp => _countryApp ?? '';
  bool hasCountryApp() => _countryApp != null;

  void _initializeFields() {
    _taxiStartingPrice = castToType<int>(snapshotData['Taxi_starting_price']);
    _taxPricePerKM = castToType<double>(snapshotData['Tax_price_per_KM']);
    _craneStartingPrice = castToType<int>(snapshotData['Crane_starting_price']);
    _cranePricePerKM = castToType<double>(snapshotData['Crane_price_per_KM']);
    _countryApp = snapshotData['Country_App'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('prices');

  static Stream<PricesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PricesRecord.fromSnapshot(s));

  static Future<PricesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PricesRecord.fromSnapshot(s));

  static PricesRecord fromSnapshot(DocumentSnapshot snapshot) => PricesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PricesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PricesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PricesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PricesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPricesRecordData({
  int? taxiStartingPrice,
  double? taxPricePerKM,
  int? craneStartingPrice,
  double? cranePricePerKM,
  String? countryApp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Taxi_starting_price': taxiStartingPrice,
      'Tax_price_per_KM': taxPricePerKM,
      'Crane_starting_price': craneStartingPrice,
      'Crane_price_per_KM': cranePricePerKM,
      'Country_App': countryApp,
    }.withoutNulls,
  );

  return firestoreData;
}

class PricesRecordDocumentEquality implements Equality<PricesRecord> {
  const PricesRecordDocumentEquality();

  @override
  bool equals(PricesRecord? e1, PricesRecord? e2) {
    return e1?.taxiStartingPrice == e2?.taxiStartingPrice &&
        e1?.taxPricePerKM == e2?.taxPricePerKM &&
        e1?.craneStartingPrice == e2?.craneStartingPrice &&
        e1?.cranePricePerKM == e2?.cranePricePerKM &&
        e1?.countryApp == e2?.countryApp;
  }

  @override
  int hash(PricesRecord? e) => const ListEquality().hash([
        e?.taxiStartingPrice,
        e?.taxPricePerKM,
        e?.craneStartingPrice,
        e?.cranePricePerKM,
        e?.countryApp
      ]);

  @override
  bool isValidKey(Object? o) => o is PricesRecord;
}
