import 'package:ana_weather/providers/city_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchInputBox extends StatelessWidget {
  const SearchInputBox();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CityProvider>(context);
    final txtController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: 400,
            child: TextField(
              onChanged: (value) {
                txtController.text = value;
              },
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
              print(txtController.text);

              provider.selectedCities = txtController.text;
            },
            child: Text('Go'),
          ),
        )
      ]),
    );
  }
}
