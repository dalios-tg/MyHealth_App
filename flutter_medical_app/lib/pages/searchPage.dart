import 'package:flutter/material.dart';

class shearchPage extends StatefulWidget {
  const shearchPage({super.key});

  @override
  State<shearchPage> createState() => _shearchPageState();
}

class _shearchPageState extends State<shearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Page"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),
     
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final SearchData = [
    "doctor",
    "consultation",
    "health",
    "details",
    "health details ",
    "Mohamed Ali ",
    "Ali",
    "Bourchada"
  ];
  final RecentSearchData = [
    "doctor",
    "consultation",
    "health",
    "details",
    "health details "
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    // actions for appbar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, "");
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some results based on the selection
    return Container(
      child: Card(
        color: Colors.red,
        shape: StadiumBorder(),
        
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final SuggestionList = query.isEmpty
        ? RecentSearchData
        : SearchData.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.search),
        title: RichText(
          text: TextSpan(
              text: SuggestionList[index].substring(0, query.length),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                    text: SuggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: SuggestionList.length,
    );
  }
}
