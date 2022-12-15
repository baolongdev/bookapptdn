import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'archive_want_to_read_struct.g.dart';

abstract class ArchiveWantToReadStruct
    implements Built<ArchiveWantToReadStruct, ArchiveWantToReadStructBuilder> {
  static Serializer<ArchiveWantToReadStruct> get serializer =>
      _$archiveWantToReadStructSerializer;

  BuiltList<String>? get id;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(ArchiveWantToReadStructBuilder builder) =>
      builder
        ..id = ListBuilder()
        ..firestoreUtilData = FirestoreUtilData();

  ArchiveWantToReadStruct._();
  factory ArchiveWantToReadStruct(
          [void Function(ArchiveWantToReadStructBuilder) updates]) =
      _$ArchiveWantToReadStruct;
}

ArchiveWantToReadStruct createArchiveWantToReadStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ArchiveWantToReadStruct(
      (a) => a
        ..id = null
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

ArchiveWantToReadStruct? updateArchiveWantToReadStruct(
  ArchiveWantToReadStruct? archiveWantToRead, {
  bool clearUnsetFields = true,
}) =>
    archiveWantToRead != null
        ? (archiveWantToRead.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addArchiveWantToReadStructData(
  Map<String, dynamic> firestoreData,
  ArchiveWantToReadStruct? archiveWantToRead,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (archiveWantToRead == null) {
    return;
  }
  if (archiveWantToRead.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && archiveWantToRead.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final archiveWantToReadData =
      getArchiveWantToReadFirestoreData(archiveWantToRead, forFieldValue);
  final nestedData =
      archiveWantToReadData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = archiveWantToRead.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getArchiveWantToReadFirestoreData(
  ArchiveWantToReadStruct? archiveWantToRead, [
  bool forFieldValue = false,
]) {
  if (archiveWantToRead == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(
      ArchiveWantToReadStruct.serializer, archiveWantToRead);

  // Add any Firestore field values
  archiveWantToRead.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getArchiveWantToReadListFirestoreData(
  List<ArchiveWantToReadStruct>? archiveWantToReads,
) =>
    archiveWantToReads
        ?.map((a) => getArchiveWantToReadFirestoreData(a, true))
        .toList() ??
    [];
