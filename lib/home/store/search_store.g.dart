// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStore, Store {
  final _$citiesAtom = Atom(name: '_SearchStore.cities');

  @override
  List<String> get cities {
    _$citiesAtom.reportRead();
    return super.cities;
  }

  @override
  set cities(List<String> value) {
    _$citiesAtom.reportWrite(value, super.cities, () {
      super.cities = value;
    });
  }

  final _$filteredListAtom = Atom(name: '_SearchStore.filteredList');

  @override
  ObservableList<String> get filteredList {
    _$filteredListAtom.reportRead();
    return super.filteredList;
  }

  @override
  set filteredList(ObservableList<String> value) {
    _$filteredListAtom.reportWrite(value, super.filteredList, () {
      super.filteredList = value;
    });
  }

  final _$_SearchStoreActionController = ActionController(name: '_SearchStore');

  @override
  void filter(String query) {
    final _$actionInfo =
        _$_SearchStoreActionController.startAction(name: '_SearchStore.filter');
    try {
      return super.filter(query);
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cities: ${cities},
filteredList: ${filteredList}
    ''';
  }
}
