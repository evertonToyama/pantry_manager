// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class Product extends Table with TableInfo<Product, ProductData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Product(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _inPantryMeta =
      const VerificationMeta('inPantry');
  late final GeneratedColumn<int> inPantry = GeneratedColumn<int>(
      'in_pantry', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _minQuantityMeta =
      const VerificationMeta('minQuantity');
  late final GeneratedColumn<int> minQuantity = GeneratedColumn<int>(
      'min_quantity', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 1',
      defaultValue: const CustomExpression('1'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, category, inPantry, minQuantity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product';
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
          .read(DriftSqlType.int, data['${effectivePrefix}in_pantry'])!,
      minQuantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}min_quantity'])!,
    );
  }

  @override
  Product createAlias(String alias) {
    return Product(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ProductData extends DataClass implements Insertable<ProductData> {
  final int id;
  final String name;
  final String category;
  final int inPantry;
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
    map['in_pantry'] = Variable<int>(inPantry);
    map['min_quantity'] = Variable<int>(minQuantity);
    return map;
  }

  ProductCompanion toCompanion(bool nullToAbsent) {
    return ProductCompanion(
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
      inPantry: serializer.fromJson<int>(json['in_pantry']),
      minQuantity: serializer.fromJson<int>(json['min_quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'in_pantry': serializer.toJson<int>(inPantry),
      'min_quantity': serializer.toJson<int>(minQuantity),
    };
  }

  ProductData copyWith(
          {int? id,
          String? name,
          String? category,
          int? inPantry,
          int? minQuantity}) =>
      ProductData(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        inPantry: inPantry ?? this.inPantry,
        minQuantity: minQuantity ?? this.minQuantity,
      );
  ProductData copyWithCompanion(ProductCompanion data) {
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

class ProductCompanion extends UpdateCompanion<ProductData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> category;
  final Value<int> inPantry;
  final Value<int> minQuantity;
  const ProductCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.inPantry = const Value.absent(),
    this.minQuantity = const Value.absent(),
  });
  ProductCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String category,
    required int inPantry,
    this.minQuantity = const Value.absent(),
  })  : name = Value(name),
        category = Value(category),
        inPantry = Value(inPantry);
  static Insertable<ProductData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<int>? inPantry,
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

  ProductCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? category,
      Value<int>? inPantry,
      Value<int>? minQuantity}) {
    return ProductCompanion(
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
      map['in_pantry'] = Variable<int>(inPantry.value);
    }
    if (minQuantity.present) {
      map['min_quantity'] = Variable<int>(minQuantity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('inPantry: $inPantry, ')
          ..write('minQuantity: $minQuantity')
          ..write(')'))
        .toString();
  }
}

