import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    //return Container();
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter GridView Demo"),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: GridView.extent(
            primary: false,
            padding: const EdgeInsets.all(16),
            crossAxisSpacing: 50,
            mainAxisSpacing: 25,
            maxCrossAxisExtent: 200.0,

            children: <Widget>[

             /* Container(
                //padding: const EdgeInsets.all(8),
                child: const Text('First',textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),

                color: Colors.yellow,
              ),*/

             /* Container(color: Colors.yellow,
                child: Align(

                  alignment: Alignment.center,
                  child: Text(
                    'First',textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20
                    ),


                  ),

                ),
              ),*/

              Container(
                child: Align(

                  alignment: Alignment.center,
                  child: Text(
                    'First',textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,  color: Colors.white,
                    ),


                  ),

                ),
                //child: Center(child: Text('test'),),
                //child: const Text('First',textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
                //height: 190.0,
                //width: MediaQuery.of(context).size.width - 100.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.yellow,
                    image: DecorationImage(
                      image: AssetImage("assets/images/img.png"),
                     // image: new NetworkImage("https://i.imgur.com/BoN9kdC.png"),
                      //image: NetworkImage("https://cdn.pixabay.com/photo/2014/02/27/16/10/tree-276014_960_720.jpg"),
                      //image: new ExactAssetImage('assets/images/img.png'),
                        fit: BoxFit.contain,
                          //image: new NetworkImage('https://pixlok.com/images/blue-glowing-circle-png-image-free-download/'  ),
                     // image: AssetImage('assets/images/img.png'), //Image.asset('assets/images/GeeksforGeeks.jpg'),

                      alignment: Alignment.topCenter,

                        //fit: BoxFit.fill
                    )
                ),
              ),


              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Second', style: TextStyle(fontSize: 20)),
                color: Colors.blue,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Third', style: TextStyle(fontSize: 20)),
                color: Colors.blue,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Four', style: TextStyle(fontSize: 20)),
                color: Colors.yellow,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Fifth', style: TextStyle(fontSize: 20)),
                color: Colors.yellow,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Six', style: TextStyle(fontSize: 20)),
                color: Colors.blue,
              ),
            ],
          )),
    );
  }
}
