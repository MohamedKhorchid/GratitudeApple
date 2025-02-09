import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GratitudesRecord extends FirestoreRecord {
  GratitudesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "userid" field.
  String? _userid;
  String get userid => _userid ?? '';
  bool hasUserid() => _userid != null;

  // "gratitude5" field.
  String? _gratitude5;
  String get gratitude5 => _gratitude5 ?? '';
  bool hasGratitude5() => _gratitude5 != null;

  // "gratitude4" field.
  String? _gratitude4;
  String get gratitude4 => _gratitude4 ?? '';
  bool hasGratitude4() => _gratitude4 != null;

  // "gratitude3" field.
  String? _gratitude3;
  String get gratitude3 => _gratitude3 ?? '';
  bool hasGratitude3() => _gratitude3 != null;

  // "gratitude2" field.
  String? _gratitude2;
  String get gratitude2 => _gratitude2 ?? '';
  bool hasGratitude2() => _gratitude2 != null;

  // "gratitude1" field.
  String? _gratitude1;
  String get gratitude1 => _gratitude1 ?? '';
  bool hasGratitude1() => _gratitude1 != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _userid = snapshotData['userid'] as String?;
    _gratitude5 = snapshotData['gratitude5'] as String?;
    _gratitude4 = snapshotData['gratitude4'] as String?;
    _gratitude3 = snapshotData['gratitude3'] as String?;
    _gratitude2 = snapshotData['gratitude2'] as String?;
    _gratitude1 = snapshotData['gratitude1'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gratitudes');

  static Stream<GratitudesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GratitudesRecord.fromSnapshot(s));

  static Future<GratitudesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GratitudesRecord.fromSnapshot(s));

  static GratitudesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GratitudesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GratitudesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GratitudesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GratitudesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GratitudesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGratitudesRecordData({
  DateTime? date,
  String? userid,
  String? gratitude5,
  String? gratitude4,
  String? gratitude3,
  String? gratitude2,
  String? gratitude1,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'userid': userid,
      'gratitude5': gratitude5,
      'gratitude4': gratitude4,
      'gratitude3': gratitude3,
      'gratitude2': gratitude2,
      'gratitude1': gratitude1,
    }.withoutNulls,
  );

  return firestoreData;
}

class GratitudesRecordDocumentEquality implements Equality<GratitudesRecord> {
  const GratitudesRecordDocumentEquality();

  @override
  bool equals(GratitudesRecord? e1, GratitudesRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.userid == e2?.userid &&
        e1?.gratitude5 == e2?.gratitude5 &&
        e1?.gratitude4 == e2?.gratitude4 &&
        e1?.gratitude3 == e2?.gratitude3 &&
        e1?.gratitude2 == e2?.gratitude2 &&
        e1?.gratitude1 == e2?.gratitude1;
  }

  @override
  int hash(GratitudesRecord? e) => const ListEquality().hash([
        e?.date,
        e?.userid,
        e?.gratitude5,
        e?.gratitude4,
        e?.gratitude3,
        e?.gratitude2,
        e?.gratitude1
      ]);

  @override
  bool isValidKey(Object? o) => o is GratitudesRecord;
}
