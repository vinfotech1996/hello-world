import 'package:flutter/material.dart';

class MyPlaces extends StatefulWidget {
  const MyPlaces({super.key});

  @override
  State<MyPlaces> createState() => _MyPlacesState();
}

class _MyPlacesState extends State<MyPlaces> {
  bool isNavalStationClickable = true;
  bool isMyPlacesClickable = false;

  @override
  void initState() {
    super.initState();
    // Set the default state of Naval Station button to clickable
    isNavalStationClickable = true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clickable Buttons'),
        actions: [
          ElevatedButton(
            onPressed:  () {
              setState(() {
                isNavalStationClickable = !isNavalStationClickable;
                isMyPlacesClickable = false;
              });
              // Handle button click
              print('Naval Station Clicked');
            }
                ,
            child: Text(
              'Naval Station',
              style: TextStyle(
                color: isNavalStationClickable ? Colors.green : Colors.yellow,
              ),
            ),
          ),
          ElevatedButton (
            onPressed:
                 () {
              setState(() {
                isMyPlacesClickable = !isMyPlacesClickable;
                isNavalStationClickable = false;
              });
              // Handle button click
              print('My Places Clicked');
            }
               ,
            child: Text(
              'My Places',
              style: TextStyle(
                color: isMyPlacesClickable ? Colors.green : Colors.yellow,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (isNavalStationClickable)
              Expanded(
                child: ListView(
                  children: [
                    ListTile(title: Text('Naval Station 1')),
                    ListTile(title: Text('Naval Station 2')),
                    ListTile(title: Text('Naval Station 3')),
                  ],
                ),
              ),
            if (isMyPlacesClickable)
              Expanded(
                child: ListView(
                  children: [
                    ListTile(title: Text('My Place 1')),
                    ListTile(title: Text('My Place 2')),
                    ListTile(title: Text('My Place 3')),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
