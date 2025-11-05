// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProductDBTable extends ProductDB
    with TableInfo<$ProductDBTable, ProductData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 16),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _inPantryMeta =
      const VerificationMeta('inPantry');
  @override
  late final GeneratedColumn<bool> inPantry = GeneratedColumn<bool>(
      'in_pantry', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("in_pantry" IN (0, 1))'));
  static const VerificationMeta _minQuantityMeta =
      const VerificationMeta('minQuantity');
  @override
  late final GeneratedColumn<int> minQuantity = GeneratedColumn<int>(
      'min_quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, category, inPantry, minQuantity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<ProductData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('in_pantry')) {
      context.handle(_inPantryMeta,
          inPantry.isAcceptableOrUnknown(data['in_pantry']!, _inPantryMeta));
    } else if (isInserting) {
      context.missing(_inPantryMeta);
    }
    if (data.containsKey('min_quantity')) {
      context.handle(
          _minQuantityMeta,
          minQuantity.isAcceptableOrUnknown(
              data['min_quantity']!, _minQuantityMeta));
    } else if (isInserting) {
      context.missing(_minQuantityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      inPantry: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}in_pantry'])!,
      minQuantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}min_quantity'])!,
    );
  }

  @override
  $ProductDBTable createAlias(String alias) {
    return $ProductDBTable(attachedDatabase, alias);
  }
}

class ProductData extends DataClass implements Insertable<ProductData> {
  final int id;
  final String name;
  final String category;
  final bool inPantry;
  final int minQuantity;
  const ProductData(
      {required this.id,
      required this.name,
      required this.category,
      required this.inPantry,
      required this.minQuantity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['in_pantry'] = Variable<bool>(inPantry);
    map['min_quantity'] = Variable<int>(minQuantity);
    return map;
  }

  ProductDBCompanion toCompanion(bool nullToAbsent) {
    return ProductDBCompanion(
      id: Value(id),
      name: Value(name),
      category: Value(category),
      inPantry: Value(inPantry),
      minQuantity: Value(minQuantity),
    );
  }

  factory ProductData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      inPantry: serializer.fromJson<bool>(json['inPantry']),
      minQuantity: serializer.fromJson<int>(json['minQuantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'inPantry': serializer.toJson<bool>(inPantry),
      'minQuantity': serializer.toJson<int>(minQuantity),
    };
  }

  ProductData copyWith(
          {int? id,
          String? name,
          String? category,
          bool? inPantry,
          int? minQuantity}) =>
      ProductData(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        inPantry: inPantry ?? this.inPantry,
        minQuantity: minQuantity ?? this.minQuantity,
      );
  ProductData copyWithCompanion(ProductDBCompanion data) {
    return ProductData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      inPantry: data.inPantry.present ? data.inPantry.value : this.inPantry,
      minQuantity:
          data.minQuantity.present ? data.minQuantity.value : this.minQuantity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('inPantry: $inPantry, ')
          ..write('minQuantity: $minQuantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, category, inPantry, minQuantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductData &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.inPantry == this.inPantry &&
          other.minQuantity == this.minQuantity);
}

class ProductDBCompanion extends UpdateCompanion<ProductData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> category;
  final Value<bool> inPantry;
  final Value<int> minQuantity;
  const ProductDBCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.inPantry = const Value.absent(),
    this.minQuantity = const Value.absent(),
  });
  ProductDBCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String category,
    required bool inPantry,
    required int minQuantity,
  })  : name = Value(name),
        category = Value(category),
        inPantry = Value(inPantry),
        minQuantity = Value(minQuantity);
  static Insertable<ProductData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<bool>? inPantry,
    Expression<int>? minQuantity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (inPantry != null) 'in_pantry': inPantry,
      if (minQuantity != null) 'min_quantity': minQuantity,
    });
  }

  ProductDBCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? category,
      Value<bool>? inPantry,
      Value<int>? minQuantity}) {
    return ProductDBCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      inPantry: inPantry ?? this.inPantry,
      minQuantity: minQuantity ?? this.minQuantity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (inPantry.present) {
      map['in_pantry'] = Variable<bool>(inPantry.value);
    }
    if (minQuantity.present) {
      map['min_quantity'] = Variable<int>(minQuantity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductDBCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('inPantry: $inPantry, ')
          ..write('minQuantity: $minQuantity')
          ..write(')'))
        .toString();
  }
}

