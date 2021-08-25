import 'package:ana_weather/widgets/city_list.dart';
import 'package:ana_weather/widgets/search_input_box.dart';
import 'package:flutter/material.dart';

class MyCitiesPage extends StatefulWidget {
  const MyCitiesPage({Key? key}) : super(key: key);

  @override
  _MyCitiesPageState createState() => _MyCitiesPageState();
}

class _MyCitiesPageState extends State<MyCitiesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mi cities'),
        ),
        body: Column(
          children: [
            SearchInputBox(),
            CityList(),
          ],
        ),
      ),
    );
  }
}
