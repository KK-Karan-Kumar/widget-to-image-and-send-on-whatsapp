import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:whatsapp_share2/whatsapp_share2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String ToPay = "3423";
  String OrderId = "#5234";
  List<Map<String, String>> tabledata = [
    {"itemN": "Item1", "Qty": "2", "catagory": "Some catagory", "vnv": "Veg"},
    {
      "itemN": "Item2",
      "Qty": "4",
      "catagory": "Some catagory",
      "vnv": "Non-Veg"
    },
    {
      "itemN": "Item3",
      "Qty": "7",
      "catagory":
          "Some catagory can go so long as long as you don't expect but it;s not a problem as you know about that",
      "vnv": "Veg"
    },
    {"itemN": "Item4", "Qty": "3", "catagory": "Some catagory", "vnv": "Veg"},
    {"itemN": "Item5", "Qty": "6", "catagory": "Some catagory", "vnv": "Veg"},
    {
      "itemN": "Item6",
      "Qty": "2",
      "catagory": "Some catagory",
      "vnv": "Non-Veg"
    },
    {"itemN": "Item7", "Qty": "5", "catagory": "Some catagory", "vnv": "Veg"},
    {"itemN": "Item8", "Qty": "2", "catagory": "Some catagory", "vnv": "Veg"},
    {"itemN": "Item9", "Qty": "3", "catagory": "Some catagory", "vnv": "Veg"},
    {
      "itemN": "Item10",
      "Qty": "6",
      "catagory": "Some catagory",
      "vnv": "Non-Veg"
    },
  ];

  File? _image;
  final String _phone = '919377330675';

  Future<void> share() async {
    await WhatsappShare.share(
      text: 'Example share text',
      linkUrl: 'https://flutter.dev/',
      phone: _phone,
    );
  }

  Future<void> shareFile() async {
    await getImage();
    Directory? directory = await getExternalStorageDirectory();

    print('${directory!.path} / ${_image!.path}');
    await WhatsappShare.shareFile(
      phone: _phone,
      text: "Some great information",
      filePath: [(_image!.path)],
    );
  }

  //check whatsapp installaction
  Future<void> isInstalled() async {
    final val = await WhatsappShare.isInstalled();
    print('Whatsapp is installed: $val');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
              onPressed: () async {
                await shareFile();
              },
              child: const Text("send")),
          // buildimg(),
        ],
      ),
    );
  }

  Widget buildimg() {
    return Container(
        color: Colors.white,
        child: Center(
          child: Column(children: [
            const SizedBox(
              height: 25,
            ),
            Container(
              child: const Text("Dabbawala Order",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Order Id: $OrderId",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
              ]),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(4),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(3),
                  3: FlexColumnWidth(2),
                },
                textDirection: TextDirection.ltr,
                // defaultColumnWidth: const FixedColumnWidth(120.0),
                border: TableBorder.all(
                    color: Colors.black, style: BorderStyle.solid, width: 2),
                children: [
                  TableRow(children: [
                    Container(
                      child: const Text(
                        "Item Name",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                    ),
                    Container(
                      child: const Text(
                        "Qty",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                    ),
                    Container(
                      child: const Text(
                        "Catagory",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                    ),
                    Container(
                      child: const Text(
                        "Veg/Non-Veg",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                    ),
                  ]),
                  for (var i = 0; i < tabledata.length; i++) ...[
                    TableRow(children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Text(
                            tabledata[i]["itemN"]!,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Text(
                            tabledata[i]["Qty"]!,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(
                          tabledata[i]["catagory"]!,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Text(
                            tabledata[i]["vnv"]!,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ],
              ),
            ),
            Container(
              child: Text(
                "ToPay: $ToPay",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
          ]),
        ));
  }

  ///Pick Image From gallery using image_picker plugin
  Future getImage() async {
    final controller = ScreenshotController();
    final imgbytes = await controller.captureFromWidget(buildimg());

    final directory = await getExternalStorageDirectory();
    File decodedimgfile =
        await File('${directory!.path}/image1.png').writeAsBytes(imgbytes);
    _image = File('${directory.path}/image1.png');
  }
}
