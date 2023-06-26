import 'package:flutter/material.dart';


class Viambatanisho extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Kusanya cheti cha kuzaliwa',
                              border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                              suffixIcon: Icon(Icons.upload_file),
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
                            onPressed: () {},
                            // async {
                            //   if (_formKey.currentState!.validate()) {
                            //     try {
                            //       await postData();
                            //       Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //           builder: (context) => MaelezoYaMwakilishi(),
                            //         ),
                            //       );
                            //     } catch (e) {
                            //       print('Error: $e');
                            //       // Handle the error appropriately
                            //     }
                            //   }
                            // },
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
