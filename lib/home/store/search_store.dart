import 'package:mobx/mobx.dart';

part 'search_store.g.dart';

class SearchStore = _SearchStore with _$SearchStore;

abstract class _SearchStore with Store {
  @observable
  List<String> cities = [
    'Silverstone, UK',
    'São Paulo, Brazil',
    'Melbourne, Australia',
    'Monte Carlo, Monaco',
  ];

  @observable
  ObservableList<String> filteredList = ObservableList.of([
    'Silverstone, UK',
    'São Paulo, Brazil',
    'Melbourne, Australia',
    'Monte Carlo, Monaco',
  ]);

  @action
  void filter(String query) {
    filteredList = cities
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList()
        .asObservable();
  }
}
