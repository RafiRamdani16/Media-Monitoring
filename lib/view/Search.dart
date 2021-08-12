import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController keyword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchPage'),
      ),
      body: Column(
        children: [
          Center(
            child: TextField(
              controller: keyword,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Please Input the Keyword'),
            ),
          ),
        ],
      ),
    );
  }
}
