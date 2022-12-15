import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'archiver_record.g.dart';

abstract class ArchiverRecord
    implements Built<ArchiverRecord, ArchiverRecordBuilder> {
  static Serializer<ArchiverRecord> get serializer =>
      _$archiverRecordSerializer;

  @BuiltValueField(wireName: 'ArchiveRead')
  ArchiveReadStruct get archiveRead;

  @BuiltValueField(wireName: 'ArchiveReading')
  ArchiveIsReadingStruct get archiveReading;

  @BuiltValueField(wireName: 'ArchiveWantToRead')
  ArchiveWantToReadStruct get archiveWantToRead;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ArchiverRecordBuilder builder) => builder
    ..archiveRead = ArchiveReadStructBuilder()
    ..archiveReading = ArchiveIsReadingStructBuilder()
    ..archiveWantToRead = ArchiveWantToReadStructBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Archiver');

  static Stream<ArchiverRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ArchiverRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ArchiverRecord._();
  factory ArchiverRecord([void Function(ArchiverRecordBuilder) updates]) =
      _$ArchiverRecord;

  static ArchiverRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createArchiverRecordData({
  ArchiveReadStruct? archiveRead,
  ArchiveIsReadingStruct? archiveReading,
  ArchiveWantToReadStruct? archiveWantToRead,
}) {
  final firestoreData = serializers.toFirestore(
    ArchiverRecord.serializer,
    ArchiverRecord(
      (a) => a
        ..archiveRead = ArchiveReadStructBuilder()
        ..archiveReading = ArchiveIsReadingStructBuilder()
        ..archiveWantToRead = ArchiveWantToReadStructBuilder(),
    ),
  );

  // Handle nested data for "ArchiveRead" field.
  addArchiveReadStructData(firestoreData, archiveRead, 'ArchiveRead');

  // Handle nested data for "ArchiveReading" field.
  addArchiveIsReadingStructData(
      firestoreData, archiveReading, 'ArchiveReading');

  // Handle nested data for "ArchiveWantToRead" field.
  addArchiveWantToReadStructData(
      firestoreData, archiveWantToRead, 'ArchiveWantToRead');

  return firestoreData;
}
