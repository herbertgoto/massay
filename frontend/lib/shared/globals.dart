
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

    //Factor Exercise
    static const Color factorExerciseColorOne = const Color(0xffE7F1DA);
    static const Color factorExerciseColorTwo = const Color(0xffE5F0D6);
    static const Color factorExerciseColorThree = const Color(0xff7DCECC8);
    static const Color factorExerciseColorFour = const Color(0xffD5E8BD);
    static const Color factorExerciseColorIdentifier = const Color(0xffC7E0A7);
    static const String factorExerciseName = 'Exercise';
    static const String factorExerciseImageURL = 'assets/images/factor_exercise.png';
    static const String factorExerciseIcon = 'assets/images/exercise.png';
    static const String factorExerciseQuestion = 'How much does exercise affect your health?';
    static const String factorExerciseMessage = 'Exercising sharpens your memory, enhances your confidence, and helps you feel relaxed';

    //Factor Diet
    static const Color factorDietColorOne = const Color(0xffC8FBA6);
    static const Color factorDietColorTwo = const Color(0xffBDFA95);
    static const Color factorDietColorThree = const Color(0xffBBFA92);
    static const Color factorDietColorFour = const Color(0xffB8FA8E);
    static const Color factorDietColorIdentifier = const Color(0xffA8F977);
    static const String factorDietName = 'Diet';
    static const String factorDietImageURL = 'assets/images/factor_diet.png';
    static const String factorDietIcon = 'assets/images/diet.png';
    static const String factorDietQuestion = 'How much does diet affect your health?';
    static const String factorDietMessage = 'A healthy diet could boost your mood and your energy';
  
    //Factor Job Expectation
    static const Color factorJobExpectationColorOne = const Color(0xffB2DDB4);
    static const Color factorJobExpectationColorTwo = const Color(0xffA2D6A4);
    static const Color factorJobExpectationColorThree = const Color(0xff99D29B);
    static const Color factorJobExpectationColorFour = const Color(0xff7CBE8D);
    static const Color factorJobExpectationColorIdentifier = const Color(0xff5FA97F);
    static const String factorJobExpectationName = 'Expectations'; 
    static const String factorJobExpectationImageURL = 'assets/images/factor_job_expectation.png';
    static const String factorJobExpectationIcon = 'assets/images/expectations.png';
    static const String factorJobExpectationQuestion = 'How much does Job expectation affect your health?';
    static const String factorJobExpectationMessage = 'It’s key to Identify the things that are the most important to your job satisfaction';

    //Factor Social
    static const Color factorSocialSupportColorOne = const Color(0xffA9C7CB);
    static const Color factorSocialSupportColorTwo = const Color(0xff96BBC0);
    static const Color factorSocialSupportColorThree = const Color(0xff86B1B7);
    static const Color factorSocialSupportColorFour = const Color(0xff7DABB1);
    static const Color factorSocialSupportColorIdentifier = const Color(0xff679DA3);
    static const String factorSocialSupportName = 'Social';
    static const String factorSocialSupportImageURL = 'assets/images/factor_social_support.png';
    static const String factorSocialSupportIcon = 'assets/images/social.png';
    static const String factorSocialSupportQuestion = 'How much does social support affect your health?';
    static const String factorSocialSupportMessage = 'A solid social network might give you the type of support you need (emotional, instrumental or informational)';

   
    //Factor Sleep
    static const Color factorSleepColorOne = const Color(0xffA1C2DE);
    static const Color factorSleepColorTwo = const Color(0xff98BCDB);
    static const Color factorSleepColorThree = const Color(0xff83AED3);
    static const Color factorSleepColorFour = const Color(0xff77A6CF);
    static const Color factorSleepColorIdentifier = const Color(0xff538EC2);
    static const String factorSleepName = 'Sleep';
    static const String factorSleepImageURL = 'assets/images/factor_sleep.png';
    static const String factorSleepIcon = 'assets/images/sleep.png';
    static const String factorSleepQuestion = 'How much does sleep affect your health?';
    static const String factorSleepMessage = 'Better sleep is associated with improvement in productivity, communication, and learning';


    //Factor Work Place Dynamics
    static const Color factorWorkPlaceDynamicsColorOne = const Color(0xff9FAFC8);
    static const Color factorWorkPlaceDynamicsColorTwo = const Color(0xff95A7C2);
    static const Color factorWorkPlaceDynamicsColorThree = const Color(0xff879CBB);
    static const Color factorWorkPlaceDynamicsColorFour = const Color(0xff8499B9);
    static const Color factorWorkPlaceDynamicsColorIdentifier = const Color(0xff7088AD);
    static const String factorWorkPlaceDynamicsName = 'Workplace dynamics';
    static const String factorWorkPlaceDynamicsImageURL = 'assets/images/factor_workplace_dynamics.png';
    static const String factorWorkPlaceDynamicsIcon = 'assets/images/dynamics.png';
    static const String factorWorkPlaceDynamicsQuestion = 'How much does Workplace dynamics affect your health?';
    static const String factorWorkPlaceDynamicsMessage = 'Recognizing each person’s style of work, motivation and level of aptitude can lead to a better understanding and contribution of the group goals';


    //Factor Job Demands
    static const Color factorJobDemandsColorOne = const Color(0xffAFACC3);
    static const Color factorJobDemandsColorTwo = const Color(0xffA6A3BC);
    static const Color factorJobDemandsColorThree = const Color(0xff9894B2);
    static const Color factorJobDemandsColorFour = const Color(0xff9692B0);
    static const Color factorJobDemandsColorIdentifier = const Color(0xff8985A6);
    static const String factorJobDemandsName = 'Job demands';
    static const String factorJobDemandsImageURL = 'assets/images/factor_job_demands.png';
    static const String factorJobDemandsIcon = 'assets/images/demands.png';
    static const String factorJobDemandsQuestion = 'How much does Job demands affect your health?';
    static const String factorJobDemandsMessage = 'Autonomy, right tools, flexibility among others are fundamental to determine if your workplace is the right place to grow';


    //Factor Work-Life Balance
    static const Color factorWorkLifeBalanceColorOne = const Color(0xffB9AEC1);
    static const Color factorWorkLifeBalanceColorTwo = const Color(0xffAD9DB3);
    static const Color factorWorkLifeBalanceColorThree = const Color(0xff9B849D);
    static const Color factorWorkLifeBalanceColorFour = const Color(0xff957B95);
    static const Color factorWorkLifeBalanceColorIdentifier = const Color(0xff886986);
    static const String factorWorkLifeBalanceName = 'Work-life balance';
    static const String factorWorkLifeBalanceImageURL = 'assets/images/factor_work_life_balance.png';
    static const String factorWorkLifeBalanceIcon = 'assets/images/balance.png';
    static const String factorWorkLifeBalanceQuestion = 'How much does Work-life balance affect your health?';
    static const String factorWorkLifeBalanceMessage = 'It’s important to get enough time to recharge your energy and take part in activities you enjoy';


}