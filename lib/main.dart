

import 'package:flutter/material.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(

        colorScheme: ColorScheme.dark(),

      ),
      home: MyHomePage(title: 'Tic Tac Toe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<List<String>> _matrix;

  _MyHomePageState() {
    _matrix = [[' ', ' ', ' '],[' ', ' ', ' '],[' ', ' ', ' ']];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        title: Center(child: Text(widget.title),),
      ),
      body: Center(


        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                _buildelement(0,0),
                _buildelement(0,1),
                _buildelement(0,2),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildelement(1,0),
                _buildelement(1,1),
                _buildelement(1,2),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildelement(2,0),
                _buildelement(2,1),
                _buildelement(2,2),
              ]
            )
          ],

        ),
      ),


    );
  }
  String last = 'O';

  _buildelement(int i, int j){
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return GestureDetector(
      onTap: () {
        _Update_Matrix(i,j);
        _check_winner(i,j);
        print(_matrix[i]);

      },
        child: Container(
          height: height/3-27,
          width: width/3,
          decoration: BoxDecoration
          (
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Colors.black,
              width: 5,
            ),


            color: Colors.pink,
          ),
          child: Center(child: Text(
            _matrix[i][j],
            style: TextStyle(
              fontSize: 100,
            ),
            ),
            ),

        ),
    );

  }

  _Update_Matrix(int i,int j){
    setState(() {

          if(_matrix[i][j]== ' ')
          {if(last=='O')
            _matrix[i][j] = "X";
          else
            _matrix[i][j] = 'O';
          last = _matrix[i][j];
          }
        });
  }
  _check_winner(int i, int j){
    var col=0,row=0,diag=0,rdiag=0;
    var n=_matrix.length-1;
    var player = _matrix[i][j];

    for (int a=0; a< _matrix.length;a++)
    {
      if(_matrix[i][a]==player)
        col++;
      if(_matrix[a][j]==player)
        row++;
      if(_matrix[a][a]==player)
        diag++;
      if(_matrix[i][a]==player)
        rdiag++;

    }
    if(row == n+1 || col == n+1|| diag == n+1||rdiag == n+1)
      {print('$player won');
      _matrix = [[' ', ' ', ' '],[' ', ' ', ' '],[' ', ' ', ' ']];}
  }


}
