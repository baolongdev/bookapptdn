// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive_is_reading_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ArchiveIsReadingStruct> _$archiveIsReadingStructSerializer =
    new _$ArchiveIsReadingStructSerializer();

class _$ArchiveIsReadingStructSerializer
    implements StructuredSerializer<ArchiveIsReadingStruct> {
  @override
  final Iterable<Type> types = const [
    ArchiveIsReadingStruct,
    _$ArchiveIsReadingStruct
  ];
  @override
  final String wireName = 'ArchiveIsReadingStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ArchiveIsReadingStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  ArchiveIsReadingStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArchiveIsReadingStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$ArchiveIsReadingStruct extends ArchiveIsReadingStruct {
  @override
  final BuiltList<String>? id;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$ArchiveIsReadingStruct(
          [void Function(ArchiveIsReadingStructBuilder)? updates]) =>
      (new ArchiveIsReadingStructBuilder()..update(updates))._build();

  _$ArchiveIsReadingStruct._({this.id, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'ArchiveIsReadingStruct', 'firestoreUtilData');
  }

  @override
  ArchiveIsReadingStruct rebuild(
          void Function(ArchiveIsReadingStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArchiveIsReadingStructBuilder toBuilder() =>
      new ArchiveIsReadingStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArchiveIsReadingStruct &&
        id == other.id &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ArchiveIsReadingStruct')
          ..add('id', id)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class ArchiveIsReadingStructBuilder
    implements Builder<ArchiveIsReadingStruct, ArchiveIsReadingStructBuilder> {
  _$ArchiveIsReadingStruct? _$v;

  ListBuilder<String>? _id;
  ListBuilder<String> get id => _$this._id ??= new ListBuilder<String>();
  set id(ListBuilder<String>? id) => _$this._id = id;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  ArchiveIsReadingStructBuilder() {
    ArchiveIsReadingStruct._initializeBuilder(this);
  }

  ArchiveIsReadingStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id?.toBuilder();
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArchiveIsReadingStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ArchiveIsReadingStruct;
  }

  @override
  void update(void Function(ArchiveIsReadingStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ArchiveIsReadingStruct build() => _build();

  _$ArchiveIsReadingStruct _build() {
    _$ArchiveIsReadingStruct _$result;
    try {
      _$result = _$v ??
          new _$ArchiveIsReadingStruct._(
              id: _id?.build(),
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData,
                  r'ArchiveIsReadingStruct',
                  'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'id';
        _id?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ArchiveIsReadingStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
