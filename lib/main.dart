import 'package:cubit_app/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => CounterCubit(),
  child: MaterialApp(
      home: Home(),
    ),
);
  }
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter App"),),
      body: Container(
        child: Column(
          children: [
            Center(child: BlocBuilder<CounterCubit,int>(
  builder: (context, state) {
    return Text("The value is $state",style: TextStyle(fontSize: 40),);
  },
),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton.icon(onPressed: (){
                  BlocProvider.of<CounterCubit>(context).increment();
                },label: Text("Plus"),icon: Icon(Icons.add),),

                SizedBox(width: 30,),

                FlatButton.icon(onPressed: (){
                  BlocProvider.of<CounterCubit>(context).decrement();
                },label: Text("minus"),icon: Icon(Icons.remove),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

