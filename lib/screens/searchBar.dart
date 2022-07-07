import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycollage/classes/items.dart';

class SearchAppBar extends StatefulWidget {
  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("Search items..."),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: FoodItemSearch());
                },
                icon: const Icon(Icons.search))
          ]),
    );
  }
}

class FoodItemSearch extends SearchDelegate<Fooditem> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
         FocusScope.of(context).requestFocus(FocusNode());
        },
        icon: const Icon(Icons.arrow_back));
  }
  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text(query));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final storeItem = query.isEmpty
        ? foodItem
        : foodItem
            .where((p) => p.title!.toLowerCase().startsWith(query))
            .toList();
    return storeItem.isEmpty
        ? const Text("No Result Found")
        : ListView.builder(
            itemCount: storeItem.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  showResults(context);
                },
                title:
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(storeItem[index].title.toString()),
                            Text(storeItem[index].category.toString()),
                            Divider()
                          ],
                        ),
                      ),
                    )
                    );
                
            });
  }
}
