import 'package:flutter/material.dart';
import 'package:flutterappbloc/color_bloc.dart';
import 'package:flutterappbloc/second.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Screen()
    );
  }
}

class Screen extends StatelessWidget {
  ColorBloc bloc = ColorBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: null,
            backgroundColor: Colors.amber,
            onPressed: () {
              bloc.eventSink.add(ColorEvent.to_amber);
            },
          ),
          SizedBox(width: 10,),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              bloc.eventSink.add(ColorEvent.to_light_blue);
            },
            backgroundColor: Colors.lightBlue,
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Second()),
            );
          }, backgroundColor: Colors.black,
            child: Text("Next"),
          ),
        ],
      ),
      appBar: AppBar(title: Text("BLoC tanpa Library"),),
      body: Center(
        child: StreamBuilder(
          stream: bloc.stateStream,
          initialData: Colors.amber,
          builder: (context, snapshot){
            return AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 100,
              height: 100,
              color: snapshot.data,
            );
          },
        ),
      ),
    );
  }
}