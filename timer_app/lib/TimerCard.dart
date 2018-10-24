import 'package:flutter/material.dart';
import 'dart:async';





class TimerCard extends StatefulWidget {
 final String title;
 final Color backgroundColor;
 final VoidCallback onDeleteButtonPressed;
  @override
  _TimerCardState createState() => _TimerCardState();
  const TimerCard({Key key, this.title,this.backgroundColor,this.onDeleteButtonPressed}): super(key: key);
}

class _TimerCardState extends State<TimerCard> {
  Stopwatch stopwatch = Stopwatch();
  String timerbuttonLabel;
  Timer timer;
  String timeElapsed;
  @override
  void initState() {
    // TODO: implement initState
    timer = Timer.periodic(Duration(milliseconds: 15), callback);
    timeElapsed = " ";
    timerbuttonLabel = "START";
    super.initState();
  }

  callback(Timer timer) {
    setState(() {
      timeElapsed = stopwatch.elapsed.toString();
    });
  }

  void timerStartStop() {
   setState(() {
        
     
    if (stopwatch.isRunning) {
      stopwatch.stop();
      timerbuttonLabel = "START";
      
    } else {
      
      stopwatch.start();
      timerbuttonLabel = "STOP";
     
    }
     });
  }
  void timerReset()
  {
    stopwatch.reset();
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.0,
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(8.0),
      color:widget.backgroundColor,
      child: Column(
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(color: Colors.white, fontSize: 30.0),
          ),
          Expanded(child: Container()),
          Text(
            timeElapsed,
            style: TextStyle(fontSize: 20.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text(
                  timerbuttonLabel,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: timerStartStop,
              ),
              FlatButton(
                child: Text(
                  "RESET",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: timerReset,
              ),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                onPressed: widget.onDeleteButtonPressed,
              )
            ],
          )
        ],
      ),
    );
  }
}
