import 'package:flutter/material.dart';

Color appBarColor = const Color.fromRGBO(
    58, 77, 137, 1); //const Color.fromRGBO(04, 52, 100, 1);
Color textColor = Colors.white;
bool preference = false;

//  Todo : add all static values here and use this var inside our app
class SingleFormUtill {
  static const String singleFormTextBox = "InputBox";
  static const String singleFormDropDown = "Dropdown";
  static const String singleFormCalender = "Calendar";
  static const String singleFormRadioButton = "RadioButton";
}

class UserProfileFormUtill {
  static const String userProfilePicture = "FileUpload";
  static const String userProfileFormTextBox = "TextBox";
  static const String userProfileFormDropDown = "DropDown";
  static const String userProfileFormCalender = "Calendar";
  static const String userProfileFormRadioButton = "RadioButton";
  static const String userProfileFormEmail = "Email";
}

class MenuUtill {
  static const String singleEntry = "Single_Entry";
  static const String moviesList = "Movies_list";
  static const String userProfile = "User_Profile";
  static const String addressBook = "AddressBook";
}

class Images {
  static const String christmas = "MerryChristmas.png";
  static const String meeting = "meeting.jpg";
  static const String presentation = "presentation.jpeg";
  static const String books = "gettyimages.png";
  static const String friends = "high-five.png";
  static const String library = "library.jpg";
  static const String graduation = "graduation.jpeg";
  static const String studymaterial = "study-material.png";
  static const String pencil = "pencil.jpeg";
  // static const String flutterCourse = "Single_Entry";
  // static const String webDevCourse = "Single_Entry";
  // static const String specsCourse = "Single_Entry";
}
