// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archiver_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ArchiverRecord> _$archiverRecordSerializer =
    new _$ArchiverRecordSerializer();

class _$ArchiverRecordSerializer
    implements StructuredSerializer<ArchiverRecord> {
  @override
  final Iterable<Type> types = const [ArchiverRecord, _$ArchiverRecord];
  @override
  final String wireName = 'ArchiverRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ArchiverRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ArchiveRead',
      serializers.serialize(object.archiveRead,
          specifiedType: const FullType(ArchiveReadStruct)),
      'ArchiveReading',
      serializers.serialize(object.archiveReading,
          specifiedType: const FullType(ArchiveIsReadingStruct)),
      'ArchiveWantToRead',
      serializers.serialize(object.archiveWantToRead,
          specifiedType: const FullType(ArchiveWantToReadStruct)),
    ];
    Object? value;
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ArchiverRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArchiverRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ArchiveRead':
          result.archiveRead.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ArchiveReadStruct))!
              as ArchiveReadStruct);
          break;
        case 'ArchiveReading':
          result.archiveReading.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ArchiveIsReadingStruct))!
              as ArchiveIsReadingStruct);
          break;
        case 'ArchiveWantToRead':
          result.archiveWantToRead.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ArchiveWantToReadStruct))!
              as ArchiveWantToReadStruct);
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ArchiverRecord extends ArchiverRecord {
  @override
  final ArchiveReadStruct archiveRead;
  @override
  final ArchiveIsReadingStruct archiveReading;
  @override
  final ArchiveWantToReadStruct archiveWantToRead;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ArchiverRecord([void Function(ArchiverRecordBuilder)? updates]) =>
      (new ArchiverRecordBuilder()..update(updates))._build();

  _$ArchiverRecord._(
      {required this.archiveRead,
      required this.archiveReading,
      required this.archiveWantToRead,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        archiveRead, r'ArchiverRecord', 'archiveRead');
    BuiltValueNullFieldError.checkNotNull(
        archiveReading, r'ArchiverRecord', 'archiveReading');
    BuiltValueNullFieldError.checkNotNull(
        archiveWantToRead, r'ArchiverRecord', 'archiveWantToRead');
  }

  @override
  ArchiverRecord rebuild(void Function(ArchiverRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArchiverRecordBuilder toBuilder() =>
      new ArchiverRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArchiverRecord &&
        archiveRead == other.archiveRead &&
        archiveReading == other.archiveReading &&
        archiveWantToRead == other.archiveWantToRead &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, archiveRead.hashCode), archiveReading.hashCode),
            archiveWantToRead.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ArchiverRecord')
          ..add('archiveRead', archiveRead)
          ..add('archiveReading', archiveReading)
          ..add('archiveWantToRead', archiveWantToRead)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ArchiverRecordBuilder
    implements Builder<ArchiverRecord, ArchiverRecordBuilder> {
  _$ArchiverRecord? _$v;

  ArchiveReadStructBuilder? _archiveRead;
  ArchiveReadStructBuilder get archiveRead =>
      _$this._archiveRead ??= new ArchiveReadStructBuilder();
  set archiveRead(ArchiveReadStructBuilder? archiveRead) =>
      _$this._archiveRead = archiveRead;

  ArchiveIsReadingStructBuilder? _archiveReading;
  ArchiveIsReadingStructBuilder get archiveReading =>
      _$this._archiveReading ??= new ArchiveIsReadingStructBuilder();
  set archiveReading(ArchiveIsReadingStructBuilder? archiveReading) =>
      _$this._archiveReading = archiveReading;

  ArchiveWantToReadStructBuilder? _archiveWantToRead;
  ArchiveWantToReadStructBuilder get archiveWantToRead =>
      _$this._archiveWantToRead ??= new ArchiveWantToReadStructBuilder();
  set archiveWantToRead(ArchiveWantToReadStructBuilder? archiveWantToRead) =>
      _$this._archiveWantToRead = archiveWantToRead;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ArchiverRecordBuilder() {
    ArchiverRecord._initializeBuilder(this);
  }

  ArchiverRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _archiveRead = $v.archiveRead.toBuilder();
      _archiveReading = $v.archiveReading.toBuilder();
      _archiveWantToRead = $v.archiveWantToRead.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArchiverRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ArchiverRecord;
  }

  @override
  void update(void Function(ArchiverRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ArchiverRecord build() => _build();

  _$ArchiverRecord _build() {
    _$ArchiverRecord _$result;
    try {
      _$result = _$v ??
          new _$ArchiverRecord._(
              archiveRead: archiveRead.build(),
              archiveReading: archiveReading.build(),
              archiveWantToRead: archiveWantToRead.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'archiveRead';
        archiveRead.build();
        _$failedField = 'archiveReading';
        archiveReading.build();
        _$failedField = 'archiveWantToRead';
        archiveWantToRead.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ArchiverRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
