import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:zups/mwakilishi.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController _tarehe_ya_kuzaliwa_controller =
      TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      _tarehe_ya_kuzaliwa_controller.text =
          picked.toString(); // Update the date value
    }
  }

  final _formKey = GlobalKey<FormState>();

  // TextEditingController _tarehe_ya_kuzaliwa = TextEditingController();
  // TextEditingController _tarehe_ya_kuingia_Zanzibar = TextEditingController();

  DateTime? _tarehe_ya_kuzaliwa;
  String _hali_ya_ulemavu = "";
  int? _namba_ya_kitambulisho_cha_mzanzibari;
  String _shehia = "";
  String _mtaa = "";
  String _wilaya = "";
  String _mkoa = "";
  int? namba_ya_nyumba;
  String? _jinsia;

  Future<void> postData() async {
    try {
      var url = Uri.parse('http://localhost:8000/api/pension');

      var headers = {
        'Content-Type': 'application/json',
      };

      var data = {
        'tarehe_ya_kuzaliwa': _tarehe_ya_kuzaliwa,
        '_hali_ya_ulemvu': _hali_ya_ulemavu,
        'namba_ya_kitambulisho_cha_mzanzibari':
            _namba_ya_kitambulisho_cha_mzanzibari,
        'shehia': _shehia,
        'mtaa': _mtaa,
        'wilaya': _wilaya,
        'mkoa': _mkoa,
      };

      var body = jsonEncode(data);

      var response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        // Request was successful
        var jsonResponse = jsonDecode(response.body);
        var message = jsonResponse['message'];
        var status = jsonResponse['status'];
        print('Response: $message');
        print('Status: $status');
      } else {
        // Request failed
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          "MAELEZO BINAFSI YA MZEE",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                )),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Nyumbani'),
              onTap: () {
                // Navigate to the home screen.
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Kutoka'),
              onTap: () {
                // Navigate to the settings screen.
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
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
                      TextFormField(
                        controller: _tarehe_ya_kuzaliwa_controller,
                        readOnly: true,
                        onTap: () {
                          _selectDate(context);
                        },
                        decoration: InputDecoration(
                          label: Text("Tarehe ya kuzaliwa"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tafadhali ingiza tarehe ya kuzaliwa';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _tarehe_ya_kuzaliwa = value as DateTime?;
                        },
                      ),
                      SizedBox(height: 20),

                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tafadhali ingiza hali ya ulemavu';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _hali_ya_ulemavu = value!;
                        },

                        // brings keyboard with numbers only
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Hali ya ulemavu"),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),


                      SizedBox(height: 20),


                      DropdownButtonFormField<String>(
                        value: _jinsia,
                        onChanged: (String? newValue) {
                          setState(() {
                            _jinsia = newValue;
                          });
                        },
                        onSaved: (String? value) {
                          // Save the selected gender value
                          _jinsia = value;
                        },

                        //   validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return 'Tafadhali chagua jinsia';
                        //   }
                        //   return null;
                        // },
                        items: [
                          DropdownMenuItem(
                            
                            value: 'Mme',
                            child: Text('Mme'),
                          ),
                          DropdownMenuItem(
                            value: 'Mke',
                            child: Text('Mke'),
                          ),
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Jinsia',
                        ), 
                      ),

                      SizedBox(height: 20),

                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tafadhali ingiza namba ya kitambulisho cha mzanzibari';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _namba_ya_kitambulisho_cha_mzanzibari = value as int?;
                        },
                        keyboardType: TextInputType.number,
                        // brings keyboard with numbers only
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Namba ya kitambulisho cha mzanzibari"),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tafadhali ingiza shehia';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _shehia = value!;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Shehia"),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tafadhali ingiza mtaa';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _mtaa = value!;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Mtaa"),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tafadhali ingiza wilaya';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _wilaya = value!;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Wilaya"),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tafadhali ingiza mkoa';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _mkoa = value!;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Mkoa"),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tafadhali ingiza namba ya nyumba';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          namba_ya_nyumba = value as int?;
                        },
                        keyboardType: TextInputType.number,
                        // brings keyboard with numbers only
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Namba ya nyumba"),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
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
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                await postData();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MaelezoYaMwakilishi(),
                                  ),
                                );
                              } catch (e) {
                                print('Error: $e');
                                // Handle the error appropriately
                              }
                            }
                          },
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
                ))
          ],
        ),
      ),
    );
  }
}
