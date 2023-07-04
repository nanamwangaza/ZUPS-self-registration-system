import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

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



  void openFiles() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    String? filePath = result.files.single.path;
    setState(() {
      chetiChaKuzaliwa = filePath;
    });
  }
}



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
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child:
                          
                           TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Kusanya cheti cha kuzaliwa',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: Icon(Icons.upload_file,),

                            ),

                       


                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please choose a file';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Kusanya kitambulisho cha mzanzibari',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: Icon(Icons.upload_file),
                            ),
                            onChanged: (value) {
                              setState(() {
                                kitambulishoChaMzanzibari = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please choose a file';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Kusanya picha ya pasipoti',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: Icon(Icons.upload_file),
                            ),
                            onChanged: (value) {
                              setState(() {
                                pichaYaPasipoti = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please choose a file';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
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
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Do something with the uploaded documents
                            // You can access them using the variables:
                            // chetiChaKuzaliwa, kitambulishoChaMzanzibari, pichaYaPasipoti
                            print('Cheti cha kuzaliwa: $chetiChaKuzaliwa');
                            print('Kitambulisho cha mzanzibari: $kitambulishoChaMzanzibari');
                            print('Picha ya pasipoti: $pichaYaPasipoti');
                          }
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
