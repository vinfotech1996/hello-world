
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Notch Bottom Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: const  MyHomePage(),
      home: ChangeNotifierProvider(
        create: (_) => MyProviderData(),
        child: FavScreen(),
      ),
    );
  }
}
------------------------------------------------------------

  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_provider_data.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  _FavScreenState createState() => _FavScreenState();
}
class _FavScreenState extends State<FavScreen> {
  @override
  void initState() {
    super.initState();
    // Remove the fetchData() call from initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Enter city name',
          ),
          onSubmitted: (value) {
            Provider.of<MyProviderData>(context, listen: false).saveCity(value);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final cityData = Provider.of<MyProviderData>(context, listen: false);
              cityData.saveCity(cityData.textController.text);
            },
          ),
        ],
      ),
      body: Consumer<MyProviderData>(
        builder: (context, cityData, child) {
          if (!cityData.isDataFetched) {
            // Fetch data if it hasn't been fetched yet
            cityData.fetchData();
            return Center(child: CircularProgressIndicator());
          } else {
            // Data has been fetched, display UI
            return ListView.builder(
              itemCount: cityData.favCityNames.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.network(cityData.cityImages[index]),
                  title: Text(cityData.favCityNames[index]),
                  subtitle: Text(cityData.minMaxTemps[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      cityData.deleteCity(cityData.favCityNames[index]);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}


---------------------------------------------------------


  import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyProviderData extends ChangeNotifier {

  List<String> favCityNames = [];
  List<String> cityImages = [];
  List<String> minMaxTemps = [];
  final textController =TextEditingController();
  bool _isDataFetched = false;

  bool get isDataFetched => _isDataFetched;



  Future<void> fetchData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay

    // Fetch list of favorite city names
    // var response = await http.get(Uri.parse('YOUR_FAV_CITY_API'));
    // var data = json.decode(response.body);
  //  favCityNames = List<String>.from(data['favCityNames']);
    // Create a map to store city data (assuming unique city names)
    Map<String, Map<String, String>> cityDataMap = {
      "city1": {
        "city": "Ahmbad",
        "cId": "001"
      },
      "city2": {
        "city": "Gngr",
        "cId": "002"
      },
      "city3": {
        "city": "Surat",
        "cId": "003"
      }
    };
    cityDataMap.forEach((key, value) {
      favCityNames.add(value["city"]!);
    });

    print("favCityNames---$favCityNames");

    // Fetch additional data for each city
    for (var city in favCityNames) {
      // var imgResponse = await http.get(Uri.parse('YOUR_IMG_ENDPOINT?city=$city'));
      // var tempResponse = await http.get(Uri.parse('YOUR_TEMP_ENDPOINT?city=$city'));
      //
      // var imgData = json.decode(imgResponse.body);
      // var tempData = json.decode(tempResponse.body);

      Map<String, Map<String, String>> cityDataMap = {
        "city1": {  // Use unique keys like "city1", "city2", etc.
          "city": "Ahmbad",
          "cId": "001"
        }
      };

      cityImages.add("https://via.placeholder.com/350x150");
      minMaxTemps.add("25 C");
    }

    print("cityImages---$cityImages");
    print("minMaxTemps---$minMaxTemps");
    print("favCityNames---$favCityNames");

    _isDataFetched = true; // Set data fetched flag to true

    // Notify listeners that the data has been updated
    notifyListeners();
  }

  Future<void> deleteCity(String city) async {
    // Send delete request to remove city from favorite list
   /* await http.delete(Uri.parse('YOUR_DELETE_API/$city'));

    // Update UI by removing the city from the list
    favCityNames.remove(city);
    cityImages.remove(city); // Assuming cityImages and minMaxTemps are also updated accordingly
    minMaxTemps.remove(city);*/

    notifyListeners();
  }

  Future<void> saveCity(String city) async {
    // Send save request to add city to favorite list
   /* await http.post(Uri.parse('YOUR_SAVE_API'), body: {'city': city});

    // Update UI by adding the city to the list
    favCityNames.add(city);
    // Assuming cityImages and minMaxTemps are also updated accordingly
    cityImages.add('NEW_IMAGE_URL');
    minMaxTemps.add('NEW_TEMP_DATA');
*/
    notifyListeners();
  }

}

  
