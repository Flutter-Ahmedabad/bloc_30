import 'package:bloc_30/bloc/couter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CounterBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page1(),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        buildWhen: (previous, current) {
          if (previous is CouterLoaded) {
            if (previous.currentValue.isOdd) {
              return true;
            }
          }
          return false;
        },
        builder: (context, state) {
          if (state is CounterInitial) {
            return Container(
              child: Center(
                child: Text('0'),
              ),
            );
          } else if (state is CouterLoaded) {
            return Container(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${state.currentValue}',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      '${state.currentValueOfPlus2}',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              child: Center(
                child: Text('Something went wrong'),
              ),
            );
          }
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              var counterBloc =
                  BlocProvider.of<CounterBloc>(context, listen: false);
              counterBloc.add(IncrementCounterEvent());
            },
            child: Icon(
              Icons.add,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              var counterBloc =
                  BlocProvider.of<CounterBloc>(context, listen: false);
              counterBloc.add(ResetCounterEvent());
            },
            child: Icon(
              Icons.refresh,
            ),
          ),
        ],
      ),
    );
  }
}
