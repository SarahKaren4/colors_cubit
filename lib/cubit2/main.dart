import 'package:colors_cubit/cubit2/flag_cubit.dart';
import 'package:colors_cubit/cubit2/flag_state.dart';
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
          create: (context) => FlagCubit()..LoadFlag(),
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
        body: BlocBuilder<FlagCubit, FlagState>(
          builder: (context, state) {
            if (state is FlagLoaded) {
              //  print(state.couleurBas);
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
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100,
                          //width: MediaQuery.of(context).size.width / 3,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100,
                          //width: MediaQuery.of(context).size.width / 3,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 100,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: 10,
                        itemBuilder: (BuildContext ctx, index) {
                          int indexcouleur = (state.couleurBas
                              .indexOf(state.couleurBas[index]));

                          return GestureDetector(
                            onTap: () => context.read<FlagCubit>().FlagPress(
                                state.couleurBas[index], indexcouleur),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: state.statusCouleurBas
                                      ? state.couleurBas[index]
                                      : Colors.grey,
                                  // color: state.couleurBas[index],
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(index.toString()),
                            ),
                          );
                        }),
                  ),
                ],
              );
            } else {
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
              onPressed: () =>
                  context.read<FlagCubit>().FlagPress(Colors.black, 1),
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            SizedBox(
              height: 5,
            ),
            FloatingActionButton(
              onPressed: () => context.read<FlagCubit>().FlagRemove(),
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
            SizedBox(
              height: 5,
            ),
            FloatingActionButton(
              onPressed: () => context.read<FlagCubit>().FlagReset(),
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
        ));
  }
}
