import 'package:flutter/material.dart';
import 'package:game_board/create_score_board/player_info_input_card_widget.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String _createScoreBoardTxt = 'Create scoreboard';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Score Board',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            backgroundColor: const Color(0xFF0C7AEF),
            body: Center(
                child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10),
                        child: Text(
                          _createScoreBoardTxt,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      PlayerInfoInputCardWidget(),
                    ]
                )
            )
        )
    );
  }
}


