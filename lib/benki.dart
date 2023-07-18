import 'package:flutter/material.dart';
import 'package:zups/viambatanisho.dart';
import 'package:http/http.dart' as http;

class Benki extends StatefulWidget {
  const Benki({super.key});

  @override
  State<Benki> createState() => _BenkiState();
}

class _BenkiState extends State<Benki> {
  final _formKey = GlobalKey<FormState>();
  String _jina_la_benki = "";
  String _jina_la_akaunti = "";
  String _akaunti_namba = "";

  void postFormData() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Create a map with the form data
      Map<String, dynamic> formData = {
        'jina_la_benki': _jina_la_benki,
        'jina_la_akaunti': _jina_la_akaunti,
        'akaunti_namba': _akaunti_namba,
      };

      // Send an HTTP POST request to your Laravel API
      try {
        Uri apiUrl = Uri.parse(
            'http://localhost:8000/api/bank'); // Replace with your actual API URL
        final response = await http.post(apiUrl, body: formData);

        if (response.statusCode == 200) {
          // Request successful, handle the response
          // e.g., show a success message
          print('Form data submitted successfully');
          // Navigate to the next screen if needed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Viambatanisho()),
          );
        } else {
          // Request failed, handle the error
          print('Failed to submit form data');
          // Show an error message or handle the failure as per your requirements
        }
      } catch (e) {
        // Exception occurred, handle the error
        print('Error: $e');
        // Show an error message or handle the failure as per your requirements
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          centerTitle: true,
          title: Text("TAARIFA ZA BENKI")),
      body: Container(
        color: Color(0xFFF5F5F5),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                                      "Jina la benki:",
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Tafadhali ingiza jina la benki';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _jina_la_benki = value!;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: Text("Jina la benki"),
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                                    "Jina la akaunti:",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Tafadhali ingiza jina la akaunti';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _jina_la_akaunti = value!;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            label: Text("Jina la akaunti"),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                                      "Akaunti namba:",
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Tafadhali ingiza akaunti namba';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _akaunti_namba = value!;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: Text("Akaunti namba"),
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
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
                        onPressed: postFormData,
                        child: Text(
                          "Endelea",
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
            )
          ],
        ),
      ),
    );
  }
}
