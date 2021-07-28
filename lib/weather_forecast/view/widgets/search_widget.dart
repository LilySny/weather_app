import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/home/store/search_store.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController _searchQueryController = TextEditingController();
  SearchStore _searchStore;

  @override
  void initState() {
    _searchStore = GetIt.I<SearchStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(
        builder: (BuildContext context) {
          return TextField(
            controller: _searchQueryController,
            decoration: InputDecoration(
              hintText: "Search a city...",
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: _searchStore.filter,
          );
        },
      ),
    );
  }
}
