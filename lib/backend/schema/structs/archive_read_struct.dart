import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'archive_read_struct.g.dart';

abstract class ArchiveReadStruct
    implements Built<ArchiveReadStruct, ArchiveReadStructBuilder> {
  static Serializer<ArchiveReadStruct> get serializer =>
      _$archiveReadStructSerializer;

  BuiltList<String>? get id;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(ArchiveReadStructBuilder builder) => builder
    ..id = ListBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  ArchiveReadStruct._();
  factory ArchiveReadStruct([void Function(ArchiveReadStructBuilder) updates]) =
      _$ArchiveReadStruct;
}

ArchiveReadStruct createArchiveReadStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ArchiveReadStruct(
      (a) => a
        ..id = null
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

ArchiveReadStruct? updateArchiveReadStruct(
  ArchiveReadStruct? archiveRead, {
  bool clearUnsetFields = true,
}) =>
    archiveRead != null
        ? (archiveRead.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addArchiveReadStructData(
  Map<String, dynamic> firestoreData,
  ArchiveReadStruct? archiveRead,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (archiveRead == null) {
    return;
  }
  if (archiveRead.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && archiveRead.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final archiveReadData =
      getArchiveReadFirestoreData(archiveRead, forFieldValue);
  final nestedData =
      archiveReadData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = archiveRead.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getArchiveReadFirestoreData(
  ArchiveReadStruct? archiveRead, [
  bool forFieldValue = false,
]) {
  if (archiveRead == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(ArchiveReadStruct.serializer, archiveRead);

  // Add any Firestore field values
  archiveRead.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getArchiveReadListFirestoreData(
  List<ArchiveReadStruct>? archiveReads,
) =>
    archiveReads?.map((a) => getArchiveReadFirestoreData(a, true)).toList() ??
    [];
