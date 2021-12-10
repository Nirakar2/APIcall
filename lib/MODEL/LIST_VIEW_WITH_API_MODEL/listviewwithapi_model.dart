class Apishowinlistview {
  Apishowinlistview({
    required this.STATUSCODE,
    required this.MESSAGE,
    required this.zoomMeetingDetails,
  });
  late final String STATUSCODE;
  late final String MESSAGE;
  late final List<ZoomMeetingDetails> zoomMeetingDetails;

  Apishowinlistview.fromJson(Map<String, dynamic> json) {
    STATUSCODE = json['STATUS_CODE'];
    MESSAGE = json['MESSAGE'];
    zoomMeetingDetails = List.from(json['ZoomMeetingDetails'])
        .map((e) => ZoomMeetingDetails.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['STATUS_CODE'] = STATUSCODE;
    _data['MESSAGE'] = MESSAGE;
    _data['ZoomMeetingDetails'] =
        zoomMeetingDetails.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ZoomMeetingDetails {
  ZoomMeetingDetails({
    required this.MeetingID,
    required this.PassCode,
    this.URL,
    required this.RoomID,
    required this.CreatedDate,
    required this.SchoolID,
    required this.Userid,
    required this.IsActive,
    required this.classID,
    required this.SectionID,
    required this.ClassName,
    required this.SectionName,
    required this.subjectID,
    required this.SubjectName,
    required this.TeacherName,
    required this.MeetingType,
  });
  late final String MeetingID;
  late final String PassCode;
  late final String? URL;
  late final String RoomID;
  late final String CreatedDate;
  late final String SchoolID;
  late final String Userid;
  late final String IsActive;
  late final String classID;
  late final String SectionID;
  late final String ClassName;
  late final String SectionName;
  late final String subjectID;
  late final String SubjectName;
  late final String TeacherName;
  late final String MeetingType;

  ZoomMeetingDetails.fromJson(Map<String, dynamic> json) {
    MeetingID = json['MeetingID'];
    PassCode = json['PassCode'];
    URL = null;
    RoomID = json['RoomID'];
    CreatedDate = json['CreatedDate'];
    SchoolID = json['SchoolID'];
    Userid = json['Userid'];
    IsActive = json['IsActive'];
    classID = json['classID'];
    SectionID = json['SectionID'];
    ClassName = json['ClassName'];
    SectionName = json['SectionName'];
    subjectID = json['subjectID'];
    SubjectName = json['SubjectName'];
    TeacherName = json['TeacherName'];
    MeetingType = json['MeetingType'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['MeetingID'] = MeetingID;
    _data['PassCode'] = PassCode;
    _data['URL'] = URL;
    _data['RoomID'] = RoomID;
    _data['CreatedDate'] = CreatedDate;
    _data['SchoolID'] = SchoolID;
    _data['Userid'] = Userid;
    _data['IsActive'] = IsActive;
    _data['classID'] = classID;
    _data['SectionID'] = SectionID;
    _data['ClassName'] = ClassName;
    _data['SectionName'] = SectionName;
    _data['subjectID'] = subjectID;
    _data['SubjectName'] = SubjectName;
    _data['TeacherName'] = TeacherName;
    _data['MeetingType'] = MeetingType;
    return _data;
  }
}
