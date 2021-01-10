import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../store/actions.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(child: ListTile(title: Text('tap to close'),onTap: (){
        Navigator.of(context).pop();
      },),),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            StoreConnector<int, String>(
                converter: (store) => store.state.toString(),
                builder: (context, viewModel) {
                  return Column(
                    children: [
                      Text(viewModel, style: TextStyle(fontSize: 24)),
                      Text(viewModel, style: TextStyle(fontSize: 24)),
                      FlatButton(
                        child: Text('nextscreen'),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => secondscreen()));
                        },
                      )
                    ],
                  );
                }),
            StoreConnector<int, VoidCallback>(converter: (store) {
              return () => store.dispatch(actions.increment);
            }, builder: (context, callback) {
              return FlatButton(
                  child: Text('Add 1', style: TextStyle(color: Colors.white)),
                  color: Colors.orange,
                  onPressed: callback);
            }),
                StoreConnector<int, VoidCallback>(converter: (store) {
                  return () => store.dispatch(actions.decrement);
                }, builder: (context, callback) {
                  return FlatButton(
                      child: Text('Subtract 1', style: TextStyle(color: Colors.white)),
                      color: Colors.orange,
                      onPressed: callback);
                })
          ])),
    );
  }
}

class secondscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(child: ListTile(title: Text('tap to close'),onTap: (){
        Navigator.of(context).pop();
      },),),
      body: StoreConnector<int, String>(
          converter: (store) => store.state.toString(),
          builder: (context, view) {
            return Center(
              child: Text(view.toString()),
            );
          }),
    );
  }
}
