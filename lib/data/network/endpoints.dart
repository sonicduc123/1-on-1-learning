class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://sandbox.api.lettutor.com/";

  // register endpoints
  static const String register = baseUrl + "auth/register";

  // forgot password
  static const String forgotPassword = baseUrl + "user/forgotPassword";

  // login
  static const String login = baseUrl + "auth/login";

  // get user infor
  static const String getUserInfor = baseUrl + "user/info";

  // get list tutor
  static const String getListTutor = baseUrl + "tutor/more?";

  // add tutor to favorite list
  static const String addFavorite = baseUrl + "user/manageFavoriteTutor";

  // get infor tutor
  static const String getTutor = baseUrl + "tutor/";

  // get list course
  static const String getListCourse = baseUrl + "course?";

  // get course detail
  static const String getCourse = baseUrl + "course/";
}
