// @dart=2.9
import 'package:flutter/material.dart';
import 'package:front_end_amplify/screens/calendar_screen.dart';
import 'package:front_end_amplify/screens/survey.dart';
import 'package:front_end_amplify/shared/globals.dart';
import 'package:front_end_amplify/widgets/button_widget.dart';
import 'package:front_end_amplify/widgets/customappbar_widget.dart';
import 'package:front_end_amplify/widgets/customcalendar_widget.dart';
import 'package:front_end_amplify/widgets/factormeasure_widget.dart';
import 'package:front_end_amplify/widgets/navigation_drawer_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class MainScreen extends StatelessWidget {
  final DateTime selectedDay;
  final int mentalHealthStatusDay = _askMentalHealthStatusDay();

  MainScreen({
    Key key,
    this.selectedDay,
  }) : super(key: key);

  static int _askMentalHealthStatusDay() {
    //TODO Connect Data Base
    return 0;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: CustomAppBar(
        title: 'Massay',
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today_rounded),
            onPressed: () => _calendar(context),
          ),
        ],
        automaticallyImplyLeading: true,
      ),
      backgroundColor: Global.white,
      body: Column(children: <Widget>[
        Material(
          child: CustomCalendar(
            format: CalendarFormat.week,
            selectDay: selectedDay,
          ),
        ),
        Material(
          child: _resultFactors(context),
        ),
      ]),
    );
  }

  Widget _resultFactors(BuildContext context) {
    List<Widget> list = [];
    list.add(
      SizedBox(
        height: 10,
      ),
    );
    list.add(Container(
      child: Image(
        image: _assestImage(),
      ),
    ));
    list.add(
      SizedBox(
        height: 20,
      ),
    );
    if (_askMentalHealthStatusDay() != -1) {
      addAnswerDailySurvey(list);
    } else {
      addNoAnswerDailysurveyUI(list, context);
    }
    return Column(
      children: list,
    );
  }

  void addAnswerDailySurvey(List<Widget> list) {
    list.add(Padding(
      padding: const EdgeInsets.all(10.0),
      child: FactorMeasure(),
    ));
    list.add(
      SizedBox(
        height: 20,
      ),
    );
    list.add((() {
      return _assestText();
    }()));
  }

  void addNoAnswerDailysurveyUI(List<Widget> list, BuildContext context) {
    list.add(Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Text(
          Global.stringSurveyNoAnswerMessage,
          style: TextStyle(
            fontSize: Global.letterSizeFactorTitle,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 80,
        ),
        ButtonWidget(
          title: 'Answer Daily Survey',
          hasBorder: false,
          onPressed: () => _survey(context),
        ),
      ]),
    ));
  }

  AssetImage _assestImage() {
    if (mentalHealthStatusDay != -1)
      return mentalHealthStatusDayImage();
    else
      return AssetImage('assets/images/none_big.png');
  }

  AssetImage mentalHealthStatusDayImage() {
    if (mentalHealthStatusDay == 0) {
      return AssetImage('assets/images/happy_big.png');
    } else if (mentalHealthStatusDay == 1) {
      return AssetImage('assets/images/neutral_big.png');
    } else if (mentalHealthStatusDay == 2) {
      return AssetImage('assets/images/sad_big.png');
    } else if (mentalHealthStatusDay == 3) {
      return AssetImage('assets/images/skipped_big.png');
    } else {
      print("ERROR SHOULD BE HERE");
      return AssetImage('assets/images/skipped_big.png');
    }
  }

  Text _assestText() {
    String text = "Hello, let's start with your";
    if (mentalHealthStatusDay == 0) {
      text = "Good, You are happy";
    } else if (mentalHealthStatusDay == 1) {
      text = "Hey, You are okay";
    } else if (mentalHealthStatusDay == 2) {
      text = "Hello, We can do better";
    } else if (mentalHealthStatusDay == 3) {
      text = "Hello, let's start with your";
    }
    return Text(
      text,
    );
  }

  void _calendar(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Calendar(),
        ));
  }

  void _survey(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Survey(),
        ));
  }
}
