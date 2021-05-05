import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  int num = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Happy Sinha'),
//        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('How many time you Pressed Floating Action Button'),
            SizedBox(height: 20),
            RawMaterialButton(
                child: Text('$num',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 28)),
                fillColor: Colors.blue,
                constraints:
                    BoxConstraints.tightFor(height: 50.0, width: 100.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            num++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
