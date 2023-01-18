
import 'package:colors_cubit/bloc/flag_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (context) => FlagBloc()..add(LoadFlagEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<FlagBloc, FlagState>(
        builder: (context, state) {
          if(state is FlagLoaded){
            print(state.flag);
            print(state.count);
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 100,
                        //width: MediaQuery.of(context).size.width / 3,
                        color: state.count >= 1 ? state.flag.first : Colors.grey,
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 100,
                        //width: MediaQuery.of(context).size.width / 3,
                        color: state.count >= 2 ? state.flag.second : Colors.grey,
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 100,
                        //width: MediaQuery.of(context).size.width / 3,
                        color: state.count >= 3 ? state.flag.third : Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            );
          }else{
            return Center(
              child: Container(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<FlagBloc>().add(FlagPressEvent()),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 5,),
          FloatingActionButton(
            onPressed: () => context.read<FlagBloc>().add(FlagRemoveEvent()),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(height: 5,),
          FloatingActionButton(
            onPressed: () => context.read<FlagBloc>().add(FlagResetEvent()),
            tooltip: 'Reset',
            child: Icon(Icons.reset_tv),
          ),
          /*SizedBox(height: 10,),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(RemoveCounterEvent(1)),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),*/
        ],
      )
    );
  }
}
