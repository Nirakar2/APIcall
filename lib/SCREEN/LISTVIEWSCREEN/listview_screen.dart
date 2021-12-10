import 'package:apicallshowinlistview/STATE/LISTVIEWPROVIDER/listview_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListViewHome extends StatefulWidget {
  const ListViewHome({Key? key}) : super(key: key);

  @override
  _ListViewHomeState createState() => _ListViewHomeState();
}

class _ListViewHomeState extends State<ListViewHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ListViewProvider>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Provider.of<ListViewProvider>(context, listen: false)
                .checkConnection(context);
          },
          child: Text("Click Me"),
        ),
      ),
    );
  }
}
