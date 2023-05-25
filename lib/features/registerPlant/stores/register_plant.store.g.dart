// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_plant.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterPlantStore on _RegisterPlantStore, Store {
  late final _$timeSelectedAtom =
      Atom(name: '_RegisterPlantStore.timeSelected', context: context);

  @override
  TimeOfDay? get timeSelected {
    _$timeSelectedAtom.reportRead();
    return super.timeSelected;
  }

  @override
  set timeSelected(TimeOfDay? value) {
    _$timeSelectedAtom.reportWrite(value, super.timeSelected, () {
      super.timeSelected = value;
    });
  }

  late final _$_RegisterPlantStoreActionController =
      ActionController(name: '_RegisterPlantStore', context: context);

  @override
  dynamic setTimeSelected(TimeOfDay newTimeSelected) {
    final _$actionInfo = _$_RegisterPlantStoreActionController.startAction(
        name: '_RegisterPlantStore.setTimeSelected');
    try {
      return super.setTimeSelected(newTimeSelected);
    } finally {
      _$_RegisterPlantStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
timeSelected: ${timeSelected}
    ''';
  }
}
