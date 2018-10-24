import 'package:flutter/material.dart';
import 'TimerCard.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    ));

    List<String> items = [];
    int position=0;

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deleteable timer"),
        leading: Icon(Icons.menu),actions: <Widget>[IconButton(icon: Icon(Icons.add,color:Colors.white),onPressed: (){setState(() {
                  items.add("Timer no. $position");position++;print(items);
                }); },)],
      ),
      body: MyBody(),
    );
  }
}


class MyBody extends StatefulWidget {
  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemExtent: 155.0,
      itemBuilder: (context, index) {
        final pkey = items[index];
        return TimerCard(
          key: Key(pkey),
          title: pkey,
          backgroundColor: Colors.red,
          onDeleteButtonPressed: () {
            setState(() {
              items.removeAt(index);
              
              print(items);
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(
                  "You have deleted $pkey",
                ),
                duration: Duration(milliseconds: 500),
              ));
            });
          },
        );
      },
    );
  }
}
