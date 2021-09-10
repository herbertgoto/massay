
import 'dart:ui';
import 'package:flutter/material.dart';

class Global {
  static const Color white = const Color(0xffffffff);
  static const Color mediumBlue = const Color(0xff005aa0);
  static const Color letterColor = const Color(0xff0e0e0e);
  static const Color sleepColor = const Color(0xff8fdbe3);
  static const Color calendarSelectedColor = const Color(0xffa9cbda);
  

  //Letter size
  static const double letterSizeFactorMessage = 16.0;
  static const double letterSizeFactorTitle = 30.0;
  static const double letterSizeDescription = 20.0;
  static const double letterSizeFactorsMain = 32.0;
  static const double letterSizeCalendarYear = 26.0;
  static const double letterSizeCalendarDay = 18.0;
  static const double letterSizeCalendarDayStr = 14.0;
  static const double letterSizeCompleteSurvey = 28.0;
  static const double letterSizeCompleteDescription = 24.0;


  //String Fonts
  static const String sFProText = 'SF Pro Text';
  static const String sFProItalicText = 'SF Pro Text';


  //String Factors
  static const String stringFactorsInitialMessage = 'First answer \n these 8 topics';
  static const String stringInitialMessage = 'Hi, this will only take you a \n couple of minutes to answer';

  //String Message
  static const String stringSurveyNoAnswerMessage = 'No Data for this day';


  //Factors are organized by type/name 

    //Factor common values
  
      //Slider letter colors
      static const Color factorLetterSlideColor = const Color(0xff333333);
      static const Color factorLetterFactorsColor = const Color(0xff000000);
      static const Color factorSliderBackgroundColor = const Color(0xffcccccc);

      //Letter 
        //Letter size
        static const double factorLetterSizeFactorQuestion = 20.0;
        static const double factorLetterSizeFactorMessage = 16.0;
        static const double factorLetterSizeSliderInitialEndValueText = 16.0;

        //Letter color
        static const Color factorLetterColorFactorQuestion = const Color(0xff000000);
        static const Color factorLetterColorFactorMessage = const Color(0xff504D56);
        static const Color factorLetterColorSliderInitialEndValueText = const Color(0xff747678);

        //Letter FontWeight
        static const FontWeight factorSliderTitleFontWeight = FontWeight.w600;
        static const FontWeight factorQuestionFontWeight = FontWeight.w400;
        static const FontWeight factorMessageFontWeight = FontWeight.w200;
        static const FontWeight factorLetterFontWeightSliderInitialEndValueText = FontWeight.w400;

      //Text Page Numbers
      static const String factorPageNumberOne = ' 1 of 8';
      static const String factorPageNumberTwo = ' 2 of 8';
      static const String factorPageNumberThree = ' 3 of 8';
      static const String factorPageNumberFour = ' 4 of 8';
      static const String factorPageNumberFive = ' 5 of 8';
      static const String factorPageNumberSix = ' 6 of 8';
      static const String factorPageNumberSeven = ' 7 of 8';
      static const String factorPageNumberEight = ' 8 of 8';

      //Slider
      
        //Slider Text Values 
        static const String factorInitalSliderValueText = 'Definitely Not';
        static const String factorEndSliderValueText = 'Definitely';

        //Slider Theme Values
        static const double factorSliderTrackHeight = 35.0;
        static const double factorSliderThumbShape = 35.0;
        static const double factorSliderOverlayShape = 0;

        //Slider Width Between Text
        static const double factorSliderWidthBetweenText = 201.0;

        //Slider Width button
        static const double factorSliderWidthButton = 150.0;


      //Button titles
      static const String factorButtonNext = 'Next   ›';
      static const String factorButtonBack = '‹   Back';
      static const String factorButtonSend = 'Send';

    //Factor Sleep
    static const Color factorSleepColor = const Color(0xff5d9888);
    static const String factorSleepName = 'Sleep';
    static const String factorSleepImageURL = 'assets/images/factor_sleep.png';
    static const String factorSleepQuestion = 'How much does sleep affect your health?';
    static const String factorSleepMessage = 'Better sleep is associated with improvement in productivity, communication, and learning';



    //Factor Diet
    static const Color factorDietColor = const Color(0xffa1c48b);
    static const String factorDietName = 'Diet';
    static const String factorDietImageURL = 'assets/images/factor_diet.png';
    static const String factorDietQuestion = 'How much does diet affect your health?';
    static const String factorDietMessage = 'A healthy diet could boost your mood and your energy';
  


    //Factor Exercise
    static const Color factorExerciseColor = const Color(0xff7fe9d9);
    static const String factorExerciseName = 'Exercise';
    static const String factorExerciseImageURL = 'assets/images/factor_exercise.png';
    static const String factorExerciseQuestion = 'How much does exercise affect your health?';
    static const String factorExerciseMessage = 'Exercising sharpens your memory, enhances your confidence, and helps you feel relaxed';



    //Factor Social
    static const Color factorSocialSupportColor = const Color(0xff8fdbe3);
    static const String factorSocialSupportName = 'Social';
    static const String factorSocialSupportImageURL = 'assets/images/factor_social_support.png';
    static const String factorSocialSupportQuestion = 'How much does social support affect your health?';
    static const String factorSocialSupportMessage = 'A solid social network might give you the type of support you need (emotional, instrumental or informational)';


    //Factor Work-Life Balance
    static const Color factorWorkLifeBalanceColor = const Color(0xff8d6589);
    static const String factorWorkLifeBalanceName = 'Work-life balance';
    static const String factorWorkLifeBalanceImageURL = 'assets/images/factor_work_life_balance.png';
    static const String factorWorkLifeBalanceQuestion = 'How much does Work-life balance affect your health?';
    static const String factorWorkLifeBalanceMessage = 'It’s important to get enough time to recharge your energy and take part in activities you enjoy';


    //Factor Job Expectation
    static const Color factorJobExpectationColor = const Color(0xff90f4bc);
    static const String factorJobExpectationName = 'Expectations';
    static const String factorJobExpectationImageURL = 'assets/images/factor_job_expectation.png';
    static const String factorJobExpectationQuestion = 'How much does Job expectation affect your health?';
    static const String factorJobExpectationMessage = 'It’s key to Identify the things that are the most important to your job satisfaction';



    //Factor Work Place Dynamics
    static const Color factorWorkPlaceDynamicsColor = const Color(0xff8f9abd);
    static const String factorWorkPlaceDynamicsName = 'Workplace dynamics';
    static const String factorWorkPlaceDynamicsImageURL = 'assets/images/factor_workplace_dynamics.png';
    static const String factorWorkPlaceDynamicsQuestion = 'How much does Workplace dynamics affect your health?';
    static const String factorWorkPlaceDynamicsMessage = 'Recognizing each person’s style of work, motivation and level of aptitude can lead to a better understanding and contribution of the group goals';


    //Factor Job Demands
    static const Color factorJobDemandsColor = const Color(0xffcc9fb2);
    static const String factorJobDemandsName = 'Job demands';
    static const String factorJobDemandsImageURL = 'assets/images/factor_job_demands.png';
    static const String factorJobDemandsQuestion = 'How much does Job demands affect your health?';
    static const String factorJobDemandsMessage = 'Autonomy, right tools, flexibility among others are fundamental to determine if your workplace is the right place to grow';

}