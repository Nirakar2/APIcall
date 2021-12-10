import 'dart:convert';

import 'package:apicallshowinlistview/DATABASE/LISTVIEWDATABASE/listview_database.dart';
import 'package:apicallshowinlistview/MODEL/LIST_VIEW_WITH_API_MODEL/listviewwithapi_model.dart';
import 'package:apicallshowinlistview/NETWORKHELPER/LISTVIEWAPICALL/listviewapicall.dart';
import 'package:apicallshowinlistview/SCREEN/LISTVIEWSCREEN/listview2_screen.dart';
import 'package:apicallshowinlistview/UTILS/CONECTIVITY/connectivitycheck.dart';
import 'package:flutter/material.dart';

class ListViewProvider extends ChangeNotifier {
  int currentindex = 0;
  late List<Apishowinlistview> data;
  List<Apishowinlistview> apitest = [];
  List<ZoomMeetingDetails> lstaccount = [];

  late String testNext;
  late Map<String, dynamic> test;
  late List<Map<String, dynamic>> insertMemberList = [];

  ListViewProvider() {
    data = [];
  }
  init() async {
    ListViewDatabase.instance.initiateDatabase();
    getApiData();
  }

  checkConnection(context) async {
    ConnectivityCheck.check().then(
      (value) {
        if (value) {
          print(value);
          getApiData().whenComplete(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListViewData(lstaccount: lstaccount),
              ),
            );
          });
          print("on net");
        } else {
          print(value);
          getAllData().whenComplete(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListViewData(lstaccount: lstaccount),
              ),
            );
          });
          print("on sqlite ");
        }
      },
    );
    notifyListeners();
  }

  Future getApiData() async {
    insertMemberList.clear();
    lstaccount.clear();
    apitest.clear();
    apitest = await ListViewAPI.getListViewData();

    apitest.forEach((element) {
      if (element.STATUSCODE == "0") {
        lstaccount = element.zoomMeetingDetails;
        element.zoomMeetingDetails.forEach((value) {
          testNext = jsonEncode(value);
          test = jsonDecode(testNext);
          insertMemberList.add(test);
          // print("4  " + insertMemberList.toString());
        });
        insertData();
        // print(element.zoomMeetingDetails.toString());
      } else {
        print(element.MESSAGE.toString());
      }
    });
    notifyListeners();
  }

  insertData() async {
    deleteData();
    insertMemberList.forEach((element) {
      ListViewDatabase.instance.insertAllListViewData(element);
    });
    notifyListeners();
  }

  getAllData() async {
    lstaccount = await ListViewDatabase.instance.getAllData();
  }

  deleteData() async {
    await ListViewDatabase.instance.deleteAllData();
  }
}
