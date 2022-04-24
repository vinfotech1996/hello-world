import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Learn Flutter'),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
                child: DataTable(
              columns: [
                DataColumn(
                  label: Text('Verified'),
                ),
                DataColumn(
                  label: Text('Phone'),
                ),
                DataColumn(
                  label: Text('Phone'),
                ),
                DataColumn(
                  label: Text('Phone'),
                ),
                DataColumn(
                  label: Text('Phone'),
                ),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Stephen')),
                  DataCell(Text('Stephen')),
                  DataCell(Text('Stephen')),
                  DataCell(Text('Stephen')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Stephen')),
                  DataCell(Text('Stephen')),
                  DataCell(Text('Stephen')),
                  DataCell(Text('Stephen')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Stephen')),
                  DataCell(Text('Stephen')),
                  DataCell(Text('Stephen')),
                  DataCell(Text('Stephen')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Stephen')),
                  DataCell(Text('Stephen')),
                  DataCell(Text('Stephen')),
                  DataCell(Text('Stephen')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Stephen')),
                  DataCell(Text('Stephen')),
                  DataCell(Text('Stephen')),
                  DataCell(Text('Stephen')),
                ]),
              ],
            )))

        /*Container(
        margin: EdgeInsets.all(20),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Show Toast"),
              onPressed: () {
                showToast();
              },
            ),
            ElevatedButton(
              child: Text("Show Custom Toast"),
              onPressed: () {
                //showCustomToast();
              },
            ),
          ],
        ),
      )*/

        /*Center(*/
        //child: Text('Hello World'),
        //new Text('test txt', textAlign: TextAlign.center,style: new TextStyle(fontWeight: FontWeight.bold),)

        //----------------FlatButton Example
        /*FlatButton(child: Text("Click here"),
          onPressed: () {
          showToast();  },)*/

        //--------------RaisedButton Example
        /*new RaisedButton(
        child: Text("Click here"),
        elevation: 5.0,
        onPressed: () {
          // Do something here
          showToast();
        },),*/

        /*Center(
        child: Text('We have pressed the button times.'),
      ),

      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                'Welcome to Javatpoint',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                ),
              ),
            ),
            ListTile(
              title: Text('1'),
            ),
            ListTile(
              title:  Text("All Mail Inboxes"),
              leading:  Icon(Icons.mail),
            ),
            Divider(
              height: 0.2,
            ),
            ListTile(
              title:  Text("Primary"),
            ),
            ListTile(
              title:  Text("Social"),
            ),
            ListTile(
              title:  Text("Promotions"),
            ),
          ],
        ),
      ),*/

        /*ListView(children: <Widget>[
    Center(
      child: Text(
        'People-Chart',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      )
    ),

        DataTable(
          columns: [
            DataColumn(label: Text(
                'ID',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
            )),
            DataColumn(label: Text(
                'Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
            )),
            DataColumn(label: Text(
                'Profession',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
            )),
            DataColumn(label: Text(
                'Hobbyy',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
            )),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('Stephen')),
              DataCell(Text('Actor')),
              DataCell(Text('criket')),
            ]),
            DataRow(cells: [
              DataCell(Text('5')),
              DataCell(Text('John')),
              DataCell(Text('Student')),
              DataCell(Text('readdd')),
            ]),
            DataRow(cells: [
              DataCell(Text('10')),
              DataCell(Text('Harry')),
              DataCell(Text('Leader')),
              DataCell(Text('tofan')),
            ]),
            DataRow(cells: [
              DataCell(Text('15')),
              DataCell(Text('Peter')),
              DataCell(Text('Scientist')),
              DataCell(Text('fadafadi')),
            ]),
          ],
        ),
      ])*/

        /*),*/
        );
  }

  void showToast() {
    Fluttertoast.showToast(
      msg: "Hi Codesinsider !!",
      //toastLength: Toast.LENGTH_LONG,
    );
  }
}
