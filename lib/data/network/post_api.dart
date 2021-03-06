import 'package:flutter/cupertino.dart';
import 'package:let_tutor/data/network/post_api/book_a_class.dart';
import 'package:let_tutor/data/network/post_api/change_avatar.dart';
import 'package:let_tutor/data/network/post_api/change_password.dart';
import 'package:let_tutor/data/network/post_api/forgot_password_account.dart';
import 'package:let_tutor/data/network/post_api/get_schedule_tutor.dart';
import 'package:let_tutor/data/network/post_api/login_account.dart';
import 'package:let_tutor/data/network/post_api/register_account.dart';
import 'package:let_tutor/data/network/post_api/search_tutor.dart';

class PostAPI {
  // change password
  static changePassword(String newPassword) => changePasswordAPI(newPassword);

  // change avatar
  static changeAvatar(String path) => changeAvatarAPI(path);

  // register
  static registerAccount(String email, String password, BuildContext context) =>
      registerAccountAPI(email, password, context);

  // login
  static loginAccount(String email, String password, BuildContext context) =>
      loginAccountAPI(email, password, context);

  // forgot password
  static forgotPasswordAccount(String email, BuildContext context) =>
      forgotPasswordAccountAPI(email, context);

  // get schedule's tutor
  static getScheduleTutor(String tutorId) => getScheduleTutorAPI(tutorId);

  // book a class
  static bookAClass(String scheduleId, String note, BuildContext context) =>
      bookAClassAPI(scheduleId, note, context);

  // search tutor
  static searchTutor(
          int page, int perPage, List<String> specialties, String search) =>
      searchTutorAPI(page, perPage, specialties, search);
}
