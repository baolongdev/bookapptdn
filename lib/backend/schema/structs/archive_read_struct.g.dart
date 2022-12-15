// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive_read_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ArchiveReadStruct> _$archiveReadStructSerializer =
    new _$ArchiveReadStructSerializer();

class _$ArchiveReadStructSerializer
    implements StructuredSerializer<ArchiveReadStruct> {
  @override
  final Iterable<Type> types = const [ArchiveReadStruct, _$ArchiveReadStruct];
  @override
  final String wireName = 'ArchiveReadStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, ArchiveReadStruct object,
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
  ArchiveReadStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArchiveReadStructBuilder();

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

class _$ArchiveReadStruct extends ArchiveReadStruct {
  @override
  final BuiltList<String>? id;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$ArchiveReadStruct(
          [void Function(ArchiveReadStructBuilder)? updates]) =>
      (new ArchiveReadStructBuilder()..update(updates))._build();

  _$ArchiveReadStruct._({this.id, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'ArchiveReadStruct', 'firestoreUtilData');
  }

  @override
  ArchiveReadStruct rebuild(void Function(ArchiveReadStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArchiveReadStructBuilder toBuilder() =>
      new ArchiveReadStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArchiveReadStruct &&
        id == other.id &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ArchiveReadStruct')
          ..add('id', id)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class ArchiveReadStructBuilder
    implements Builder<ArchiveReadStruct, ArchiveReadStructBuilder> {
  _$ArchiveReadStruct? _$v;

  ListBuilder<String>? _id;
  ListBuilder<String> get id => _$this._id ??= new ListBuilder<String>();
  set id(ListBuilder<String>? id) => _$this._id = id;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  ArchiveReadStructBuilder() {
    ArchiveReadStruct._initializeBuilder(this);
  }

  ArchiveReadStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id?.toBuilder();
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArchiveReadStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ArchiveReadStruct;
  }

  @override
  void update(void Function(ArchiveReadStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ArchiveReadStruct build() => _build();

  _$ArchiveReadStruct _build() {
    _$ArchiveReadStruct _$result;
    try {
      _$result = _$v ??
          new _$ArchiveReadStruct._(
              id: _id?.build(),
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData,
                  r'ArchiveReadStruct',
                  'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'id';
        _id?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ArchiveReadStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
