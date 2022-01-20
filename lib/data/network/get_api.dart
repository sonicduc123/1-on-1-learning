import 'package:let_tutor/data/network/get_api/course_detail.dart';
import 'package:let_tutor/data/network/get_api/list_course.dart';
import 'package:let_tutor/data/network/get_api/list_history.dart';
import 'package:let_tutor/data/network/get_api/list_schedule.dart';
import 'package:let_tutor/data/network/get_api/list_tutor.dart';
import 'package:let_tutor/data/network/get_api/total_time_learn.dart';
import 'package:let_tutor/data/network/get_api/tutor_detail.dart';
import 'package:let_tutor/data/network/get_api/user_infor.dart';

class GetAPI {
  // get list schedule
  static getListSchedule(int page, int perPage) =>
      getListScheduleAPI(page, perPage);

  // get list course
  static getListCourse(int page, int size, String search) => getListCourseAPI(page, size, search);

  // get course detail
  static getCourseDetail(String courseID) => getCourseDetailAPI(courseID);

  // get tutor detail
  static getTutorDetail(String tutorId) => getTutorDetailAPI(tutorId);

  // get list tutor
  static getListTutor() => getListTutorAPI();

  // get user infor
  static getUserInfor() => getUserInforAPI();

  // get total time learn
  static getTotalTimeLearn() => getTotalTimeLearnAPI();

  // get list history
  // get list schedule
  static getListHistory(int page, int perPage) =>
      getListHistoryAPI(page, perPage);
}
