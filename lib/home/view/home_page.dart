import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_app/weather_forecast/view/widgets/search_widget.dart';
import '../../shared/core_utils.dart';
import '../../weather_forecast/view/weather_forecast_page.dart';
import '../store/search_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SearchStore _searchStore;

  @override
  void initState() {
    _searchStore = getIt<SearchStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            SearchWidget(),
            Expanded(
              child: Observer(
                builder: (BuildContext context) {
                  return ListView.builder(
                      itemCount: _searchStore.filteredList.length ?? 0,
                      itemBuilder: (context, index) {
                        var item = _searchStore.filteredList[index] ?? '';
                        return _searchStore.filteredList.length == 0
                            ? SizedBox.shrink()
                            : ListTile(
                                title: Text(item),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            WeatherForecastPage(
                                              city: item,
                                            )),
                                  );
                                },
                              );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
