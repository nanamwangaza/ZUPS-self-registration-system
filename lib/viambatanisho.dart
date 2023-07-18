import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:zups/maelezo_binafsi.dart';

class Viambatanisho extends StatefulWidget {
  @override
  _ViambatanishoState createState() => _ViambatanishoState();
}

class _ViambatanishoState extends State<Viambatanisho> {
  final _formKey = GlobalKey<FormState>();

  // Variables to store uploaded documents
  String? chetiChaKuzaliwa;
  String? kitambulishoChaMzanzibari;
  String? pichaYaPasipoti;

    bool isFilesUploaded = false;

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  // Future<File> saveFilePermanently(PlatformFile file) async{
  //   final appStorage=await getApplicationDocumentsDirectory();

  // }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Upload Form',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('VIAMBATANISHO'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            color: Color(0xFFF5F5F5),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [


                    ElevatedButton(
                      child: Text('Kusanya cheti cha kuzaliwa'),
                      onPressed: () async {
                        final result = await FilePicker.platform.pickFiles();
                        if (result == null) return;

                        // Open single file
                        final file = result.files.first;
                        print('Name: ${file.name}');
                        print('Bytes: ${file.bytes}');
                        print('Size: ${file.size}');
                        print('Extension: ${file.extension}');
                        print('Path: ${file.path}');
                        setState(() {
                          chetiChaKuzaliwa = file.path;
                        });
                        // openFile(file);

                        // await  saveFilePermanently(file);
                      },
                    ),
                     SizedBox(height: 20,),
                    ElevatedButton(
                      child: Text('Kusanya picha ya pasipoti'),
                      onPressed: () async {
                        final result = await FilePicker.platform.pickFiles();
                        if (result == null) return;

                        // Open single file
                        final file = result.files.first;
                        print('Name: ${file.name}');
                        print('Bytes: ${file.bytes}');
                        print('Size: ${file.size}');
                        print('Extension: ${file.extension}');
                        print('Path: ${file.path}');
                        setState(() {
                          pichaYaPasipoti = file.path;
                        });
                        // openFile(file);

                        // await  saveFilePermanently(file);
                      },
                    ),

                    ElevatedButton(
                      child: Text('Kusanya kitambulisho cha mzanzibari'),
                      onPressed: () async {
                        final result = await FilePicker.platform.pickFiles();
                        if (result == null) return;

                        // Open single file
                        final file = result.files.first;
                        print('Name: ${file.name}');
                        print('Bytes: ${file.bytes}');
                        print('Size: ${file.size}');
                        print('Extension: ${file.extension}');
                        print('Path: ${file.path}');
                        setState(() {
                         kitambulishoChaMzanzibari = file.path;
                        });
                        // openFile(file);

                        // await  saveFilePermanently(file);
                      },
                    ),
                   
                    




                    SizedBox(height: 30),
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child:TextButton(
                      onPressed: () {
                        // Validate if all required files are uploaded
                        if (chetiChaKuzaliwa == null ||
                            kitambulishoChaMzanzibari == null ||
                            pichaYaPasipoti == null) {
                          // Show a warning if any of the files are missing
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Hujakusanya viambatanisho vyote!'),
                              content: Text('Tafadhali kusanya viambatanisho vyote.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                          return; // Exit the function if files are missing
                        }

                        // All files are uploaded, show a pop-up notification
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Asante kwa kukusanya taarifa!'),
                            content: Text('Taarifa zako zimepokelewa.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Registration(),
                                    ),
                                  );
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                        child: Text(
                          "KUSANYA",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
