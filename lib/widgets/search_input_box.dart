import 'package:ana_weather/providers/city_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchInputBox extends StatefulWidget {
  SearchInputBox();

  @override
  _SearchInputBoxState createState() => _SearchInputBoxState();
}

class _SearchInputBoxState extends State<SearchInputBox> {
  final txtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CityProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: 400,
            child: TextField(
              controller: txtController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
          ),
        ),
        Container(
          width: 150,
          child: ElevatedButton(
            onPressed: () {
              provider.selectedCities = txtController.text;
            },
            child: Text('Go'),
          ),
        )
      ]),
    );
  }
}
