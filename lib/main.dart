import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rocket Launch Controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  Color _countdownColor() { //helper method to return color
    if (_counter == 0) {
      return Colors.red;
    } else if (_counter <= 50) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rocket Launch Controller'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: Colors.blue,
              child: Text(
                '$_counter',
                style: TextStyle(
                  fontSize: 50.0,
                  color: _countdownColor(), //get color from helper
                ),
                _counter == 100 ? "LIFTOFF!" : '$_counter',
                style: const TextStyle(fontSize: 50.0),
              ),
            ),
          ),
          Slider(
            min: 0,
            max: 100,
            value: _counter.toDouble(),
            onChanged: (double value) {
              setState(() {
                _counter = value.toInt();
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.red,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (_counter < 100) {
                  _counter++;
                }
              });
            },
            child: const Text("Ignite"),
          ),
          SizedBox(height: 10.0), //space between buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    if (_counter > 0) {
                      _counter--;
                    } else {
                      _counter = 0;
                    };
                  });
                },
                child: Text("Decrement"),
              ),
              SizedBox(width: 12),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _counter = 0;
                  });
                },
                child: Text("Reset"),
              )
            ],
          )
        ],
      ),
    );
  }
}