class $StoreDBTable extends StoreDB with TableInfo<$StoreDBTable, StoreData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoreDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'store_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<StoreData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StoreData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoreData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $StoreDBTable createAlias(String alias) {
    return $StoreDBTable(attachedDatabase, alias);
  }
}

class StoreData extends DataClass implements Insertable<StoreData> {
  final int id;
  final String name;
  const StoreData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  StoreDBCompanion toCompanion(bool nullToAbsent) {
    return StoreDBCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory StoreData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoreData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  StoreData copyWith({int? id, String? name}) => StoreData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  StoreData copyWithCompanion(StoreDBCompanion data) {
    return StoreData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StoreData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoreData && other.id == this.id && other.name == this.name);
}

class StoreDBCompanion extends UpdateCompanion<StoreData> {
  final Value<int> id;
  final Value<String> name;
  const StoreDBCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  StoreDBCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<StoreData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  StoreDBCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return StoreDBCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoreDBCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ListDBTable extends ListDB with TableInfo<$ListDBTable, ListData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ListDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _isFinishedMeta =
      const VerificationMeta('isFinished');
  @override
  late final GeneratedColumn<bool> isFinished = GeneratedColumn<bool>(
      'is_finished', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_finished" IN (0, 1))'));
  static const VerificationMeta _storeMeta = const VerificationMeta('store');
  @override
  late final GeneratedColumn<int> store = GeneratedColumn<int>(
      'store', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES store_d_b (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, name, isFinished, store];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'list_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<ListData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_finished')) {
      context.handle(
          _isFinishedMeta,
          isFinished.isAcceptableOrUnknown(
              data['is_finished']!, _isFinishedMeta));
    } else if (isInserting) {
      context.missing(_isFinishedMeta);
    }
    if (data.containsKey('store')) {
      context.handle(
          _storeMeta, store.isAcceptableOrUnknown(data['store']!, _storeMeta));
    } else if (isInserting) {
      context.missing(_storeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ListData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ListData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      isFinished: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_finished'])!,
      store: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}store'])!,
    );
  }

  @override
  $ListDBTable createAlias(String alias) {
    return $ListDBTable(attachedDatabase, alias);
  }
}

class ListData extends DataClass implements Insertable<ListData> {
  final int id;
  final String name;
  final bool isFinished;
  final int store;
  const ListData(
      {required this.id,
      required this.name,
      required this.isFinished,
      required this.store});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['is_finished'] = Variable<bool>(isFinished);
    map['store'] = Variable<int>(store);
    return map;
  }

  ListDBCompanion toCompanion(bool nullToAbsent) {
    return ListDBCompanion(
      id: Value(id),
      name: Value(name),
      isFinished: Value(isFinished),
      store: Value(store),
    );
  }

  factory ListData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ListData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      isFinished: serializer.fromJson<bool>(json['isFinished']),
      store: serializer.fromJson<int>(json['store']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'isFinished': serializer.toJson<bool>(isFinished),
      'store': serializer.toJson<int>(store),
    };
  }

  ListData copyWith({int? id, String? name, bool? isFinished, int? store}) =>
      ListData(
        id: id ?? this.id,
        name: name ?? this.name,
        isFinished: isFinished ?? this.isFinished,
        store: store ?? this.store,
      );
  ListData copyWithCompanion(ListDBCompanion data) {
    return ListData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      isFinished:
          data.isFinished.present ? data.isFinished.value : this.isFinished,
      store: data.store.present ? data.store.value : this.store,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ListData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isFinished: $isFinished, ')
          ..write('store: $store')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, isFinished, store);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ListData &&
          other.id == this.id &&
          other.name == this.name &&
          other.isFinished == this.isFinished &&
          other.store == this.store);
}

