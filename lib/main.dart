import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boulder Balls',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePage createState() => new _MyHomePage();
}

class Attempt {
  int index;
  String identifier;
  Color color;
  int attempts;


  Attempt(String ident, Color color, int idx){
    this.identifier = ident;
    this.color = color;
    this.index = idx;
    this.attempts = 0;
  }

  void incAttempts(){
    attempts++;
  }
  void deIncAttempts(){
    attempts--;
  }
}

class _MyHomePage extends State<MyHomePage> {

  final attempts = <Attempt>[];

  int identifierCounter = 0;

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {

        if (i == attempts.length) {
          return null;
        }

        return _buildRow(attempts[i]);
      },
    );
  }

  Widget _buildRow(Attempt attempt) {
    identifierCounter++;
      return new Card(
        child: new InkWell(
            onTap: (){
              setState(() {
                attempt.incAttempts();
              });
            },
            child: new GestureDetector(
                onHorizontalDragStart: (details){
                  setState(() {
                    if(attempt.attempts > 0){
                      attempt.deIncAttempts();
                    }
                    else{
                      attempts.removeAt(attempts.indexWhere((i) => i.identifier == attempt.identifier));
                    }
                  });
                },
                child: new Column(
          children: <Widget>[
            new Padding(
                padding: new EdgeInsets.all(3),
                child:  new Row(
                          children: <Widget>[
                            new Padding(
                                padding: new EdgeInsets.all(7.0),
                                child: new CircleAvatar(backgroundColor: attempt.color)
                            ),
                            new Column(
                              children: <Widget>[
                                new Row(
                                  children: <Widget>[
                                    new Padding(
                                      padding: EdgeInsets.all(7.0),
                                      child: new Text(attempt.identifier, style: new TextStyle(fontSize: 18.0),),
                                    ),

                                  ],
                                ),
                                new Row(
                                  children: <Widget>[
                                    new Padding(
                                      padding: new EdgeInsets.all(7.0),
                                      child: new Text('Attempts',style: new TextStyle(fontSize: 18.0),),
                                    ),
                                    new Padding(
                                      padding: new EdgeInsets.all(7.0),
                                      child: new Text( attempt.attempts.toString() ,style: new TextStyle(fontSize: 18.0),),
                                    ),
                                  ],
                                )
                              ],
                            ),

                          ],
                        )
                    )


          ],)
            )
        ),
      );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Boulder Balls'),
          actions: <Widget>[
            attempts.isNotEmpty ? new IconButton(icon: Icon(Icons.save, color: Colors.blueAccent,), onPressed: null) : new IconButton(icon: Icon(Icons.save, color: Colors.white10,), onPressed: null)
          ],
        ),

        body: Row(

            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.lightGreen,
                    ),
                    onPressed: () {
                      setState(() {
                        attempts.add(new Attempt(identifierCounter.toString(), Colors.lightGreen, attempts.length));
                      });
                    },
                    iconSize: 65,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.yellow,
                    ),
                    onPressed: () {
                      setState(() {
                        attempts.add(new Attempt(identifierCounter.toString(), Colors.yellow, attempts.length));
                      });
                    },
                    iconSize: 65,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.orange,
                    ),
                    onPressed: () {
                      setState(() {
                        attempts.add(new Attempt(identifierCounter.toString(), Colors.orange, attempts.length));
                      });
                    },
                    iconSize: 65,
                  ),
                  IconButton(
                      icon: Icon(Icons.add_circle,
                          color: Colors.pink),
                      onPressed: () {
                        setState(() {
                          attempts.add(new Attempt(identifierCounter.toString(), Colors.pink, attempts.length));
                        });
                      },
                      iconSize: 65),
                  IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      setState(() {
                        attempts.add(new Attempt(identifierCounter.toString(), Colors.blue, attempts.length));
                      });
                    },
                    iconSize: 65,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.purple,
                    ),
                    onPressed: () {
                      setState(() {
                        attempts.add(new Attempt(identifierCounter.toString(), Colors.purple, attempts.length));
                      });
                    },
                    iconSize: 65,
                  ),
                ],
              ),

              Flexible(
                  child: _buildSuggestions()
              )
            ]

        )
    );
  }
}