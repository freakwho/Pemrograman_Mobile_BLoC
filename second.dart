import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterappbloc/color_blox.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ColorBlox>(
        builder: (context) => ColorBlox(),
        child: MainPage()),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBlox bloc = BlocProvider.of<ColorBlox>(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: null,
            backgroundColor: Colors.amber,
            onPressed: () {
              bloc.dispatch(ColorEvent.to_amber);
            },
          ),
          SizedBox(width: 10,),
          FloatingActionButton(
            heroTag: null,
            backgroundColor: Colors.lightBlue,
            onPressed: () {
              bloc.dispatch(ColorEvent.to_light_blue);
            },
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Navigator.pop(context);
            }, backgroundColor: Colors.black,
            child: Text("Back"),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("BLoC dengan flutter_bloc"),
      ),
      body: Center(
        child: BlocBuilder<ColorBlox, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            width: 100,
            height: 100,
            color: currentColor,
            duration: Duration(milliseconds: 500),
          ),
        ),
      ),
    );
  }
}
