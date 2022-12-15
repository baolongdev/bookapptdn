import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'archive_is_reading_struct.g.dart';

abstract class ArchiveIsReadingStruct
    implements Built<ArchiveIsReadingStruct, ArchiveIsReadingStructBuilder> {
  static Serializer<ArchiveIsReadingStruct> get serializer =>
      _$archiveIsReadingStructSerializer;

  BuiltList<String>? get id;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(ArchiveIsReadingStructBuilder builder) =>
      builder
        ..id = ListBuilder()
        ..firestoreUtilData = FirestoreUtilData();

  ArchiveIsReadingStruct._();
  factory ArchiveIsReadingStruct(
          [void Function(ArchiveIsReadingStructBuilder) updates]) =
      _$ArchiveIsReadingStruct;
}

ArchiveIsReadingStruct createArchiveIsReadingStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ArchiveIsReadingStruct(
      (a) => a
        ..id = null
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

ArchiveIsReadingStruct? updateArchiveIsReadingStruct(
  ArchiveIsReadingStruct? archiveIsReading, {
  bool clearUnsetFields = true,
}) =>
    archiveIsReading != null
        ? (archiveIsReading.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addArchiveIsReadingStructData(
  Map<String, dynamic> firestoreData,
  ArchiveIsReadingStruct? archiveIsReading,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (archiveIsReading == null) {
    return;
  }
  if (archiveIsReading.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && archiveIsReading.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final archiveIsReadingData =
      getArchiveIsReadingFirestoreData(archiveIsReading, forFieldValue);
  final nestedData =
      archiveIsReadingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = archiveIsReading.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getArchiveIsReadingFirestoreData(
  ArchiveIsReadingStruct? archiveIsReading, [
  bool forFieldValue = false,
]) {
  if (archiveIsReading == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(
      ArchiveIsReadingStruct.serializer, archiveIsReading);

  // Add any Firestore field values
  archiveIsReading.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getArchiveIsReadingListFirestoreData(
  List<ArchiveIsReadingStruct>? archiveIsReadings,
) =>
    archiveIsReadings
        ?.map((a) => getArchiveIsReadingFirestoreData(a, true))
        .toList() ??
    [];
