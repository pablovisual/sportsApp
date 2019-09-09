import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, String title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  static var  min = TextEditingController();
  var sec = TextEditingValue();
  
  static int i = min as int;

  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),

    );

  }
  
  bool possLeft = false;
  bool possRight = false;
  bool rightarrow1 = false;
  bool rightarrow2 = false;
  bool leftarrow1 = false;
  bool leftarrow2 = false;
  int left = 0;
  int right = 0;


  int home = 0;
  int guest = 0;
  int period = 1; 
  int homefouls = 0;
  int guestfouls = 0;
  int tl = 5;
  int tl2 = 5;
  

  void _homethreepoints(){
    setState(() {

      if(home == 197 || home == 198){
        home = 199;
      }
     else if(home < 199){
        home += 3;
      } 
    });
  }

  void _hometwopoints(){
    setState(() {
      if(home == 198){
        home = 199;
      }
     else if(home < 199){
        home += 2;
      } 
    });
  }

  void _homeonepoint(){
    setState(() {
     if(home < 199){
        home++;
      } 
    });
  }

  void _homeminusthree(){
    setState(() {
      if(home == 2 || home == 1){
        home = 0;
      }
      else if(home > 0){
        home -= 3;
      }

    });
  }

  void _homeminustwo(){
    setState(() {
      if(home == 1){
        home = 0;
      }
      else if(home > 0){
        home -= 2;
      }
      
    });
  }

  void _homeminusone(){
    setState(() {
      if(home > 0){
        home--;
      }
      
    });
  }

  void _guestthreepoints(){
    setState(() {
      if(guest == 197 || guest == 198){
        guest = 199;
      }
      else if(guest < 199){
        guest += 3;
      }
    });
  }

  void _guesttwopoints(){
    setState(() {
      if(guest == 198){
        guest = 199;
      }
      else if(guest < 199){
        guest += 2;
      } 
    });
  }

  void _guestonepoint(){
    setState(() {
      if(guest < 199){
       guest++;
      } 
    });
  }

  void _guestminusthree(){
    setState(() {
      if(guest == 2 || guest == 1){
        guest = 0;
      }
      else if(guest > 0){
        guest -= 3;
      }
      
    });
  }

  void _guestminustwo(){
    setState(() {
      if(guest == 1){
        guest = 0;
      }
      else if(guest > 0){
        guest -= 2;
      } 
    });
  }

  void _guestminusone(){
    setState(() {
      if(guest > 0){
        guest--;
      } 
    });
  }

  void _period(){
    setState(() {
     if(period < 4){
       period++;
     } 
    });
  }

  void _homefouls(){
    setState(() {
     homefouls++; 
    });
  }

  void _guestfouls(){
    setState(() {
     guestfouls++; 
    });
  }

  void _tl(){
    setState(() {
      if(tl > 0){
        tl--;
      } 
    });
  }

  void _tl2(){
    setState(() {
      if(tl2 > 0){
        tl2--;
      }
    });
  }

  bool timerFinished(){
    if(controller.value == 0.0){
      return true;
    }
    return false;
    
  }

  void _buzzers(){
    setState(() {

       _buzzer();
    
    });
  }

  void _buzzer(){
    setState(() {
     AudioCache player = new AudioCache();
     const alarmAudioPath = "buzzer.mp3";
     player.play(alarmAudioPath); 
    });
  }

  void _reset(){
    setState(() {
     possLeft = false;
     possRight = false;
     rightarrow1 = false;
     rightarrow2 = false;
     leftarrow1 = false;
     leftarrow2 = false;
     left = 0;
     right = 0;
     home = 0;
     guest = 0;
     period = 1; 
     homefouls = 0;
     guestfouls = 0;
     tl = 5;
     tl2 = 5;
     controller.reset();
    });
  }
  @override
  Widget build(BuildContext context) {
    var value;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body:
      Stack(
        children: <Widget>[
          Container(
            color: Colors.green[900],
          ),

          Row(//display the timer background
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[ 
              Padding(
                padding: const EdgeInsets.only(top:22.9),
                child: Container(
                  //color: Colors.white,
                  height: 200,
                  width: 450,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 3.0,
                      color: Colors.black
                    )
                  ),
                
                  child: Text( '88:88', style: TextStyle(fontSize: 200.0, fontFamily: 'DS-Digital', color: Colors.grey[350]), textAlign: TextAlign.center), 
                ),
              ),
            ],
          ),

          

          Row(//display the countdown
                           mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              AnimatedBuilder(
                                  animation: controller,
                                  builder: (BuildContext context, Widget child) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top:25.9, left:1.0),
                                      child: new Text(
                                        timerString,
                                        style: TextStyle(fontSize: 200.0, fontFamily: 'DS-Digital', color: Colors.red[900]),
                                      ),
                                    );
                                  }),
                            ],
                          ),

          Row(//display home and guest text
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:15.0, top: 8.5),
                    child: Container(
                      //margin: const EdgeInsets.only(top:5.0, bottom: 5.0),
                      //padding: const EdgeInsets.all(3.0),
                      child: Text('HOME', style: TextStyle(fontSize: 120.0, color: Colors.white, fontWeight: FontWeight.bold)),
                    //Text('Guest', style: TextStyle(fontSize: 128),),
                      ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0, top: 8.5),
                    child: Container(
                      //margin: const EdgeInsets.all(15.0),
                      //padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 30.0),
                      child: Text('GUEST', style: TextStyle(fontSize: 120.0, color: Colors.white, fontWeight: FontWeight.bold)),

                    ),
                  )
                  
                ],
              ),

          Row(//display score, both sides
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0, top: 132.0),
                      child: Container(
                        height: 180.0,
                        width: 230.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 3.0,
                            color: Colors.black
                          )
                        ),
                        child: Text(
                          '188', style: TextStyle(
                            fontSize: 180.0, 
                            fontFamily: 'DS-Digital', 
                            color: Colors.grey[350],
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 60.0, top: 132.0),
                      child: Container(
                        height: 180.0,
                        width: 230.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 3.0,
                            color: Colors.black
                          )
                        ),
                        child: Text(
                          '188',
                          style: TextStyle(
                            fontSize: 180.0, 
                            fontFamily: 'DS-Digital', 
                            color: Colors.grey[350],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )

                  ],
                ),

          Row(//add home points
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0, top: 132.0),
                        child: Container(
                          height: 180,
                          width: 230,
                          decoration: BoxDecoration(
                            
                            border: Border.all(
                              width: 3.0,
                              color: Colors.black
                            )
                          ),
                          child: Text(
                            '$home',
                            style: TextStyle(
                              fontSize: 180.0,
                              fontFamily: 'DS-Digital',
                              color: Colors.orange
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),

          Padding(//add points guests
                  padding: const EdgeInsets.only(top: 135.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(right: 62.5),
                          child: Text(
                            '$guest',
                            style: TextStyle(
                              fontSize: 180.0,
                              fontFamily: 'DS-Digital',
                              color: Colors.orange
                            ),
                          ),
                        )
                    ],
                  ),
                ),

          Padding(//display arrows
                  padding: const EdgeInsets.only(right: 181.0, top: 240.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RotatedBox(
                        quarterTurns: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 100.0),
                          child: Icon(
                            Icons.navigation,
                            color: Colors.white,
                            size: 50.0,
                          ),
                        ),
                      ),

                      RotatedBox(
                        quarterTurns: 1,
                        child: Icon(
                          Icons.navigation,
                          color: Colors.white,
                          size: 50.0,
                        ),
                      )
                    ],
                  ),
                ),

                possLeft ? Row(children: <Widget>[Padding(
              padding: const EdgeInsets.only(top: 239.99,left: 449.5),
              child: RotatedBox( quarterTurns: 3, child:Icon(Icons.navigation, color: Colors.red[900], size: 50),
            ))],): SizedBox(),

            possRight ? Row(children: <Widget>[Padding(
              padding: const EdgeInsets.only(top: 240.0,left: 599.68),
              child: RotatedBox( quarterTurns: 1, child:Icon(Icons.navigation, color: Colors.red[900], size: 50),
            ))],): SizedBox(),


          Row(//disply POSS
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 240.0, right: 180.0),
                      child: Text(
                        'POSS',
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ),
                  ],
                ),

          Row(//display period
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 286.0, right: 180.0),
                      child: Text(
                        'PERIOD', 
                        style: TextStyle(
                          fontSize: 45.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ),                  ],
                ),

          Row(//display period number
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    Padding(
                      padding: const EdgeInsets.only(left: 142.0, top: 250),
                      child: Container(
                        height: 120.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 3.0,
                            color: Colors.black
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 7.5),
                          child: Text(
                            '8', 
                            style: TextStyle(
                              fontSize: 120.0,
                              fontFamily: 'DS-Digital',
                              color: Colors.grey[350],
                              
                            )
                          ),
                        ),
                      ),
                    )
                  ],
                ),

          Row(//quarter counter
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 142.0, top: 250),
                        child: Container(
                          height: 120.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3.0,
                              color: Colors.black
                            )
                          ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                              '$period',
                              style: TextStyle(
                                fontSize: 120.0,
                                fontFamily: 'DS-Digital',
                                color: Colors.orange
                              ),
                              textAlign: TextAlign.right,
                            ),
                        ),
                        ),
                      ),
                    ],
                  ),
                
          Padding(//center buttons
                  padding: const EdgeInsets.only(top: 382.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.white,
                        child: AnimatedBuilder(
                animation: controller,
                builder: (BuildContext context, Widget child){
                  return Icon( controller.isAnimating
                  ? Icons.pause
                  : Icons.play_arrow
                  );
                }
              ),
              onPressed: (){
                if(controller.isAnimating){
                  controller.stop();
                }

                else{
                  controller.reverse(
                    from: controller.value == 0.0
                    ? 1.0
                    : controller.value);
                    if(timerFinished()){
                      _buzzers();
                    }
                  
                }
              },
                      ),

                      RaisedButton(
                        color: Colors.white,
                        child: Text(
                          'NEXT PRD'
                        ),
                        onPressed: (){
                          _period();
                        },
                      ),

                      RaisedButton(
                        color: Colors.white,
                        child: Text(
                          'RESET'
                        ),
                        onPressed: (){
                          _reset();
                        },
                      ),
                      Container(
                        height: 38,
                        width: 100,
                        color: Colors.white,
                       child: TextField(
                        
                         controller: min,
                         keyboardType: TextInputType.number,
                         onSubmitted: (v) => Navigator.pop(context, v),
                         
                         
                       )
                      )
                      
                    ],
                  ),
                ),

          Padding(//display bonus text
                  padding: const EdgeInsets.only(top: 380.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 125.0),
                        child: Text(
                          'BONUS',
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 125.0),
                        child: Text(
                          'BONUS',
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      )
                    ]
                  ),
                ),

          Padding(//display double arrows for the bonus
                  padding: const EdgeInsets.only(top: 382.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RotatedBox(
                        quarterTurns: 3,
                        
                        child: Icon(
                          Icons.navigation,
                          color: Colors.white,
                          size: 50.0,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 520.0),
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Icon(
                            Icons.navigation,
                            color: Colors.white,
                            size: 50.0,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 520.0),
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Icon(
                            Icons.navigation,
                            color: Colors.white,
                            size: 50.0,
                          ),
                        ),
                      ),

                      RotatedBox(
                        quarterTurns: 1,
                        child: Icon(
                          Icons.navigation,
                          color: Colors.white,
                          size: 50.0,
                        ),
                      ),
                    ],
                  ),
                ),

                rightarrow1 ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[Padding(
              padding: const EdgeInsets.only(top: 382.5,right: 20.0),
              child: RotatedBox( quarterTurns: 1, child:Icon(Icons.navigation, color: Colors.red[900], size: 50),
            ))],): SizedBox(),

            rightarrow2 ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[Padding(
              padding: const EdgeInsets.only(top: 382.5, right: 70.0),
              child: RotatedBox( quarterTurns: 1, child:Icon(Icons.navigation, color: Colors.red[900], size: 50),
            ))],): SizedBox(),

            leftarrow1 ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[Padding(
              padding: const EdgeInsets.only(top: 382.5,left: 20.0),
              child: RotatedBox( quarterTurns: 3, child:Icon(Icons.navigation, color: Colors.red[900], size: 50),
            ))],): SizedBox(),

            leftarrow2 ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[Padding(
              padding: const EdgeInsets.only(top: 382.5,left: 70.0),
              child: RotatedBox( quarterTurns: 3, child:Icon(Icons.navigation, color: Colors.red[900], size: 50),
            ))],): SizedBox(),

          Padding(//display fouls text
            padding: const EdgeInsets.only(left: 16.0, bottom: 150.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Text('FOULS', style: TextStyle(fontSize: 45.0, color: Colors.white, fontWeight: FontWeight.bold))
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 18.0, ),
                  child: Text(
                    'FOULS',
                    style: TextStyle(
                      fontSize: 45.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          ),

          Row(//the fouls displayer
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:15.0, bottom: 20.0),
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Container(
                      height: 136,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 3.0,
                          color: Colors.black
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 3.0),
                        child: Text('88', style: TextStyle(fontSize: 127.0, fontFamily: 'DS-Digital', color: Colors.grey[350])),
                      ),
                    ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 15.0, bottom: 20.0),
                    child: Container(
                      height: 136,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 3.0,
                          color: Colors.black
                        )
                      ),
                      //color: Colors.white,
                      
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 3.0),
                        child: Text('88', style: TextStyle(fontSize: 127.0, fontFamily: 'DS-Digital', color: Colors.grey[350])),
                      ),
                    ),
                  )
                ],
              ),

          Row(//add fouls
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:15.0, bottom: 20.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 136,
                        width: 140,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3.0,
                            color: Colors.black                          )
                        ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0, top: 3.0),
                        child: Text(
                          '$homefouls',
                          style: TextStyle(
                            fontSize: 127.0,
                            fontFamily: 'DS-Digital',
                            color: Colors.orange
                          ),
                          textAlign: TextAlign.right,
                          ),
                      ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 22.2, bottom: 23.0),
                    child: Text(
                      '$guestfouls',
                      style: TextStyle(
                        fontSize: 127.0,
                        fontFamily: 'DS-Digital',
                        color: Colors.orange
                      ),
                    ),
                  )
                ],
              ),

          Padding(//display timeouts left text
                padding: const EdgeInsets.only(top: 570.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'TIMEOUTS',
                        style: TextStyle(
                        fontSize: 70.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                     ),
                    ),
                    Text(
                      'LEFT',
                      style: TextStyle(
                        fontSize: 70.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),

          Padding(//display timeouts text
            padding: const EdgeInsets.only(top: 570.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(right:100.0),
                    child: Container(
                      height: 136.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 3.0,
                          color: Colors.black
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7.5),
                        child: Text(
                          '8', 
                          style: TextStyle(
                            fontSize: 127.0,
                            fontFamily: 'DS-Digital',
                            color: Colors.grey[350],   
                          )
                        ),
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 136.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 3.0,
                        color: Colors.black
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6.5),
                      child: Text(
                        '8', 
                        style: TextStyle(
                          fontSize: 127.0,
                          fontFamily: 'DS-Digital',
                          color: Colors.grey[350],   
                        )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(//sub T.O.L
            padding: const EdgeInsets.only(top: 566.8, right: 347.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 340.5, bottom: 19.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(right:100.0),
                      child: Container(
                        height: 136.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3.0,
                            color: Colors.black
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Text(
                            '$tl',
                            style: TextStyle(
                              fontSize: 127.0,
                              fontFamily: 'DS-Digital',
                              color: Colors.orange
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    )
                  ),
                ),

                Text(
                  '$tl2',
                  style: TextStyle(
                    fontSize: 127.0,
                    fontFamily: 'DS-Digital',
                    color: Colors.orange
                  ),
                ),   
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: 
       BottomAppBar(
        child: Container( 
          height: 100.0,
          width: double.infinity,
          color: Colors.green[900],
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'HOME',
                  style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
                ),
                RaisedButton(
                  color: Colors.white,
              child: Text(
                '+3',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: (){
                _homethreepoints();
                setState(() {
                 possRight = true;
                 if(possLeft){
                   possLeft = false;
                 }  
                });
              },
            ),

            RaisedButton(
              color: Colors.white,
              child: Text(
                '+2',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: (){
                _hometwopoints();
                setState(() {
                 possRight = true;
                 if(possLeft){
                   possLeft = false;
                 }  
                });
              },
            ),

            RaisedButton(
              color: Colors.white,
              child: Text(
                '+1',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: (){
                _homeonepoint();
                setState(() {
                 possRight = true;
                 if(possLeft){
                   possLeft = false;
                 }  
                });
              },
            ),

            RaisedButton(
              color: Colors.white,
              child: Text(
                'FOUL',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: (){
                _homefouls();
              },
            ),

            

            RaisedButton(
              color: Colors.white,
              child: Text(
                'POSS',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            
              onPressed: (){
               setState(() {
                possLeft = true;
                if(possRight){
                  possRight = false;
                }
               });
              },
            ),

            RaisedButton(
              color: Colors.white,
              child: Text(
                '-T.O.L',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: (){
                _tl();
              },
            ),

            
            RaisedButton(
              color: Colors.white,
              child: Text(
                '-3',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: (){
                _homeminusthree();
              },
            ),

            RaisedButton(
              color: Colors.white,
              child: Text(
                '-2',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: (){
                _homeminustwo();
              },
            ),

            RaisedButton(
              color: Colors.white,
              child: Text(
                '-1',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              
              onPressed: (){
                _homeminusone();
              },
            ),

            RaisedButton(
              color: Colors.white,
              child: Text(
                'BONUS',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: (){
                leftarrow2 = true;
                setState(() {
                 if(left == 1){
                   leftarrow1 = true;
                 }
                 left += 1;
                });
              },
            )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'GUEST',
                  style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold
                ),
                ),
                RaisedButton(
                  color: Colors.white,
              child: Text(
                '+3',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: (){
                _guestthreepoints();
                setState(() {
                 possLeft = true;
                 if(possRight){
                   possRight = false;
                 }  
                });
              },
            ),

            RaisedButton(
              color: Colors.white,
              child: Text(
                '+2',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: (){
                _guesttwopoints();
                setState(() {
                 possLeft = true;
                 if(possRight){
                   possRight = false;
                 }  
                });
              },
            ),

            RaisedButton(
              color: Colors.white,
              child: Text(
                '+1',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: (){
                _guestonepoint();
                setState(() {
                 possLeft = true;
                 if(possRight){
                   possRight = false;
                 }  
                });
              },
            ),

            RaisedButton(
              color: Colors.white,
              child: Text(
                'FOUL',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: (){
                _guestfouls();
              },
            ),

            RaisedButton(
              color: Colors.white,
              child: Text(
                'POSS',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: (){
                setState(() {
                 possRight = true;
                 if(possLeft){
                   possLeft = false;
                 } 
                });
              },
            ),

            RaisedButton(
              color: Colors.white,
              child: Text(
                '-T.O.L',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: (){
                _tl2();
              },
            ),

            RaisedButton(
              color: Colors.white,
              child: Text(
                '-3',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: (){
                _guestminusthree();
              },
            ),

            RaisedButton(
              color: Colors.white,
              child: Text(
                '-2',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: (){
                _guestminustwo();
              },
            ),

            RaisedButton(
              color: Colors.white,
              child: Text(
                '-1',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: (){
                _guestminusone();
              },
            ),

            RaisedButton(
              color: Colors.white,
              child: Text(
                'BONUS',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: (){
                rightarrow2 = true;
                setState(() {
                 if(right == 1){
                   rightarrow1 = true;
                 }
                 right += 1;
                });
              },
              
            )
              ],
            )
          ],
          ),
        
      ),
       ),
    );
  }
}