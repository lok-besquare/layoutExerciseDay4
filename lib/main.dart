import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Layout Exercise',
      home: LayoutPage(),
    );
  }
  // This widget is the root of your application.

}

class LayoutPage extends StatefulWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  List _datalist = [];
  bool isEmpty = false;
  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/layout.json');
    final data = await json.decode(response);
    setState(() {
      _datalist = data["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Exercise Day 4 -- Layout',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                child: const Text('Check Users Data'),
                onPressed: readJson,
              ),
            ),

            // Display the data loaded from layout.json
            _datalist.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _datalist.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 10),
                            // padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          // (_datalist[index]["avatar"]
                                          //         .isNotEmpty)
                                          //     ? NetworkImage("avatar.jpg"):
                                          NetworkImage((_datalist[index]
                                                  ["avatar"] ??
                                              "https://image.shutterstock.com/image-illustration/blank-man-profile-head-icon-260nw-1902600802.jpg")),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          _datalist[index]["first_name"] +
                                              ' ' +
                                              _datalist[index]["last_name"],
                                          style: new TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          _datalist[index]["username"],
                                          style: new TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text("Status: " +
                                          (_datalist[index]["status"] ??
                                              "...")),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(_datalist[index]
                                            ["last_seen_time"])),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 2),
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                              "${(_datalist[index]["messages"] ?? 0)}")
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}

// child: ListTile(
//                             leading: CircleAvatar(
//                               radius: 30,
//                               backgroundColor: Colors.transparent,
//                               backgroundImage:
//                                   // (_datalist[index]["avatar"]
//                                   //         .isNotEmpty)
//                                   //     ? NetworkImage("avatar.jpg"):
//                                   NetworkImage((_datalist[index]["avatar"] ??
//                                       "assets/avatar.jpg")),
//                             ),

//                             title: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                   Text(_datalist[index]["first_name"] +
//                                       ' ' +
//                                       _datalist[index]["last_name"]),
//                                   Text(
//                                     _datalist[index]["username"],
//                                     style: new TextStyle(
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Text("Status: " +
//                                       (_datalist[index]["status"] ?? "...")),
//                                 ]),
//                             // subtitle: Column(
//                             //   children: <Widget>[
//                             //     Text(
//                             //       _datalist[index]["username"],
//                             //       style: new TextStyle(
//                             //           fontWeight: FontWeight.bold),
//                             //     ),
//                             //     Text("Status: " + _datalist[index]["status"]),
//                             //   ],
//                             // ),

//                             trailing: Column(
//                               children: [
//                                 Text(_datalist[index]["last_seen_time"]),
//                                 Text("${(_datalist[index]["messages"] ?? 0)}")
//                               ],
//                             ),
//                           ),
