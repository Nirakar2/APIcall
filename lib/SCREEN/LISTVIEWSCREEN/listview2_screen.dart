import 'package:apicallshowinlistview/MODEL/LIST_VIEW_WITH_API_MODEL/listviewwithapi_model.dart';
import 'package:flutter/material.dart';

class ListViewData extends StatelessWidget {
  final List<ZoomMeetingDetails> lstaccount;
  const ListViewData({Key? key, required this.lstaccount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View'),
      ),
      body: ListView.builder(
          itemCount: lstaccount.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: [
                  Text(lstaccount[index].classID),
                ],
              ),
            );
          }),
    );
  }
}