class Store extends Table with TableInfo<Store, StoreData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Store(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL UNIQUE');
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'store';
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
  Store createAlias(String alias) {
    return Store(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
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

  StoreCompanion toCompanion(bool nullToAbsent) {
    return StoreCompanion(
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
  StoreData copyWithCompanion(StoreCompanion data) {
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

class StoreCompanion extends UpdateCompanion<StoreData> {
  final Value<int> id;
  final Value<String> name;
  const StoreCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  StoreCompanion.insert({
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

  StoreCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return StoreCompanion(
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
    return (StringBuffer('StoreCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class ShoppingList extends Table
    with TableInfo<ShoppingList, ShoppingListData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ShoppingList(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _isFinishedMeta =
      const VerificationMeta('isFinished');
  late final GeneratedColumn<int> isFinished = GeneratedColumn<int>(
      'is_finished', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  static const VerificationMeta _idStoreMeta =
      const VerificationMeta('idStore');
  late final GeneratedColumn<int> idStore = GeneratedColumn<int>(
      'id_store', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES store(id)');
  @override
  List<GeneratedColumn> get $columns => [id, name, isFinished, idStore];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shopping_list';
  @override
  VerificationContext validateIntegrity(Insertable<ShoppingListData> instance,
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
    }
    if (data.containsKey('id_store')) {
      context.handle(_idStoreMeta,
          idStore.isAcceptableOrUnknown(data['id_store']!, _idStoreMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShoppingListData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShoppingListData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      isFinished: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_finished'])!,
      idStore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_store']),
    );
  }

  @override
  ShoppingList createAlias(String alias) {
    return ShoppingList(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ShoppingListData extends DataClass
    implements Insertable<ShoppingListData> {
  final int id;
  final String name;
  final int isFinished;
  final int? idStore;
  const ShoppingListData(
      {required this.id,
      required this.name,
      required this.isFinished,
      this.idStore});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['is_finished'] = Variable<int>(isFinished);
    if (!nullToAbsent || idStore != null) {
      map['id_store'] = Variable<int>(idStore);
    }
    return map;
  }

  ShoppingListCompanion toCompanion(bool nullToAbsent) {
    return ShoppingListCompanion(
      id: Value(id),
      name: Value(name),
      isFinished: Value(isFinished),
      idStore: idStore == null && nullToAbsent
          ? const Value.absent()
          : Value(idStore),
    );
  }

  factory ShoppingListData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShoppingListData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      isFinished: serializer.fromJson<int>(json['is_finished']),
      idStore: serializer.fromJson<int?>(json['id_store']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'is_finished': serializer.toJson<int>(isFinished),
      'id_store': serializer.toJson<int?>(idStore),
    };
  }

  ShoppingListData copyWith(
          {int? id,
          String? name,
          int? isFinished,
          Value<int?> idStore = const Value.absent()}) =>
      ShoppingListData(
        id: id ?? this.id,
        name: name ?? this.name,
        isFinished: isFinished ?? this.isFinished,
        idStore: idStore.present ? idStore.value : this.idStore,
      );
  ShoppingListData copyWithCompanion(ShoppingListCompanion data) {
    return ShoppingListData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      isFinished:
          data.isFinished.present ? data.isFinished.value : this.isFinished,
      idStore: data.idStore.present ? data.idStore.value : this.idStore,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingListData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isFinished: $isFinished, ')
          ..write('idStore: $idStore')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, isFinished, idStore);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShoppingListData &&
          other.id == this.id &&
          other.name == this.name &&
          other.isFinished == this.isFinished &&
          other.idStore == this.idStore);
}

class ShoppingListCompanion extends UpdateCompanion<ShoppingListData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> isFinished;
  final Value<int?> idStore;
  const ShoppingListCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isFinished = const Value.absent(),
    this.idStore = const Value.absent(),
  });
  ShoppingListCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.isFinished = const Value.absent(),
    this.idStore = const Value.absent(),
  }) : name = Value(name);
  static Insertable<ShoppingListData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? isFinished,
    Expression<int>? idStore,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isFinished != null) 'is_finished': isFinished,
      if (idStore != null) 'id_store': idStore,
    });
  }

  ShoppingListCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? isFinished,
      Value<int?>? idStore}) {
    return ShoppingListCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isFinished: isFinished ?? this.isFinished,
      idStore: idStore ?? this.idStore,
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
      map['is_finished'] = Variable<int>(isFinished.value);
    }
    if (idStore.present) {
      map['id_store'] = Variable<int>(idStore.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingListCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isFinished: $isFinished, ')
          ..write('idStore: $idStore')
          ..write(')'))
        .toString();
  }
}

class Item extends Table with TableInfo<Item, ItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Item(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
      'price', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NULL');
  static const VerificationMeta _isPurchasedMeta =
      const VerificationMeta('isPurchased');
  late final GeneratedColumn<int> isPurchased = GeneratedColumn<int>(
      'is_purchased', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NULL DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  static const VerificationMeta _idProductMeta =
      const VerificationMeta('idProduct');
  late final GeneratedColumn<int> idProduct = GeneratedColumn<int>(
      'id_product', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES product(id)');
  static const VerificationMeta _idListMeta = const VerificationMeta('idList');
  late final GeneratedColumn<int> idList = GeneratedColumn<int>(
      'id_list', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES shopping_list(id)');
  @override
  List<GeneratedColumn> get $columns =>
      [id, quantity, price, isPurchased, idProduct, idList];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item';
  @override
  VerificationContext validateIntegrity(Insertable<ItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('is_purchased')) {
      context.handle(
          _isPurchasedMeta,
          isPurchased.isAcceptableOrUnknown(
              data['is_purchased']!, _isPurchasedMeta));
    }
    if (data.containsKey('id_product')) {
      context.handle(_idProductMeta,
          idProduct.isAcceptableOrUnknown(data['id_product']!, _idProductMeta));
    } else if (isInserting) {
      context.missing(_idProductMeta);
    }
    if (data.containsKey('id_list')) {
      context.handle(_idListMeta,
          idList.isAcceptableOrUnknown(data['id_list']!, _idListMeta));
    } else if (isInserting) {
      context.missing(_idListMeta);
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
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price']),
      isPurchased: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_purchased']),
      idProduct: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_product'])!,
      idList: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_list'])!,
    );
  }

  @override
  Item createAlias(String alias) {
    return Item(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ItemData extends DataClass implements Insertable<ItemData> {
  final int id;
  final int quantity;
  final int? price;
  final int? isPurchased;
  final int idProduct;
  final int idList;
  const ItemData(
      {required this.id,
      required this.quantity,
      this.price,
      this.isPurchased,
      required this.idProduct,
      required this.idList});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['quantity'] = Variable<int>(quantity);
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<int>(price);
    }
    if (!nullToAbsent || isPurchased != null) {
      map['is_purchased'] = Variable<int>(isPurchased);
    }
    map['id_product'] = Variable<int>(idProduct);
    map['id_list'] = Variable<int>(idList);
    return map;
  }

  ItemCompanion toCompanion(bool nullToAbsent) {
    return ItemCompanion(
      id: Value(id),
      quantity: Value(quantity),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      isPurchased: isPurchased == null && nullToAbsent
          ? const Value.absent()
          : Value(isPurchased),
      idProduct: Value(idProduct),
      idList: Value(idList),
    );
  }

  factory ItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemData(
      id: serializer.fromJson<int>(json['id']),
      quantity: serializer.fromJson<int>(json['quantity']),
      price: serializer.fromJson<int?>(json['price']),
      isPurchased: serializer.fromJson<int?>(json['is_purchased']),
      idProduct: serializer.fromJson<int>(json['id_product']),
      idList: serializer.fromJson<int>(json['id_list']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'quantity': serializer.toJson<int>(quantity),
      'price': serializer.toJson<int?>(price),
      'is_purchased': serializer.toJson<int?>(isPurchased),
      'id_product': serializer.toJson<int>(idProduct),
      'id_list': serializer.toJson<int>(idList),
    };
  }

  ItemData copyWith(
          {int? id,
          int? quantity,
          Value<int?> price = const Value.absent(),
          Value<int?> isPurchased = const Value.absent(),
          int? idProduct,
          int? idList}) =>
      ItemData(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
        price: price.present ? price.value : this.price,
        isPurchased: isPurchased.present ? isPurchased.value : this.isPurchased,
        idProduct: idProduct ?? this.idProduct,
        idList: idList ?? this.idList,
      );
  ItemData copyWithCompanion(ItemCompanion data) {
    return ItemData(
      id: data.id.present ? data.id.value : this.id,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      price: data.price.present ? data.price.value : this.price,
      isPurchased:
          data.isPurchased.present ? data.isPurchased.value : this.isPurchased,
      idProduct: data.idProduct.present ? data.idProduct.value : this.idProduct,
      idList: data.idList.present ? data.idList.value : this.idList,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemData(')
          ..write('id: $id, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('isPurchased: $isPurchased, ')
          ..write('idProduct: $idProduct, ')
          ..write('idList: $idList')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, quantity, price, isPurchased, idProduct, idList);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemData &&
          other.id == this.id &&
          other.quantity == this.quantity &&
          other.price == this.price &&
          other.isPurchased == this.isPurchased &&
          other.idProduct == this.idProduct &&
          other.idList == this.idList);
}

class ItemCompanion extends UpdateCompanion<ItemData> {
  final Value<int> id;
  final Value<int> quantity;
  final Value<int?> price;
  final Value<int?> isPurchased;
  final Value<int> idProduct;
  final Value<int> idList;
  const ItemCompanion({
    this.id = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
    this.isPurchased = const Value.absent(),
    this.idProduct = const Value.absent(),
    this.idList = const Value.absent(),
  });
  ItemCompanion.insert({
    this.id = const Value.absent(),
    required int quantity,
    this.price = const Value.absent(),
    this.isPurchased = const Value.absent(),
    required int idProduct,
    required int idList,
  })  : quantity = Value(quantity),
        idProduct = Value(idProduct),
        idList = Value(idList);
  static Insertable<ItemData> custom({
    Expression<int>? id,
    Expression<int>? quantity,
    Expression<int>? price,
    Expression<int>? isPurchased,
    Expression<int>? idProduct,
    Expression<int>? idList,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
      if (isPurchased != null) 'is_purchased': isPurchased,
      if (idProduct != null) 'id_product': idProduct,
      if (idList != null) 'id_list': idList,
    });
  }

  ItemCompanion copyWith(
      {Value<int>? id,
      Value<int>? quantity,
      Value<int?>? price,
      Value<int?>? isPurchased,
      Value<int>? idProduct,
      Value<int>? idList}) {
    return ItemCompanion(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      isPurchased: isPurchased ?? this.isPurchased,
      idProduct: idProduct ?? this.idProduct,
      idList: idList ?? this.idList,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (isPurchased.present) {
      map['is_purchased'] = Variable<int>(isPurchased.value);
    }
    if (idProduct.present) {
      map['id_product'] = Variable<int>(idProduct.value);
    }
    if (idList.present) {
      map['id_list'] = Variable<int>(idList.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemCompanion(')
          ..write('id: $id, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('isPurchased: $isPurchased, ')
          ..write('idProduct: $idProduct, ')
          ..write('idList: $idList')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final Product product = Product(this);
  late final Store store = Store(this);
  late final ShoppingList shoppingList = ShoppingList(this);
  late final Item item = Item(this);
  Future<int> _insertProduct(
      String name, String category, int inPantry, int minQuantity) {
    return customInsert(
      'INSERT INTO product (name, category, in_pantry, min_quantity) VALUES (?1, ?2, ?3, ?4)',
      variables: [
        Variable<String>(name),
        Variable<String>(category),
        Variable<int>(inPantry),
        Variable<int>(minQuantity)
      ],
      updates: {product},
    );
  }

  Selectable<ProductData> _getAllProducts() {
    return customSelect('SELECT * FROM product', variables: [], readsFrom: {
      product,
    }).asyncMap(product.mapFromRow);
  }

  Selectable<ProductData> _getProductById(int id) {
    return customSelect('SELECT * FROM product WHERE id = ?1', variables: [
      Variable<int>(id)
    ], readsFrom: {
      product,
    }).asyncMap(product.mapFromRow);
  }

  Future<int> _updateProduct(
      String name, String category, int inPantry, int minQuantity, int id) {
    return customUpdate(
      'UPDATE product SET name = ?1, category = ?2, in_pantry = ?3, min_quantity = ?4 WHERE id = ?5',
      variables: [
        Variable<String>(name),
        Variable<String>(category),
        Variable<int>(inPantry),
        Variable<int>(minQuantity),
        Variable<int>(id)
      ],
      updates: {product},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> _deleteProduct(int id) {
    return customUpdate(
      'DELETE FROM product WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {product},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> _insertStore(String name) {
    return customInsert(
      'INSERT INTO store (name) VALUES (?1)',
      variables: [Variable<String>(name)],
      updates: {store},
    );
  }

  Selectable<StoreData> _getAllStores() {
    return customSelect('SELECT * FROM store', variables: [], readsFrom: {
      store,
    }).asyncMap(store.mapFromRow);
  }

  Selectable<StoreData> _getStoreById(int id) {
    return customSelect('SELECT * FROM store WHERE id = ?1', variables: [
      Variable<int>(id)
    ], readsFrom: {
      store,
    }).asyncMap(store.mapFromRow);
  }

  Future<int> _updateStore(String name, int id) {
    return customUpdate(
      'UPDATE store SET name = ?1 WHERE id = ?2',
      variables: [Variable<String>(name), Variable<int>(id)],
      updates: {store},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> _deleteStore(int id) {
    return customUpdate(
      'DELETE FROM store WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {store},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> _insertList(String name, int isFinished, int? idStore) {
    return customInsert(
      'INSERT INTO shopping_list (name, is_finished, id_store) VALUES (?1, ?2, ?3)',
      variables: [
        Variable<String>(name),
        Variable<int>(isFinished),
        Variable<int>(idStore)
      ],
      updates: {shoppingList},
    );
  }

  Selectable<GetAllListsResult> _getAllLists() {
    return customSelect(
        'SELECT l.id AS id_list, l.name AS name_list, is_finished, s.id AS id_store, s.name AS name_store FROM shopping_list AS l JOIN store AS s ON l.id_store = s.id',
        variables: [],
        readsFrom: {
          shoppingList,
          store,
        }).map((QueryRow row) => GetAllListsResult(
          idList: row.read<int>('id_list'),
          nameList: row.read<String>('name_list'),
          isFinished: row.read<int>('is_finished'),
          idStore: row.read<int>('id_store'),
          nameStore: row.read<String>('name_store'),
        ));
  }

  Selectable<GetListByIdResult> _getListById(int id) {
    return customSelect(
        'SELECT l.id AS id_list, l.name AS name_list, is_finished, s.id AS id_store, s.name AS name_store FROM shopping_list AS l JOIN store AS s ON l.id_store = s.id WHERE l.id = ?1',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          shoppingList,
          store,
        }).map((QueryRow row) => GetListByIdResult(
          idList: row.read<int>('id_list'),
          nameList: row.read<String>('name_list'),
          isFinished: row.read<int>('is_finished'),
          idStore: row.read<int>('id_store'),
          nameStore: row.read<String>('name_store'),
        ));
  }

  Future<int> _updateList(String name, int isFinished, int? idStore, int id) {
    return customUpdate(
      'UPDATE shopping_list SET name = ?1, is_finished = ?2, id_store = ?3 WHERE id = ?4',
      variables: [
        Variable<String>(name),
        Variable<int>(isFinished),
        Variable<int>(idStore),
        Variable<int>(id)
      ],
      updates: {shoppingList},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> _deleteList(int id) {
    return customUpdate(
      'DELETE FROM shopping_list WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {shoppingList},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<GetJoinResult> _getJoin() {
    return customSelect(
        'SELECT l.id AS id_list, l.name AS name_list, l.is_finished, s.id AS id_store, s.name AS name_store FROM shopping_list AS l JOIN store AS s ON s.id = l.id_store',
        variables: [],
        readsFrom: {
          shoppingList,
          store,
        }).map((QueryRow row) => GetJoinResult(
          idList: row.read<int>('id_list'),
          nameList: row.read<String>('name_list'),
          isFinished: row.read<int>('is_finished'),
          idStore: row.read<int>('id_store'),
          nameStore: row.read<String>('name_store'),
        ));
  }

  Future<int> _insertItem(
      int quantity, int? price, int? isPurchased, int idProduct, int idList) {
    return customInsert(
      'INSERT INTO item (quantity, price, is_purchased, id_product, id_list) VALUES (?1, ?2, ?3, ?4, ?5)',
      variables: [
        Variable<int>(quantity),
        Variable<int>(price),
        Variable<int>(isPurchased),
        Variable<int>(idProduct),
        Variable<int>(idList)
      ],
      updates: {item},
    );
  }

  Selectable<GetAllItemsResult> _getAllItems() {
    return customSelect(
        'SELECT i.id AS id_item, quantity, price, is_purchased, p.id AS id_product, p.name AS name_product, category, in_pantry, min_quantity, l.id AS id_list, l.name AS name_list, is_finished, s.id AS id_store, s.name AS name_store FROM item AS i JOIN product AS p ON i.id_product = p.id JOIN shopping_list AS l ON i.id_list = l.id JOIN store AS s ON l.id_store = s.id',
        variables: [],
        readsFrom: {
          item,
          product,
          shoppingList,
          store,
        }).map((QueryRow row) => GetAllItemsResult(
          idItem: row.read<int>('id_item'),
          quantity: row.read<int>('quantity'),
          price: row.readNullable<int>('price'),
          isPurchased: row.readNullable<int>('is_purchased'),
          idProduct: row.read<int>('id_product'),
          nameProduct: row.read<String>('name_product'),
          category: row.read<String>('category'),
          inPantry: row.read<int>('in_pantry'),
          minQuantity: row.read<int>('min_quantity'),
          idList: row.read<int>('id_list'),
          nameList: row.read<String>('name_list'),
          isFinished: row.read<int>('is_finished'),
          idStore: row.read<int>('id_store'),
          nameStore: row.read<String>('name_store'),
        ));
  }

  Selectable<GetItemByIdResult> _getItemById(int id) {
    return customSelect(
        'SELECT i.id AS id_item, quantity, price, is_purchased, p.id AS id_product, p.name AS name_product, category, in_pantry, min_quantity, l.id AS id_list, l.name AS name_list, is_finished, s.id AS id_store, s.name AS name_store FROM item AS i JOIN product AS p ON i.id_product = p.id JOIN shopping_list AS l ON i.id_list = l.id JOIN store AS s ON l.id_store = s.id WHERE i.id = ?1',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          item,
          product,
          shoppingList,
          store,
        }).map((QueryRow row) => GetItemByIdResult(
          idItem: row.read<int>('id_item'),
          quantity: row.read<int>('quantity'),
          price: row.readNullable<int>('price'),
          isPurchased: row.readNullable<int>('is_purchased'),
          idProduct: row.read<int>('id_product'),
          nameProduct: row.read<String>('name_product'),
          category: row.read<String>('category'),
          inPantry: row.read<int>('in_pantry'),
          minQuantity: row.read<int>('min_quantity'),
          idList: row.read<int>('id_list'),
          nameList: row.read<String>('name_list'),
          isFinished: row.read<int>('is_finished'),
          idStore: row.read<int>('id_store'),
          nameStore: row.read<String>('name_store'),
        ));
  }

  Selectable<GetItemsOfListResult> _getItemsOfList(int idList) {
    return customSelect(
        'SELECT i.id AS id_item, quantity, price, is_purchased, p.id AS id_product, p.name AS name_product, category, in_pantry, min_quantity, l.id AS id_list, l.name AS name_list, is_finished, s.id AS id_store, s.name AS name_store FROM item AS i JOIN product AS p ON i.id_product = p.id JOIN shopping_list AS l ON i.id_list = l.id JOIN store AS s ON l.id_store = s.id WHERE l.id = ?1',
        variables: [
          Variable<int>(idList)
        ],
        readsFrom: {
          item,
          product,
          shoppingList,
          store,
        }).map((QueryRow row) => GetItemsOfListResult(
          idItem: row.read<int>('id_item'),
          quantity: row.read<int>('quantity'),
          price: row.readNullable<int>('price'),
          isPurchased: row.readNullable<int>('is_purchased'),
          idProduct: row.read<int>('id_product'),
          nameProduct: row.read<String>('name_product'),
          category: row.read<String>('category'),
          inPantry: row.read<int>('in_pantry'),
          minQuantity: row.read<int>('min_quantity'),
          idList: row.read<int>('id_list'),
          nameList: row.read<String>('name_list'),
          isFinished: row.read<int>('is_finished'),
          idStore: row.read<int>('id_store'),
          nameStore: row.read<String>('name_store'),
        ));
  }

  Future<int> _updateItem(int quantity, int? price, int? isPurchased,
      int idProduct, int idList, int id) {
    return customUpdate(
      'UPDATE item SET quantity = ?1, price = ?2, is_purchased = ?3, id_product = ?4, id_list = ?5 WHERE id = ?6',
      variables: [
        Variable<int>(quantity),
        Variable<int>(price),
        Variable<int>(isPurchased),
        Variable<int>(idProduct),
        Variable<int>(idList),
        Variable<int>(id)
      ],
      updates: {item},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> _deleteItem(int id) {
    return customUpdate(
      'DELETE FROM item WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {item},
      updateKind: UpdateKind.delete,
    );
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [product, store, shoppingList, item];
}

typedef $ProductCreateCompanionBuilder = ProductCompanion Function({
  Value<int> id,
  required String name,
  required String category,
  required int inPantry,
  Value<int> minQuantity,
});
typedef $ProductUpdateCompanionBuilder = ProductCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> category,
  Value<int> inPantry,
  Value<int> minQuantity,
});

final class $ProductReferences
    extends BaseReferences<_$AppDatabase, Product, ProductData> {
  $ProductReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<Item, List<ItemData>> _itemRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.item,
          aliasName: $_aliasNameGenerator(db.product.id, db.item.idProduct));

  $ItemProcessedTableManager get itemRefs {
    final manager = $ItemTableManager($_db, $_db.item)
        .filter((f) => f.idProduct.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_itemRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $ProductFilterComposer extends Composer<_$AppDatabase, Product> {
  $ProductFilterComposer({
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

  ColumnFilters<int> get inPantry => $composableBuilder(
      column: $table.inPantry, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minQuantity => $composableBuilder(
      column: $table.minQuantity, builder: (column) => ColumnFilters(column));

  Expression<bool> itemRefs(
      Expression<bool> Function($ItemFilterComposer f) f) {
    final $ItemFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.item,
        getReferencedColumn: (t) => t.idProduct,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ItemFilterComposer(
              $db: $db,
              $table: $db.item,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $ProductOrderingComposer extends Composer<_$AppDatabase, Product> {
  $ProductOrderingComposer({
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

  ColumnOrderings<int> get inPantry => $composableBuilder(
      column: $table.inPantry, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minQuantity => $composableBuilder(
      column: $table.minQuantity, builder: (column) => ColumnOrderings(column));
}

class $ProductAnnotationComposer extends Composer<_$AppDatabase, Product> {
  $ProductAnnotationComposer({
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

  GeneratedColumn<int> get inPantry =>
      $composableBuilder(column: $table.inPantry, builder: (column) => column);

  GeneratedColumn<int> get minQuantity => $composableBuilder(
      column: $table.minQuantity, builder: (column) => column);

  Expression<T> itemRefs<T extends Object>(
      Expression<T> Function($ItemAnnotationComposer a) f) {
    final $ItemAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.item,
        getReferencedColumn: (t) => t.idProduct,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ItemAnnotationComposer(
              $db: $db,
              $table: $db.item,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $ProductTableManager extends RootTableManager<
    _$AppDatabase,
    Product,
    ProductData,
    $ProductFilterComposer,
    $ProductOrderingComposer,
    $ProductAnnotationComposer,
    $ProductCreateCompanionBuilder,
    $ProductUpdateCompanionBuilder,
    (ProductData, $ProductReferences),
    ProductData,
    PrefetchHooks Function({bool itemRefs})> {
  $ProductTableManager(_$AppDatabase db, Product table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $ProductFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $ProductOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $ProductAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<int> inPantry = const Value.absent(),
            Value<int> minQuantity = const Value.absent(),
          }) =>
              ProductCompanion(
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
            required int inPantry,
            Value<int> minQuantity = const Value.absent(),
          }) =>
              ProductCompanion.insert(
            id: id,
            name: name,
            category: category,
            inPantry: inPantry,
            minQuantity: minQuantity,
          ),
          withReferenceMapper: (p0) => p0
              .map(
                  (e) => (e.readTable(table), $ProductReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({itemRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (itemRefs) db.item],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (itemRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $ProductReferences._itemRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $ProductReferences(db, table, p0).itemRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.idProduct == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $ProductProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    Product,
    ProductData,
    $ProductFilterComposer,
    $ProductOrderingComposer,
    $ProductAnnotationComposer,
    $ProductCreateCompanionBuilder,
    $ProductUpdateCompanionBuilder,
    (ProductData, $ProductReferences),
    ProductData,
    PrefetchHooks Function({bool itemRefs})>;
typedef $StoreCreateCompanionBuilder = StoreCompanion Function({
  Value<int> id,
  required String name,
});
typedef $StoreUpdateCompanionBuilder = StoreCompanion Function({
  Value<int> id,
  Value<String> name,
});

final class $StoreReferences
    extends BaseReferences<_$AppDatabase, Store, StoreData> {
  $StoreReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<ShoppingList, List<ShoppingListData>>
      _shoppingListRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.shoppingList,
              aliasName:
                  $_aliasNameGenerator(db.store.id, db.shoppingList.idStore));

  $ShoppingListProcessedTableManager get shoppingListRefs {
    final manager = $ShoppingListTableManager($_db, $_db.shoppingList)
        .filter((f) => f.idStore.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_shoppingListRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $StoreFilterComposer extends Composer<_$AppDatabase, Store> {
  $StoreFilterComposer({
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

  Expression<bool> shoppingListRefs(
      Expression<bool> Function($ShoppingListFilterComposer f) f) {
    final $ShoppingListFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.shoppingList,
        getReferencedColumn: (t) => t.idStore,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ShoppingListFilterComposer(
              $db: $db,
              $table: $db.shoppingList,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $StoreOrderingComposer extends Composer<_$AppDatabase, Store> {
  $StoreOrderingComposer({
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

class $StoreAnnotationComposer extends Composer<_$AppDatabase, Store> {
  $StoreAnnotationComposer({
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

  Expression<T> shoppingListRefs<T extends Object>(
      Expression<T> Function($ShoppingListAnnotationComposer a) f) {
    final $ShoppingListAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.shoppingList,
        getReferencedColumn: (t) => t.idStore,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ShoppingListAnnotationComposer(
              $db: $db,
              $table: $db.shoppingList,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $StoreTableManager extends RootTableManager<
    _$AppDatabase,
    Store,
    StoreData,
    $StoreFilterComposer,
    $StoreOrderingComposer,
    $StoreAnnotationComposer,
    $StoreCreateCompanionBuilder,
    $StoreUpdateCompanionBuilder,
    (StoreData, $StoreReferences),
    StoreData,
    PrefetchHooks Function({bool shoppingListRefs})> {
  $StoreTableManager(_$AppDatabase db, Store table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $StoreFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $StoreOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $StoreAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              StoreCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              StoreCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), $StoreReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({shoppingListRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (shoppingListRefs) db.shoppingList],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (shoppingListRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $StoreReferences._shoppingListRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $StoreReferences(db, table, p0).shoppingListRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.idStore == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $StoreProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    Store,
    StoreData,
    $StoreFilterComposer,
    $StoreOrderingComposer,
    $StoreAnnotationComposer,
    $StoreCreateCompanionBuilder,
    $StoreUpdateCompanionBuilder,
    (StoreData, $StoreReferences),
    StoreData,
    PrefetchHooks Function({bool shoppingListRefs})>;
typedef $ShoppingListCreateCompanionBuilder = ShoppingListCompanion Function({
  Value<int> id,
  required String name,
  Value<int> isFinished,
  Value<int?> idStore,
});
typedef $ShoppingListUpdateCompanionBuilder = ShoppingListCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> isFinished,
  Value<int?> idStore,
});

final class $ShoppingListReferences
    extends BaseReferences<_$AppDatabase, ShoppingList, ShoppingListData> {
  $ShoppingListReferences(super.$_db, super.$_table, super.$_typedResult);

  static Store _idStoreTable(_$AppDatabase db) => db.store
      .createAlias($_aliasNameGenerator(db.shoppingList.idStore, db.store.id));

  $StoreProcessedTableManager? get idStore {
    if ($_item.idStore == null) return null;
    final manager = $StoreTableManager($_db, $_db.store)
        .filter((f) => f.id($_item.idStore!));
    final item = $_typedResult.readTableOrNull(_idStoreTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<Item, List<ItemData>> _itemRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.item,
          aliasName: $_aliasNameGenerator(db.shoppingList.id, db.item.idList));

  $ItemProcessedTableManager get itemRefs {
    final manager = $ItemTableManager($_db, $_db.item)
        .filter((f) => f.idList.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_itemRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $ShoppingListFilterComposer
    extends Composer<_$AppDatabase, ShoppingList> {
  $ShoppingListFilterComposer({
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

  ColumnFilters<int> get isFinished => $composableBuilder(
      column: $table.isFinished, builder: (column) => ColumnFilters(column));

  $StoreFilterComposer get idStore {
    final $StoreFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idStore,
        referencedTable: $db.store,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $StoreFilterComposer(
              $db: $db,
              $table: $db.store,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> itemRefs(
      Expression<bool> Function($ItemFilterComposer f) f) {
    final $ItemFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.item,
        getReferencedColumn: (t) => t.idList,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ItemFilterComposer(
              $db: $db,
              $table: $db.item,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $ShoppingListOrderingComposer
    extends Composer<_$AppDatabase, ShoppingList> {
  $ShoppingListOrderingComposer({
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

  ColumnOrderings<int> get isFinished => $composableBuilder(
      column: $table.isFinished, builder: (column) => ColumnOrderings(column));

  $StoreOrderingComposer get idStore {
    final $StoreOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idStore,
        referencedTable: $db.store,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $StoreOrderingComposer(
              $db: $db,
              $table: $db.store,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $ShoppingListAnnotationComposer
    extends Composer<_$AppDatabase, ShoppingList> {
  $ShoppingListAnnotationComposer({
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

  GeneratedColumn<int> get isFinished => $composableBuilder(
      column: $table.isFinished, builder: (column) => column);

  $StoreAnnotationComposer get idStore {
    final $StoreAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idStore,
        referencedTable: $db.store,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $StoreAnnotationComposer(
              $db: $db,
              $table: $db.store,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> itemRefs<T extends Object>(
      Expression<T> Function($ItemAnnotationComposer a) f) {
    final $ItemAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.item,
        getReferencedColumn: (t) => t.idList,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ItemAnnotationComposer(
              $db: $db,
              $table: $db.item,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $ShoppingListTableManager extends RootTableManager<
    _$AppDatabase,
    ShoppingList,
    ShoppingListData,
    $ShoppingListFilterComposer,
    $ShoppingListOrderingComposer,
    $ShoppingListAnnotationComposer,
    $ShoppingListCreateCompanionBuilder,
    $ShoppingListUpdateCompanionBuilder,
    (ShoppingListData, $ShoppingListReferences),
    ShoppingListData,
    PrefetchHooks Function({bool idStore, bool itemRefs})> {
  $ShoppingListTableManager(_$AppDatabase db, ShoppingList table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $ShoppingListFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $ShoppingListOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $ShoppingListAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> isFinished = const Value.absent(),
            Value<int?> idStore = const Value.absent(),
          }) =>
              ShoppingListCompanion(
            id: id,
            name: name,
            isFinished: isFinished,
            idStore: idStore,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<int> isFinished = const Value.absent(),
            Value<int?> idStore = const Value.absent(),
          }) =>
              ShoppingListCompanion.insert(
            id: id,
            name: name,
            isFinished: isFinished,
            idStore: idStore,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $ShoppingListReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({idStore = false, itemRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (itemRefs) db.item],
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
                if (idStore) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idStore,
                    referencedTable: $ShoppingListReferences._idStoreTable(db),
                    referencedColumn:
                        $ShoppingListReferences._idStoreTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (itemRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $ShoppingListReferences._itemRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $ShoppingListReferences(db, table, p0).itemRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.idList == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $ShoppingListProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    ShoppingList,
    ShoppingListData,
    $ShoppingListFilterComposer,
    $ShoppingListOrderingComposer,
    $ShoppingListAnnotationComposer,
    $ShoppingListCreateCompanionBuilder,
    $ShoppingListUpdateCompanionBuilder,
    (ShoppingListData, $ShoppingListReferences),
    ShoppingListData,
    PrefetchHooks Function({bool idStore, bool itemRefs})>;
typedef $ItemCreateCompanionBuilder = ItemCompanion Function({
  Value<int> id,
  required int quantity,
  Value<int?> price,
  Value<int?> isPurchased,
  required int idProduct,
  required int idList,
});
typedef $ItemUpdateCompanionBuilder = ItemCompanion Function({
  Value<int> id,
  Value<int> quantity,
  Value<int?> price,
  Value<int?> isPurchased,
  Value<int> idProduct,
  Value<int> idList,
});

final class $ItemReferences
    extends BaseReferences<_$AppDatabase, Item, ItemData> {
  $ItemReferences(super.$_db, super.$_table, super.$_typedResult);

  static Product _idProductTable(_$AppDatabase db) => db.product
      .createAlias($_aliasNameGenerator(db.item.idProduct, db.product.id));

  $ProductProcessedTableManager get idProduct {
    final manager = $ProductTableManager($_db, $_db.product)
        .filter((f) => f.id($_item.idProduct));
    final item = $_typedResult.readTableOrNull(_idProductTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static ShoppingList _idListTable(_$AppDatabase db) => db.shoppingList
      .createAlias($_aliasNameGenerator(db.item.idList, db.shoppingList.id));

  $ShoppingListProcessedTableManager get idList {
    final manager = $ShoppingListTableManager($_db, $_db.shoppingList)
        .filter((f) => f.id($_item.idList));
    final item = $_typedResult.readTableOrNull(_idListTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $ItemFilterComposer extends Composer<_$AppDatabase, Item> {
  $ItemFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get isPurchased => $composableBuilder(
      column: $table.isPurchased, builder: (column) => ColumnFilters(column));

  $ProductFilterComposer get idProduct {
    final $ProductFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idProduct,
        referencedTable: $db.product,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ProductFilterComposer(
              $db: $db,
              $table: $db.product,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $ShoppingListFilterComposer get idList {
    final $ShoppingListFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idList,
        referencedTable: $db.shoppingList,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ShoppingListFilterComposer(
              $db: $db,
              $table: $db.shoppingList,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $ItemOrderingComposer extends Composer<_$AppDatabase, Item> {
  $ItemOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get isPurchased => $composableBuilder(
      column: $table.isPurchased, builder: (column) => ColumnOrderings(column));

  $ProductOrderingComposer get idProduct {
    final $ProductOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idProduct,
        referencedTable: $db.product,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ProductOrderingComposer(
              $db: $db,
              $table: $db.product,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $ShoppingListOrderingComposer get idList {
    final $ShoppingListOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idList,
        referencedTable: $db.shoppingList,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ShoppingListOrderingComposer(
              $db: $db,
              $table: $db.shoppingList,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $ItemAnnotationComposer extends Composer<_$AppDatabase, Item> {
  $ItemAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<int> get isPurchased => $composableBuilder(
      column: $table.isPurchased, builder: (column) => column);

  $ProductAnnotationComposer get idProduct {
    final $ProductAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idProduct,
        referencedTable: $db.product,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ProductAnnotationComposer(
              $db: $db,
              $table: $db.product,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $ShoppingListAnnotationComposer get idList {
    final $ShoppingListAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idList,
        referencedTable: $db.shoppingList,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $ShoppingListAnnotationComposer(
              $db: $db,
              $table: $db.shoppingList,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $ItemTableManager extends RootTableManager<
    _$AppDatabase,
    Item,
    ItemData,
    $ItemFilterComposer,
    $ItemOrderingComposer,
    $ItemAnnotationComposer,
    $ItemCreateCompanionBuilder,
    $ItemUpdateCompanionBuilder,
    (ItemData, $ItemReferences),
    ItemData,
    PrefetchHooks Function({bool idProduct, bool idList})> {
  $ItemTableManager(_$AppDatabase db, Item table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $ItemFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $ItemOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $ItemAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<int?> price = const Value.absent(),
            Value<int?> isPurchased = const Value.absent(),
            Value<int> idProduct = const Value.absent(),
            Value<int> idList = const Value.absent(),
          }) =>
              ItemCompanion(
            id: id,
            quantity: quantity,
            price: price,
            isPurchased: isPurchased,
            idProduct: idProduct,
            idList: idList,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int quantity,
            Value<int?> price = const Value.absent(),
            Value<int?> isPurchased = const Value.absent(),
            required int idProduct,
            required int idList,
          }) =>
              ItemCompanion.insert(
            id: id,
            quantity: quantity,
            price: price,
            isPurchased: isPurchased,
            idProduct: idProduct,
            idList: idList,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), $ItemReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({idProduct = false, idList = false}) {
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
                if (idProduct) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idProduct,
                    referencedTable: $ItemReferences._idProductTable(db),
                    referencedColumn: $ItemReferences._idProductTable(db).id,
                  ) as T;
                }
                if (idList) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.idList,
                    referencedTable: $ItemReferences._idListTable(db),
                    referencedColumn: $ItemReferences._idListTable(db).id,
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

typedef $ItemProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    Item,
    ItemData,
    $ItemFilterComposer,
    $ItemOrderingComposer,
    $ItemAnnotationComposer,
    $ItemCreateCompanionBuilder,
    $ItemUpdateCompanionBuilder,
    (ItemData, $ItemReferences),
    ItemData,
    PrefetchHooks Function({bool idProduct, bool idList})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $ProductTableManager get product => $ProductTableManager(_db, _db.product);
  $StoreTableManager get store => $StoreTableManager(_db, _db.store);
  $ShoppingListTableManager get shoppingList =>
      $ShoppingListTableManager(_db, _db.shoppingList);
  $ItemTableManager get item => $ItemTableManager(_db, _db.item);
}

class GetAllListsResult {
  final int idList;
  final String nameList;
  final int isFinished;
  final int idStore;
  final String nameStore;
  GetAllListsResult({
    required this.idList,
    required this.nameList,
    required this.isFinished,
    required this.idStore,
    required this.nameStore,
  });
}

class GetListByIdResult {
  final int idList;
  final String nameList;
  final int isFinished;
  final int idStore;
  final String nameStore;
  GetListByIdResult({
    required this.idList,
    required this.nameList,
    required this.isFinished,
    required this.idStore,
    required this.nameStore,
  });
}

class GetJoinResult {
  final int idList;
  final String nameList;
  final int isFinished;
  final int idStore;
  final String nameStore;
  GetJoinResult({
    required this.idList,
    required this.nameList,
    required this.isFinished,
    required this.idStore,
    required this.nameStore,
  });
}

class GetAllItemsResult {
  final int idItem;
  final int quantity;
  final int? price;
  final int? isPurchased;
  final int idProduct;
  final String nameProduct;
  final String category;
  final int inPantry;
  final int minQuantity;
  final int idList;
  final String nameList;
  final int isFinished;
  final int idStore;
  final String nameStore;
  GetAllItemsResult({
    required this.idItem,
    required this.quantity,
    this.price,
    this.isPurchased,
    required this.idProduct,
    required this.nameProduct,
    required this.category,
    required this.inPantry,
    required this.minQuantity,
    required this.idList,
    required this.nameList,
    required this.isFinished,
    required this.idStore,
    required this.nameStore,
  });
}

class GetItemByIdResult {
  final int idItem;
  final int quantity;
  final int? price;
  final int? isPurchased;
  final int idProduct;
  final String nameProduct;
  final String category;
  final int inPantry;
  final int minQuantity;
  final int idList;
  final String nameList;
  final int isFinished;
  final int idStore;
  final String nameStore;
  GetItemByIdResult({
    required this.idItem,
    required this.quantity,
    this.price,
    this.isPurchased,
    required this.idProduct,
    required this.nameProduct,
    required this.category,
    required this.inPantry,
    required this.minQuantity,
    required this.idList,
    required this.nameList,
    required this.isFinished,
    required this.idStore,
    required this.nameStore,
  });
}

class GetItemsOfListResult {
  final int idItem;
  final int quantity;
  final int? price;
  final int? isPurchased;
  final int idProduct;
  final String nameProduct;
  final String category;
  final int inPantry;
  final int minQuantity;
  final int idList;
  final String nameList;
  final int isFinished;
  final int idStore;
  final String nameStore;
  GetItemsOfListResult({
    required this.idItem,
    required this.quantity,
    this.price,
    this.isPurchased,
    required this.idProduct,
    required this.nameProduct,
    required this.category,
    required this.inPantry,
    required this.minQuantity,
    required this.idList,
    required this.nameList,
    required this.isFinished,
    required this.idStore,
    required this.nameStore,
  });
}
