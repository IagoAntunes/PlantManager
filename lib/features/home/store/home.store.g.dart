// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$idBottomNavAtom =
      Atom(name: '_HomeStore.idBottomNav', context: context);

  @override
  int get idBottomNav {
    _$idBottomNavAtom.reportRead();
    return super.idBottomNav;
  }

  @override
  set idBottomNav(int value) {
    _$idBottomNavAtom.reportWrite(value, super.idBottomNav, () {
      super.idBottomNav = value;
    });
  }

  late final _$myPlantsAtom =
      Atom(name: '_HomeStore.myPlants', context: context);

  @override
  List<PlantModel> get myPlants {
    _$myPlantsAtom.reportRead();
    return super.myPlants;
  }

  @override
  set myPlants(List<PlantModel> value) {
    _$myPlantsAtom.reportWrite(value, super.myPlants, () {
      super.myPlants = value;
    });
  }

  late final _$selectedFilterAtom =
      Atom(name: '_HomeStore.selectedFilter', context: context);

  @override
  String get selectedFilter {
    _$selectedFilterAtom.reportRead();
    return super.selectedFilter;
  }

  @override
  set selectedFilter(String value) {
    _$selectedFilterAtom.reportWrite(value, super.selectedFilter, () {
      super.selectedFilter = value;
    });
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  dynamic setIdBottomNav(int newIdBottomNav) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setIdBottomNav');
    try {
      return super.setIdBottomNav(newIdBottomNav);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedFilter(String newSelectedFilter) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setSelectedFilter');
    try {
      return super.setSelectedFilter(newSelectedFilter);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addMyPlants(PlantModel newPlant) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.addMyPlants');
    try {
      return super.addMyPlants(newPlant);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
idBottomNav: ${idBottomNav},
myPlants: ${myPlants},
selectedFilter: ${selectedFilter}
    ''';
  }
}
