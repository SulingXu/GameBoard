import 'package:flutter/material.dart';

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
  final String _startGameButtonTxt = 'Start Game';

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

  Widget inputPrefixAndRow(
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
                child: Text(
                  detailsPrefix,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
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
    final double _rowsInputLargeIntervalHeight = _deviceWidth * 0.055;
    final double _rowsInputSmallIntervalHeight = _deviceWidth * 0.025;
    final double _cardHorizontalPadding = _deviceWidth * 0.042;
    final double _cardVerticalPadding = _deviceHeight * 0.0005;

    return Container(
        width: _cardWidth,
        height: _cardHeight,
        child: Card(
            semanticContainer: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.white,
            elevation: 4.0,
            child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: _rowsInputLargeIntervalHeight),
                    inputPrefixAndRow(
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
                    inputPrefixAndRow(
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
                    inputPrefixAndRow(
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
                    // ElevatedButton(onPressed: null, child: Text(
                    //   _startGameButtonTxt,
                    //   style: TextStyle(
                    //     fontSize: 20,
                    //   ),
                    // ),)
                  ],
                )
            )
        )
    );
  }
}

