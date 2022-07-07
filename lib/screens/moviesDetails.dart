import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:intl/intl.dart';
import 'package:mycollage/controllers/addController.dart';

class MoviesDetails extends StatefulWidget {
  final String? moviesName;

  MoviesDetails({Key? key, this.moviesName}) : super(key: key);

  @override
  State<MoviesDetails> createState() => _MoviesDetailsState();
}

class _MoviesDetailsState extends State<MoviesDetails> {
  final pickerController = Get.put(AddController());
  DateTime dateTime = DateTime.now();

  TimeOfDay selectTime = TimeOfDay.now();

  Future<void> showtime() async {
    final TimeOfDay? storetime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(DateTime.now()),
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  // Using 12-Hour format
                  alwaysUse24HourFormat: false),
              child: child!);
        });
    if (selectTime != null) {
      setState(() {
        selectTime = storetime!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies : ${widget.moviesName}"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10)),
                width: 150,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.moviesName.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.transparent),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("This is top movies in this list",
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.black,
                            )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                        backgroundColor: Colors.blue,
                                        content: Text(
                                          "Early Life and education: KK was born on August 23, 1968, in New Delhi in a Malayali household. Krishnakumar Kunnath, popularly known by his stage name KK, was a popular playback singer in the Hindi film industry. He did his schooling at Delhi’s Mount St Mary’s School and completed his graduation from Delhi University’s Kirori Mal College",
                                          maxLines: 10,
                                        ));
                                  });
                            },
                            child: const Text("Go")),
                        ElevatedButton(
                            onPressed: () {}, child: const Text("Back"))
                      ],
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                    const Text(
                      "term and condition appluy",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: dateTime,
                      firstDate: DateTime(DateTime.now().year - 1),
                      lastDate: DateTime(DateTime.now().year + 1),
                    ).then((date) {
                      setState(() {
                        dateTime = date!;
                      });
                    });
                  },
                  child: const Icon(
                    Icons.calendar_today,
                    color: Colors.red,
                  ),
                ),
                Text(dateTime == null
                    ? "select date"
                    : DateFormat.yMMMEd().format(dateTime))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: const Icon(Icons.timer),
                  onTap: () {
                    showtime();
                  },
                ),
                Text(selectTime == null ? "slect time" : selectTime.toString())
                // Text('${selectTime.hour.toString()}:${selectTime.minute.toString()}')
              ],
            )
          ],
        ),
      ),
    );
  }
}
