import 'package:flutter/material.dart';

class SwipDelete extends StatefulWidget {
  const SwipDelete({Key? key}) : super(key: key);

  @override
  State<SwipDelete> createState() => _SwipDeleteState();
}

class _SwipDeleteState extends State<SwipDelete> {
   final itemList = List.generate(30, (i) => 'List Item ${i + 1}');
  bool selected=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Swipe"),
      ),
      body:
      
      ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            final item = itemList[index];
            return Dismissible(
              background: Container(
                child: Icon(Icons.delete),
                color: Colors.red,
              ),
              key: Key(item),
              onDismissed: (direction) {
                setState(() {
                  itemList.removeAt(index);
                });
                Scaffold.of(context)
                    .showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('$item Deleted')));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '$item',
                          style: const TextStyle(fontSize: 20),
                        ),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                    const Divider()
                  ],
                ),
              ),
            );
          }),
    );
  }
}
