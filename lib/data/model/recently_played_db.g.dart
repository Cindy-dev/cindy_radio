// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recently_played_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRecentlyPlayedDBCollection on Isar {
  IsarCollection<RecentlyPlayedDB> get recentlyPlayedDBs => this.collection();
}

const RecentlyPlayedDBSchema = CollectionSchema(
  name: r'RecentlyPlayedDB',
  id: -815534397388884072,
  properties: {
    r'clickcount': PropertySchema(
      id: 0,
      name: r'clickcount',
      type: IsarType.long,
    ),
    r'country': PropertySchema(
      id: 1,
      name: r'country',
      type: IsarType.string,
    ),
    r'countrycode': PropertySchema(
      id: 2,
      name: r'countrycode',
      type: IsarType.string,
    ),
    r'favicon': PropertySchema(
      id: 3,
      name: r'favicon',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'stationuuid': PropertySchema(
      id: 5,
      name: r'stationuuid',
      type: IsarType.string,
    ),
    r'tags': PropertySchema(
      id: 6,
      name: r'tags',
      type: IsarType.string,
    ),
    r'url': PropertySchema(
      id: 7,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _recentlyPlayedDBEstimateSize,
  serialize: _recentlyPlayedDBSerialize,
  deserialize: _recentlyPlayedDBDeserialize,
  deserializeProp: _recentlyPlayedDBDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _recentlyPlayedDBGetId,
  getLinks: _recentlyPlayedDBGetLinks,
  attach: _recentlyPlayedDBAttach,
  version: '3.1.0+1',
);

int _recentlyPlayedDBEstimateSize(
  RecentlyPlayedDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.country;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.countrycode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.favicon;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stationuuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tags;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _recentlyPlayedDBSerialize(
  RecentlyPlayedDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.clickcount);
  writer.writeString(offsets[1], object.country);
  writer.writeString(offsets[2], object.countrycode);
  writer.writeString(offsets[3], object.favicon);
  writer.writeString(offsets[4], object.name);
  writer.writeString(offsets[5], object.stationuuid);
  writer.writeString(offsets[6], object.tags);
  writer.writeString(offsets[7], object.url);
}

RecentlyPlayedDB _recentlyPlayedDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RecentlyPlayedDB();
  object.clickcount = reader.readLongOrNull(offsets[0]);
  object.country = reader.readStringOrNull(offsets[1]);
  object.countrycode = reader.readStringOrNull(offsets[2]);
  object.favicon = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.name = reader.readStringOrNull(offsets[4]);
  object.stationuuid = reader.readStringOrNull(offsets[5]);
  object.tags = reader.readStringOrNull(offsets[6]);
  object.url = reader.readStringOrNull(offsets[7]);
  return object;
}

P _recentlyPlayedDBDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _recentlyPlayedDBGetId(RecentlyPlayedDB object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _recentlyPlayedDBGetLinks(RecentlyPlayedDB object) {
  return [];
}

void _recentlyPlayedDBAttach(
    IsarCollection<dynamic> col, Id id, RecentlyPlayedDB object) {
  object.id = id;
}

extension RecentlyPlayedDBQueryWhereSort
    on QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QWhere> {
  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RecentlyPlayedDBQueryWhere
    on QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QWhereClause> {
  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RecentlyPlayedDBQueryFilter
    on QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QFilterCondition> {
  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      clickcountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clickcount',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      clickcountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clickcount',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      clickcountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clickcount',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      clickcountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clickcount',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      clickcountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clickcount',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      clickcountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clickcount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'country',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'country',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'country',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'country',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'country',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'country',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countrycodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'countrycode',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countrycodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'countrycode',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countrycodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'countrycode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countrycodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'countrycode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countrycodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'countrycode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countrycodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'countrycode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countrycodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'countrycode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countrycodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'countrycode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countrycodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'countrycode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countrycodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'countrycode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countrycodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'countrycode',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      countrycodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'countrycode',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      faviconIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'favicon',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      faviconIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'favicon',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      faviconEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'favicon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      faviconGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'favicon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      faviconLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'favicon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      faviconBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'favicon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      faviconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'favicon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      faviconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'favicon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      faviconContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'favicon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      faviconMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'favicon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      faviconIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'favicon',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      faviconIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'favicon',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      stationuuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stationuuid',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      stationuuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stationuuid',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      stationuuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stationuuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      stationuuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stationuuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      stationuuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stationuuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      stationuuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stationuuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      stationuuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stationuuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      stationuuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stationuuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      stationuuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stationuuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      stationuuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stationuuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      stationuuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stationuuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      stationuuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stationuuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      tagsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      tagsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      tagsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      tagsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      tagsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      tagsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      tagsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      tagsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      tagsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      tagsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      urlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      urlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      urlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      urlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      urlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      urlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterFilterCondition>
      urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension RecentlyPlayedDBQueryObject
    on QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QFilterCondition> {}

extension RecentlyPlayedDBQueryLinks
    on QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QFilterCondition> {}

extension RecentlyPlayedDBQuerySortBy
    on QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QSortBy> {
  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      sortByClickcount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clickcount', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      sortByClickcountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clickcount', Sort.desc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      sortByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      sortByCountryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.desc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      sortByCountrycode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countrycode', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      sortByCountrycodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countrycode', Sort.desc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      sortByFavicon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'favicon', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      sortByFaviconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'favicon', Sort.desc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      sortByStationuuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stationuuid', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      sortByStationuuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stationuuid', Sort.desc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy> sortByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tags', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      sortByTagsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tags', Sort.desc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension RecentlyPlayedDBQuerySortThenBy
    on QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QSortThenBy> {
  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      thenByClickcount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clickcount', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      thenByClickcountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clickcount', Sort.desc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      thenByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      thenByCountryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.desc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      thenByCountrycode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countrycode', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      thenByCountrycodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countrycode', Sort.desc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      thenByFavicon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'favicon', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      thenByFaviconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'favicon', Sort.desc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      thenByStationuuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stationuuid', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      thenByStationuuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stationuuid', Sort.desc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy> thenByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tags', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      thenByTagsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tags', Sort.desc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QAfterSortBy>
      thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension RecentlyPlayedDBQueryWhereDistinct
    on QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QDistinct> {
  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QDistinct>
      distinctByClickcount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clickcount');
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QDistinct> distinctByCountry(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'country', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QDistinct>
      distinctByCountrycode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'countrycode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QDistinct> distinctByFavicon(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'favicon', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QDistinct>
      distinctByStationuuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stationuuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QDistinct> distinctByTags(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }
}

extension RecentlyPlayedDBQueryProperty
    on QueryBuilder<RecentlyPlayedDB, RecentlyPlayedDB, QQueryProperty> {
  QueryBuilder<RecentlyPlayedDB, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RecentlyPlayedDB, int?, QQueryOperations> clickcountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clickcount');
    });
  }

  QueryBuilder<RecentlyPlayedDB, String?, QQueryOperations> countryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'country');
    });
  }

  QueryBuilder<RecentlyPlayedDB, String?, QQueryOperations>
      countrycodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'countrycode');
    });
  }

  QueryBuilder<RecentlyPlayedDB, String?, QQueryOperations> faviconProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'favicon');
    });
  }

  QueryBuilder<RecentlyPlayedDB, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<RecentlyPlayedDB, String?, QQueryOperations>
      stationuuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stationuuid');
    });
  }

  QueryBuilder<RecentlyPlayedDB, String?, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<RecentlyPlayedDB, String?, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }
}
