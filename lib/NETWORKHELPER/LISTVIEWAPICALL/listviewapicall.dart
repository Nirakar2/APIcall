import 'dart:convert';
import 'package:apicallshowinlistview/MODEL/LIST_VIEW_WITH_API_MODEL/listviewwithapi_model.dart';
import 'package:http/http.dart' as http;

class ListViewAPI {
  static late Map jsonData;
  static late List apiData;
  static getListViewData() async {
    List<Apishowinlistview> apitest = [];
    List<ZoomMeetingDetails> lstaccount = [];

    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      "UserID": 636,
      "SchID": "PS0011",
      "ClassID": 1,
      "SectionID": 2,
      "RoomID": 0, //Set 0
      "IsTeacher": "S" //S for Student
    });

    http.Response response = await http.post(
      Uri.parse('https://esnep.com/EasySchoolKhaltiApi/api/user/ZoomDetails'),
      body: body,
      headers: headers,
    );

    jsonData = jsonDecode(response.body);
    apiData = jsonData["ZoomMeetingDetails"];

    apitest.clear();
    lstaccount.clear();

    apitest.add(Apishowinlistview(
      STATUSCODE: jsonData['STATUS_CODE'],
      MESSAGE: jsonData['MESSAGE'],
      zoomMeetingDetails: lstaccount,
    ));

    for (int i = 0; i < apiData.length; i++) {
      lstaccount.add(
        ZoomMeetingDetails(
          IsActive: apiData[i]['IsActive'] ?? "-",
          SchoolID: apiData[i]['SchoolID'] == null
              ? "-"
              : apiData[i]['SchoolID'].toString(),
          TeacherName: apiData[i]['TeacherName'],
          SectionName: apiData[i]['SectionName'],
          PassCode: apiData[i]['PassCode'],
          CreatedDate: apiData[i]['CreatedDate'],
          MeetingType: apiData[i]['MeetingType'],
          SectionID: apiData[i]['SectionID'].toString(),
          subjectID: apiData[i]['subjectID'].toString(),
          MeetingID: apiData[i]['MeetingID'].toString(),
          RoomID: apiData[i]['RoomID'].toString(),
          Userid: apiData[i]['Userid'].toString(),
          SubjectName: apiData[i]['SubjectName'].toString(),
          classID: apiData[i]['classID'].toString(),
          ClassName: apiData[i]['ClassName'],
        ),
      );
    }
    return apitest;
  }
}