class ListDBCompanion extends UpdateCompanion<ListData> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> isFinished;
  final Value<int> store;
  const ListDBCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isFinished = const Value.absent(),
    this.store = const Value.absent(),
  });
  ListDBCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required bool isFinished,
    required int store,
  })  : name = Value(name),
        isFinished = Value(isFinished),
        store = Value(store);
  static Insertable<ListData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? isFinished,
    Expression<int>? store,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isFinished != null) 'is_finished': isFinished,
      if (store != null) 'store': store,
    });
  }

  ListDBCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<bool>? isFinished,
      Value<int>? store}) {
    return ListDBCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isFinished: isFinished ?? this.isFinished,
      store: store ?? this.store,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isFinished.present) {
      map['is_finished'] = Variable<bool>(isFinished.value);
    }
    if (store.present) {
      map['store'] = Variable<int>(store.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ListDBCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isFinished: $isFinished, ')
          ..write('store: $store')
          ..write(')'))
        .toString();
  }
}

class $ItemDBTable extends ItemDB with TableInfo<$ItemDBTable, ItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isPurchasedMeta =
      const VerificationMeta('isPurchased');
  @override
  late final GeneratedColumn<bool> isPurchased = GeneratedColumn<bool>(
      'is_purchased', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_purchased" IN (0, 1))'));
  static const VerificationMeta _productMeta =
      const VerificationMeta('product');
  @override
  late final GeneratedColumn<int> product = GeneratedColumn<int>(
      'product', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES product_d_b (id)'));
  static const VerificationMeta _listMeta = const VerificationMeta('list');
  @override
  late final GeneratedColumn<int> list = GeneratedColumn<int>(
      'list', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES list_d_b (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, price, quantity, isPurchased, product, list];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<ItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('is_purchased')) {
      context.handle(
          _isPurchasedMeta,
          isPurchased.isAcceptableOrUnknown(
              data['is_purchased']!, _isPurchasedMeta));
    } else if (isInserting) {
      context.missing(_isPurchasedMeta);
    }
    if (data.containsKey('product')) {
      context.handle(_productMeta,
          product.isAcceptableOrUnknown(data['product']!, _productMeta));
    } else if (isInserting) {
      context.missing(_productMeta);
    }
    if (data.containsKey('list')) {
      context.handle(
          _listMeta, list.isAcceptableOrUnknown(data['list']!, _listMeta));
    } else if (isInserting) {
      context.missing(_listMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      isPurchased: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_purchased'])!,
      product: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product'])!,
      list: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}list'])!,
    );
  }

  @override
  $ItemDBTable createAlias(String alias) {
    return $ItemDBTable(attachedDatabase, alias);
  }
}

