import 'package:let_tutor/data/network/get_api/course_detail.dart';
import 'package:let_tutor/data/network/get_api/list_course.dart';
import 'package:let_tutor/data/network/get_api/list_schedule.dart';
import 'package:let_tutor/data/network/get_api/list_tutor.dart';
import 'package:let_tutor/data/network/get_api/tutor_detail.dart';
import 'package:let_tutor/data/network/get_api/user_infor.dart';

class GetAPI {
  // get list schedule
  static getListSchedule(int page, int perPage) =>
      getListScheduleAPI(page, perPage);

  // get list course
  static getListCourse() => getListCourseAPI();

  // get course detail
  static getCourseDetail(String courseID) => getCourseDetailAPI(courseID);

  // get tutor detail
  static getTutorDetail(String tutorId) => getTutorDetailAPI(tutorId);

  // get list tutor
  static getListTutor() => getListTutorAPI();

  // get user infor
  static getUserInfor() => getUserInforAPI();
}
