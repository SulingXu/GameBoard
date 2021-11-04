import 'package:flutter/material.dart';
import 'package:game_board/styles.dart';

class PlayerInfoInputCardWidget extends StatefulWidget {
  PlayerInfoInputCardWidget({Key? key}) : super(key: key);
  @override
  _PlayerInfoInputCardWidgetState createState() => _PlayerInfoInputCardWidgetState();
}

class _PlayerInfoInputCardWidgetState extends State<PlayerInfoInputCardWidget> {
  final _tableNumberController = TextEditingController();
  final _raceToController = TextEditingController();
  final _firstPlayerNameController = TextEditingController();
  final _firstPlayerHandicapController = TextEditingController();
  final _secondPlayerNameController = TextEditingController();
  final _secondPlayerHandicapController = TextEditingController();
  final String _emptyInputAlertTxt = 'Please enter some text';
  final String _tableNumberInputLabelTxt = 'Table no.';
  final String _raceToInputLabelTxt = 'Race to';
  final String _firstPlayerNameLabelTxt = 'Play 1 name';
  final String _secondPlayerNameLabelTxt = 'Play 2 name';
  final String _firstPlayerHandicapLabelTxt = 'Play 1 handicap';
  final String _secondPlayerHandicapLabelTxt = 'Play 2 handicap';
  final String _gameDetailsPrefix = 'Game details';
  final String _firstPlayerDetailsPrefix = 'Player 1 details';
  final String _secondPlayerDetailsPrefix = 'Player 2 details';
  final String _startGameButtonTxt = 'Start game';

  Widget textFormField(TextEditingController controller, String labelTxt, String emptyInputAlert) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: labelTxt,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return emptyInputAlert;
        }
        return null;
      },
    );
  }

  Widget inputPrefixAndRow(//widget of two rows including hintprefix and input text row
      String detailsPrefix,
      double paddingWidth,
      double paddingHeight,
      double inputLineWidth,
      double columnsInputIntervalWidth,
      TextEditingController controller1,
      TextEditingController controller2,
      String inputLabelTxt1,
      String inputLabelTxt2,
      String emptyInputAlertTxt) {
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: paddingWidth, vertical: paddingHeight),
                child: Styles.text(detailsPrefix, FontWeight.normal, Styles.largeFontSize, Colors.black),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: paddingWidth, vertical: paddingHeight),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: inputLineWidth, // do it in both Container
                        child: textFormField(
                            controller1, inputLabelTxt1, emptyInputAlertTxt),
                      ),
                      SizedBox(width: columnsInputIntervalWidth),
                      Container(
                        width: inputLineWidth,
                        child: textFormField(
                            controller2, inputLabelTxt2, emptyInputAlertTxt),
                      )
                    ]),
              ),
            ]));
  }

  @override
  Widget build(BuildContext context) {
    final double _deviceWidth = MediaQuery.of(context).size.width;
    final double _deviceHeight = MediaQuery.of(context).size.height;
    final double _cardWidth = _deviceWidth * 0.70;
    final double _cardHeight = _deviceHeight * 0.85;
    final double _inputLineWidth = _deviceWidth * 0.3;
    final double _columnsInputIntervalWidth = _deviceWidth * 0.008;
    final double _rowsInputSmallIntervalHeight = _deviceHeight * 0.025;
    final double _rowsInputLargeIntervalHeight = _deviceHeight * 0.055;
    final double _cardHorizontalPadding = _deviceWidth * 0.042;
    final double _cardVerticalPadding = _deviceHeight * 0.0005;

    return Container(
        width: _cardWidth,
        height: _cardHeight,
        child: Card(
            semanticContainer: true,
            shape: Styles.borderRadius(Styles.smallRadiusSize),
            color: Colors.white,
            child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: _rowsInputLargeIntervalHeight),
                    inputPrefixAndRow(//game details
                        _gameDetailsPrefix,
                        _cardHorizontalPadding,
                        _cardVerticalPadding,
                        _inputLineWidth,
                        _columnsInputIntervalWidth,
                        _tableNumberController,
                        _raceToController,
                        _tableNumberInputLabelTxt,
                        _raceToInputLabelTxt,
                        _emptyInputAlertTxt),
                    SizedBox(height: _rowsInputLargeIntervalHeight),
                    inputPrefixAndRow(//player 1 details
                        _firstPlayerDetailsPrefix,
                        _cardHorizontalPadding,
                        _cardVerticalPadding,
                        _inputLineWidth,
                        _columnsInputIntervalWidth,
                        _firstPlayerNameController,
                        _firstPlayerHandicapController,
                        _firstPlayerNameLabelTxt,
                        _firstPlayerHandicapLabelTxt,
                        _emptyInputAlertTxt),
                    SizedBox(height: _rowsInputSmallIntervalHeight),
                    inputPrefixAndRow(//player 2 details
                        _secondPlayerDetailsPrefix,
                        _cardHorizontalPadding,
                        _cardVerticalPadding,
                        _inputLineWidth,
                        _columnsInputIntervalWidth,
                        _secondPlayerNameController,
                        _secondPlayerHandicapController,
                        _secondPlayerNameLabelTxt,
                        _secondPlayerHandicapLabelTxt,
                        _emptyInputAlertTxt),
                    SizedBox(height: _rowsInputSmallIntervalHeight),
                    Padding(//start game button
                      padding: EdgeInsets.symmetric(
                          horizontal: _cardHorizontalPadding, vertical: _cardVerticalPadding),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: Styles.paddingInButton,
                            child: Styles.text(_startGameButtonTxt, FontWeight.bold, Styles.middleFontSize, Colors.black)
                          ),
                          style: Styles.starGameButtonStyle,
                        ),
                      ),
                    ),
                  ],
                )
            )
        )
    );
  }
}