class ItemData extends DataClass implements Insertable<ItemData> {
  final int id;
  final double price;
  final int quantity;
  final bool isPurchased;
  final int product;
  final int list;
  const ItemData(
      {required this.id,
      required this.price,
      required this.quantity,
      required this.isPurchased,
      required this.product,
      required this.list});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['price'] = Variable<double>(price);
    map['quantity'] = Variable<int>(quantity);
    map['is_purchased'] = Variable<bool>(isPurchased);
    map['product'] = Variable<int>(product);
    map['list'] = Variable<int>(list);
    return map;
  }

  ItemDBCompanion toCompanion(bool nullToAbsent) {
    return ItemDBCompanion(
      id: Value(id),
      price: Value(price),
      quantity: Value(quantity),
      isPurchased: Value(isPurchased),
      product: Value(product),
      list: Value(list),
    );
  }

  factory ItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemData(
      id: serializer.fromJson<int>(json['id']),
      price: serializer.fromJson<double>(json['price']),
      quantity: serializer.fromJson<int>(json['quantity']),
      isPurchased: serializer.fromJson<bool>(json['isPurchased']),
      product: serializer.fromJson<int>(json['product']),
      list: serializer.fromJson<int>(json['list']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'price': serializer.toJson<double>(price),
      'quantity': serializer.toJson<int>(quantity),
      'isPurchased': serializer.toJson<bool>(isPurchased),
      'product': serializer.toJson<int>(product),
      'list': serializer.toJson<int>(list),
    };
  }

  ItemData copyWith(
          {int? id,
          double? price,
          int? quantity,
          bool? isPurchased,
          int? product,
          int? list}) =>
      ItemData(
        id: id ?? this.id,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        isPurchased: isPurchased ?? this.isPurchased,
        product: product ?? this.product,
        list: list ?? this.list,
      );
  ItemData copyWithCompanion(ItemDBCompanion data) {
    return ItemData(
      id: data.id.present ? data.id.value : this.id,
      price: data.price.present ? data.price.value : this.price,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      isPurchased:
          data.isPurchased.present ? data.isPurchased.value : this.isPurchased,
      product: data.product.present ? data.product.value : this.product,
      list: data.list.present ? data.list.value : this.list,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemData(')
          ..write('id: $id, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('isPurchased: $isPurchased, ')
          ..write('product: $product, ')
          ..write('list: $list')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, price, quantity, isPurchased, product, list);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemData &&
          other.id == this.id &&
          other.price == this.price &&
          other.quantity == this.quantity &&
          other.isPurchased == this.isPurchased &&
          other.product == this.product &&
          other.list == this.list);
}

class ItemDBCompanion extends UpdateCompanion<ItemData> {
  final Value<int> id;
  final Value<double> price;
  final Value<int> quantity;
  final Value<bool> isPurchased;
  final Value<int> product;
  final Value<int> list;
  const ItemDBCompanion({
    this.id = const Value.absent(),
    this.price = const Value.absent(),
    this.quantity = const Value.absent(),
    this.isPurchased = const Value.absent(),
    this.product = const Value.absent(),
    this.list = const Value.absent(),
  });
  ItemDBCompanion.insert({
    this.id = const Value.absent(),
    required double price,
    required int quantity,
    required bool isPurchased,
    required int product,
    required int list,
  })  : price = Value(price),
        quantity = Value(quantity),
        isPurchased = Value(isPurchased),
        product = Value(product),
        list = Value(list);
  static Insertable<ItemData> custom({
    Expression<int>? id,
    Expression<double>? price,
    Expression<int>? quantity,
    Expression<bool>? isPurchased,
    Expression<int>? product,
    Expression<int>? list,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (price != null) 'price': price,
      if (quantity != null) 'quantity': quantity,
      if (isPurchased != null) 'is_purchased': isPurchased,
      if (product != null) 'product': product,
      if (list != null) 'list': list,
    });
  }

  ItemDBCompanion copyWith(
      {Value<int>? id,
      Value<double>? price,
      Value<int>? quantity,
      Value<bool>? isPurchased,
      Value<int>? product,
      Value<int>? list}) {
    return ItemDBCompanion(
      id: id ?? this.id,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      isPurchased: isPurchased ?? this.isPurchased,
      product: product ?? this.product,
      list: list ?? this.list,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (isPurchased.present) {
      map['is_purchased'] = Variable<bool>(isPurchased.value);
    }
    if (product.present) {
      map['product'] = Variable<int>(product.value);
    }
    if (list.present) {
      map['list'] = Variable<int>(list.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemDBCompanion(')
          ..write('id: $id, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('isPurchased: $isPurchased, ')
          ..write('product: $product, ')
          ..write('list: $list')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductDBTable productDB = $ProductDBTable(this);
  late final $StoreDBTable storeDB = $StoreDBTable(this);
  late final $ListDBTable listDB = $ListDBTable(this);
  late final $ItemDBTable itemDB = $ItemDBTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [productDB, storeDB, listDB, itemDB];
}

typedef $$ProductDBTableCreateCompanionBuilder = ProductDBCompanion Function({
  Value<int> id,
  required String name,
  required String category,
  required bool inPantry,
  required int minQuantity,
});
typedef $$ProductDBTableUpdateCompanionBuilder = ProductDBCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> category,
  Value<bool> inPantry,
  Value<int> minQuantity,
});

final class $$ProductDBTableReferences
    extends BaseReferences<_$AppDatabase, $ProductDBTable, ProductData> {
  $$ProductDBTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ItemDBTable, List<ItemData>> _itemDBRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.itemDB,
          aliasName: $_aliasNameGenerator(db.productDB.id, db.itemDB.product));

  $$ItemDBTableProcessedTableManager get itemDBRefs {
    final manager = $$ItemDBTableTableManager($_db, $_db.itemDB)
        .filter((f) => f.product.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_itemDBRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ProductDBTableFilterComposer
    extends Composer<_$AppDatabase, $ProductDBTable> {
  $$ProductDBTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get inPantry => $composableBuilder(
      column: $table.inPantry, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minQuantity => $composableBuilder(
      column: $table.minQuantity, builder: (column) => ColumnFilters(column));

  Expression<bool> itemDBRefs(
      Expression<bool> Function($$ItemDBTableFilterComposer f) f) {
    final $$ItemDBTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.itemDB,
        getReferencedColumn: (t) => t.product,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ItemDBTableFilterComposer(
              $db: $db,
              $table: $db.itemDB,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProductDBTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductDBTable> {
  $$ProductDBTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get inPantry => $composableBuilder(
      column: $table.inPantry, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minQuantity => $composableBuilder(
      column: $table.minQuantity, builder: (column) => ColumnOrderings(column));
}

class $$ProductDBTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductDBTable> {
  $$ProductDBTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<bool> get inPantry =>
      $composableBuilder(column: $table.inPantry, builder: (column) => column);

  GeneratedColumn<int> get minQuantity => $composableBuilder(
      column: $table.minQuantity, builder: (column) => column);

  Expression<T> itemDBRefs<T extends Object>(
      Expression<T> Function($$ItemDBTableAnnotationComposer a) f) {
    final $$ItemDBTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.itemDB,
        getReferencedColumn: (t) => t.product,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ItemDBTableAnnotationComposer(
              $db: $db,
              $table: $db.itemDB,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProductDBTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductDBTable,
    ProductData,
    $$ProductDBTableFilterComposer,
    $$ProductDBTableOrderingComposer,
    $$ProductDBTableAnnotationComposer,
    $$ProductDBTableCreateCompanionBuilder,
    $$ProductDBTableUpdateCompanionBuilder,
    (ProductData, $$ProductDBTableReferences),
    ProductData,
    PrefetchHooks Function({bool itemDBRefs})> {
  $$ProductDBTableTableManager(_$AppDatabase db, $ProductDBTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductDBTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductDBTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductDBTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<bool> inPantry = const Value.absent(),
            Value<int> minQuantity = const Value.absent(),
          }) =>
              ProductDBCompanion(
            id: id,
            name: name,
            category: category,
            inPantry: inPantry,
            minQuantity: minQuantity,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String category,
            required bool inPantry,
            required int minQuantity,
          }) =>
              ProductDBCompanion.insert(
            id: id,
            name: name,
            category: category,
            inPantry: inPantry,
            minQuantity: minQuantity,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ProductDBTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({itemDBRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (itemDBRefs) db.itemDB],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (itemDBRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$ProductDBTableReferences._itemDBRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductDBTableReferences(db, table, p0)
                                .itemDBRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.product == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ProductDBTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductDBTable,
    ProductData,
    $$ProductDBTableFilterComposer,
    $$ProductDBTableOrderingComposer,
    $$ProductDBTableAnnotationComposer,
    $$ProductDBTableCreateCompanionBuilder,
    $$ProductDBTableUpdateCompanionBuilder,
    (ProductData, $$ProductDBTableReferences),
    ProductData,
    PrefetchHooks Function({bool itemDBRefs})>;
typedef $$StoreDBTableCreateCompanionBuilder = StoreDBCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$StoreDBTableUpdateCompanionBuilder = StoreDBCompanion Function({
  Value<int> id,
  Value<String> name,
});

final class $$StoreDBTableReferences
    extends BaseReferences<_$AppDatabase, $StoreDBTable, StoreData> {
  $$StoreDBTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ListDBTable, List<ListData>> _listDBRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.listDB,
          aliasName: $_aliasNameGenerator(db.storeDB.id, db.listDB.store));

  $$ListDBTableProcessedTableManager get listDBRefs {
    final manager = $$ListDBTableTableManager($_db, $_db.listDB)
        .filter((f) => f.store.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_listDBRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$StoreDBTableFilterComposer
    extends Composer<_$AppDatabase, $StoreDBTable> {
  $$StoreDBTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  Expression<bool> listDBRefs(
      Expression<bool> Function($$ListDBTableFilterComposer f) f) {
    final $$ListDBTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.listDB,
        getReferencedColumn: (t) => t.store,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ListDBTableFilterComposer(
              $db: $db,
              $table: $db.listDB,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$StoreDBTableOrderingComposer
    extends Composer<_$AppDatabase, $StoreDBTable> {
  $$StoreDBTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$StoreDBTableAnnotationComposer
    extends Composer<_$AppDatabase, $StoreDBTable> {
  $$StoreDBTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> listDBRefs<T extends Object>(
      Expression<T> Function($$ListDBTableAnnotationComposer a) f) {
    final $$ListDBTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.listDB,
        getReferencedColumn: (t) => t.store,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ListDBTableAnnotationComposer(
              $db: $db,
              $table: $db.listDB,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$StoreDBTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StoreDBTable,
    StoreData,
    $$StoreDBTableFilterComposer,
    $$StoreDBTableOrderingComposer,
    $$StoreDBTableAnnotationComposer,
    $$StoreDBTableCreateCompanionBuilder,
    $$StoreDBTableUpdateCompanionBuilder,
    (StoreData, $$StoreDBTableReferences),
    StoreData,
    PrefetchHooks Function({bool listDBRefs})> {
  $$StoreDBTableTableManager(_$AppDatabase db, $StoreDBTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StoreDBTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StoreDBTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StoreDBTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              StoreDBCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              StoreDBCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$StoreDBTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({listDBRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (listDBRefs) db.listDB],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (listDBRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$StoreDBTableReferences._listDBRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$StoreDBTableReferences(db, table, p0).listDBRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.store == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$StoreDBTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StoreDBTable,
    StoreData,
    $$StoreDBTableFilterComposer,
    $$StoreDBTableOrderingComposer,
    $$StoreDBTableAnnotationComposer,
    $$StoreDBTableCreateCompanionBuilder,
    $$StoreDBTableUpdateCompanionBuilder,
    (StoreData, $$StoreDBTableReferences),
    StoreData,
    PrefetchHooks Function({bool listDBRefs})>;
typedef $$ListDBTableCreateCompanionBuilder = ListDBCompanion Function({
  Value<int> id,
  required String name,
  required bool isFinished,
  required int store,
});
typedef $$ListDBTableUpdateCompanionBuilder = ListDBCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<bool> isFinished,
  Value<int> store,
});

final class $$ListDBTableReferences
    extends BaseReferences<_$AppDatabase, $ListDBTable, ListData> {
  $$ListDBTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $StoreDBTable _storeTable(_$AppDatabase db) => db.storeDB
      .createAlias($_aliasNameGenerator(db.listDB.store, db.storeDB.id));

  $$StoreDBTableProcessedTableManager get store {
    final manager = $$StoreDBTableTableManager($_db, $_db.storeDB)
        .filter((f) => f.id($_item.store));
    final item = $_typedResult.readTableOrNull(_storeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$ItemDBTable, List<ItemData>> _itemDBRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.itemDB,
          aliasName: $_aliasNameGenerator(db.listDB.id, db.itemDB.list));

  $$ItemDBTableProcessedTableManager get itemDBRefs {
    final manager = $$ItemDBTableTableManager($_db, $_db.itemDB)
        .filter((f) => f.list.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_itemDBRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ListDBTableFilterComposer
    extends Composer<_$AppDatabase, $ListDBTable> {
  $$ListDBTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isFinished => $composableBuilder(
      column: $table.isFinished, builder: (column) => ColumnFilters(column));

  $$StoreDBTableFilterComposer get store {
    final $$StoreDBTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.store,
        referencedTable: $db.storeDB,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StoreDBTableFilterComposer(
              $db: $db,
              $table: $db.storeDB,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> itemDBRefs(
      Expression<bool> Function($$ItemDBTableFilterComposer f) f) {
    final $$ItemDBTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.itemDB,
        getReferencedColumn: (t) => t.list,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ItemDBTableFilterComposer(
              $db: $db,
              $table: $db.itemDB,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ListDBTableOrderingComposer
    extends Composer<_$AppDatabase, $ListDBTable> {
  $$ListDBTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isFinished => $composableBuilder(
      column: $table.isFinished, builder: (column) => ColumnOrderings(column));

  $$StoreDBTableOrderingComposer get store {
    final $$StoreDBTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.store,
        referencedTable: $db.storeDB,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StoreDBTableOrderingComposer(
              $db: $db,
              $table: $db.storeDB,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ListDBTableAnnotationComposer
    extends Composer<_$AppDatabase, $ListDBTable> {
  $$ListDBTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isFinished => $composableBuilder(
      column: $table.isFinished, builder: (column) => column);

  $$StoreDBTableAnnotationComposer get store {
    final $$StoreDBTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.store,
        referencedTable: $db.storeDB,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$StoreDBTableAnnotationComposer(
              $db: $db,
              $table: $db.storeDB,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> itemDBRefs<T extends Object>(
      Expression<T> Function($$ItemDBTableAnnotationComposer a) f) {
    final $$ItemDBTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.itemDB,
        getReferencedColumn: (t) => t.list,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ItemDBTableAnnotationComposer(
              $db: $db,
              $table: $db.itemDB,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ListDBTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ListDBTable,
    ListData,
    $$ListDBTableFilterComposer,
    $$ListDBTableOrderingComposer,
    $$ListDBTableAnnotationComposer,
    $$ListDBTableCreateCompanionBuilder,
    $$ListDBTableUpdateCompanionBuilder,
    (ListData, $$ListDBTableReferences),
    ListData,
    PrefetchHooks Function({bool store, bool itemDBRefs})> {
  $$ListDBTableTableManager(_$AppDatabase db, $ListDBTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ListDBTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ListDBTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ListDBTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<bool> isFinished = const Value.absent(),
            Value<int> store = const Value.absent(),
          }) =>
              ListDBCompanion(
            id: id,
            name: name,
            isFinished: isFinished,
            store: store,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required bool isFinished,
            required int store,
          }) =>
              ListDBCompanion.insert(
            id: id,
            name: name,
            isFinished: isFinished,
            store: store,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ListDBTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({store = false, itemDBRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (itemDBRefs) db.itemDB],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (store) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.store,
                    referencedTable: $$ListDBTableReferences._storeTable(db),
                    referencedColumn:
                        $$ListDBTableReferences._storeTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (itemDBRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$ListDBTableReferences._itemDBRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ListDBTableReferences(db, table, p0).itemDBRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) =>
                                referencedItems.where((e) => e.list == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ListDBTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ListDBTable,
    ListData,
    $$ListDBTableFilterComposer,
    $$ListDBTableOrderingComposer,
    $$ListDBTableAnnotationComposer,
    $$ListDBTableCreateCompanionBuilder,
    $$ListDBTableUpdateCompanionBuilder,
    (ListData, $$ListDBTableReferences),
    ListData,
    PrefetchHooks Function({bool store, bool itemDBRefs})>;
typedef $$ItemDBTableCreateCompanionBuilder = ItemDBCompanion Function({
  Value<int> id,
  required double price,
  required int quantity,
  required bool isPurchased,
  required int product,
  required int list,
});
typedef $$ItemDBTableUpdateCompanionBuilder = ItemDBCompanion Function({
  Value<int> id,
  Value<double> price,
  Value<int> quantity,
  Value<bool> isPurchased,
  Value<int> product,
  Value<int> list,
});

final class $$ItemDBTableReferences
    extends BaseReferences<_$AppDatabase, $ItemDBTable, ItemData> {
  $$ItemDBTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProductDBTable _productTable(_$AppDatabase db) => db.productDB
      .createAlias($_aliasNameGenerator(db.itemDB.product, db.productDB.id));

  $$ProductDBTableProcessedTableManager get product {
    final manager = $$ProductDBTableTableManager($_db, $_db.productDB)
        .filter((f) => f.id($_item.product));
    final item = $_typedResult.readTableOrNull(_productTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ListDBTable _listTable(_$AppDatabase db) =>
      db.listDB.createAlias($_aliasNameGenerator(db.itemDB.list, db.listDB.id));

  $$ListDBTableProcessedTableManager get list {
    final manager = $$ListDBTableTableManager($_db, $_db.listDB)
        .filter((f) => f.id($_item.list));
    final item = $_typedResult.readTableOrNull(_listTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ItemDBTableFilterComposer
    extends Composer<_$AppDatabase, $ItemDBTable> {
  $$ItemDBTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPurchased => $composableBuilder(
      column: $table.isPurchased, builder: (column) => ColumnFilters(column));

  $$ProductDBTableFilterComposer get product {
    final $$ProductDBTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.product,
        referencedTable: $db.productDB,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductDBTableFilterComposer(
              $db: $db,
              $table: $db.productDB,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ListDBTableFilterComposer get list {
    final $$ListDBTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.list,
        referencedTable: $db.listDB,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ListDBTableFilterComposer(
              $db: $db,
              $table: $db.listDB,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ItemDBTableOrderingComposer
    extends Composer<_$AppDatabase, $ItemDBTable> {
  $$ItemDBTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPurchased => $composableBuilder(
      column: $table.isPurchased, builder: (column) => ColumnOrderings(column));

  $$ProductDBTableOrderingComposer get product {
    final $$ProductDBTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.product,
        referencedTable: $db.productDB,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductDBTableOrderingComposer(
              $db: $db,
              $table: $db.productDB,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ListDBTableOrderingComposer get list {
    final $$ListDBTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.list,
        referencedTable: $db.listDB,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ListDBTableOrderingComposer(
              $db: $db,
              $table: $db.listDB,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ItemDBTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItemDBTable> {
  $$ItemDBTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<bool> get isPurchased => $composableBuilder(
      column: $table.isPurchased, builder: (column) => column);

  $$ProductDBTableAnnotationComposer get product {
    final $$ProductDBTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.product,
        referencedTable: $db.productDB,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductDBTableAnnotationComposer(
              $db: $db,
              $table: $db.productDB,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ListDBTableAnnotationComposer get list {
    final $$ListDBTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.list,
        referencedTable: $db.listDB,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ListDBTableAnnotationComposer(
              $db: $db,
              $table: $db.listDB,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ItemDBTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ItemDBTable,
    ItemData,
    $$ItemDBTableFilterComposer,
    $$ItemDBTableOrderingComposer,
    $$ItemDBTableAnnotationComposer,
    $$ItemDBTableCreateCompanionBuilder,
    $$ItemDBTableUpdateCompanionBuilder,
    (ItemData, $$ItemDBTableReferences),
    ItemData,
    PrefetchHooks Function({bool product, bool list})> {
  $$ItemDBTableTableManager(_$AppDatabase db, $ItemDBTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemDBTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItemDBTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItemDBTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<bool> isPurchased = const Value.absent(),
            Value<int> product = const Value.absent(),
            Value<int> list = const Value.absent(),
          }) =>
              ItemDBCompanion(
            id: id,
            price: price,
            quantity: quantity,
            isPurchased: isPurchased,
            product: product,
            list: list,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required double price,
            required int quantity,
            required bool isPurchased,
            required int product,
            required int list,
          }) =>
              ItemDBCompanion.insert(
            id: id,
            price: price,
            quantity: quantity,
            isPurchased: isPurchased,
            product: product,
            list: list,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ItemDBTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({product = false, list = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (product) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.product,
                    referencedTable: $$ItemDBTableReferences._productTable(db),
                    referencedColumn:
                        $$ItemDBTableReferences._productTable(db).id,
                  ) as T;
                }
                if (list) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.list,
                    referencedTable: $$ItemDBTableReferences._listTable(db),
                    referencedColumn: $$ItemDBTableReferences._listTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ItemDBTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ItemDBTable,
    ItemData,
    $$ItemDBTableFilterComposer,
    $$ItemDBTableOrderingComposer,
    $$ItemDBTableAnnotationComposer,
    $$ItemDBTableCreateCompanionBuilder,
    $$ItemDBTableUpdateCompanionBuilder,
    (ItemData, $$ItemDBTableReferences),
    ItemData,
    PrefetchHooks Function({bool product, bool list})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductDBTableTableManager get productDB =>
      $$ProductDBTableTableManager(_db, _db.productDB);
  $$StoreDBTableTableManager get storeDB =>
      $$StoreDBTableTableManager(_db, _db.storeDB);
  $$ListDBTableTableManager get listDB =>
      $$ListDBTableTableManager(_db, _db.listDB);
  $$ItemDBTableTableManager get itemDB =>
      $$ItemDBTableTableManager(_db, _db.itemDB);
}
