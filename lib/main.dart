import 'package:apicallshowinlistview/SCREEN/LISTVIEWSCREEN/listview_screen.dart';
import 'package:apicallshowinlistview/STATE/LISTVIEWPROVIDER/listview_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ListViewProvider())],
      child: const MaterialApp(
        home: ListViewHome(),
      ),
    );
  }
}
