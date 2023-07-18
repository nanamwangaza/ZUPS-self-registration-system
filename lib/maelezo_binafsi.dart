import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:zups/benki.dart';
import 'package:zups/login.dart';
import 'package:zups/mwakilishi.dart';
import 'package:zups/viambatanisho.dart';

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

  late DateTime _tarehe_ya_kuzaliwa;
  String _hali_ya_ulemavu = "";
  String _namba_ya_kitambulisho_cha_mzanzibari = "";
  String _shehia = "";
  String _mtaa = "";
  String _wilaya = "";
  String _mkoa = "";
  String _namba_ya_nyumba = "";
  String? _jinsia;

  void _logoutUser(BuildContext context) async {
    final apiUrl =
        'http://localhost:8000/api/logout'; // Replace with your Laravel API URL

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer YOUR_API_TOKEN', // Replace with your API token or authentication method
        },
      );

      if (response.statusCode == 200) {
        // Successful logout
        // Perform any additional actions here (e.g., clear local storage, update UI)
        print('User logged out successfully');

        // Navigate back to the login page and remove all other routes from the stack
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false,
        );
      } else {
        // Logout failed
        print('Logout failed. Status code: ${response.statusCode}');
        // Show an error message or handle the failure as per your requirements
      }
    } catch (e) {
      // Error occurred during logout
      print('Error occurred during logout: $e');
      // Show an error message or handle the failure as per your requirements
    }
  }

  void postData() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Convert the DateTime value to a formatted string
      String formattedDate = _tarehe_ya_kuzaliwa.toIso8601String();

      // Create a map with the form data
      Map<String, dynamic> formData = {
        'tarehe_ya_kuzaliwa': formattedDate,
        'hali_ya_ulemavu': _hali_ya_ulemavu,
        'namba_ya_kitambulisho_cha_mzanzibari':
            _namba_ya_kitambulisho_cha_mzanzibari,
        'shehia': _shehia,
        'mtaa': _mtaa,
        'wilaya': _wilaya,
        'mkoa': _mkoa,
        'namba_ya_nyumba': _namba_ya_nyumba,
        'jinsia': _jinsia,
      };

      // Send an HTTP POST request to your Laravel API
      try {
        Uri apiUrl = Uri.parse(
            'http://localhost:8000/api/pension'); // Replace with your actual API URL
        final response = await http.post(apiUrl, body: formData);

        if (response.statusCode == 200) {
          // Request successful, handle the response
          // e.g., show a success message
          print('Form data submitted successfully');
          // Navigate to the next screen if needed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MaelezoYaMwakilishi()),
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

  // void _logoutUser() {
  //   // Perform logout logic here
  //   // Clear user session, reset authentication tokens, navigate to login screen, etc.
  //   // Example: Navigating to the login screen
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => LoginPage()),
  //   );
  // }

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
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
              ),
              child: Image.asset('assets/logo2.png'),
            ),
            ListTile(
              title: const Text('Maelezo binafsi'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Registration()),
                );
              },
            ),
            Divider(
              height: 10,
            ),
            ListTile(
              title: const Text('Maelezo ya mwakilishi'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MaelezoYaMwakilishi()),
                );
              },
            ),
            Divider(
              height: 10,
            ),
            ListTile(
              title: const Text('Taarifa za benki'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Benki()),
                );
              },
            ),
            Divider(
              height: 10,
            ),
            ListTile(
              title: const Text('Viambatanisho'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Viambatanisho()),
                );
              },
            ),
            Divider(
              height: 10,
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Kutoka'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
                // _logoutUser(context);
                // Call the logout function
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tarehe ya kuzaliwa:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
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
                                _tarehe_ya_kuzaliwa = DateTime.parse(value!);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hali ya ulemavu:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
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
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jinsia:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
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
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Namba ya kitambulisho cha mzanzibari:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Tafadhali ingiza namba ya kitambulisho cha mzanzibari';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _namba_ya_kitambulisho_cha_mzanzibari = value!;
                              },
                              keyboardType: TextInputType.number,
                              // brings keyboard with numbers only
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                label: Text(
                                    "Namba ya kitambulisho cha mzanzibari"),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shehia:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mtaa:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
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
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Wilaya:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
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
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mkoa:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
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
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Namba ya nyumba:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Tafadhali ingiza namba ya nyumba';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _namba_ya_nyumba = value!;
                              },
                              keyboardType: TextInputType.number,
                              // brings keyboard with numbers only
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                label: Text("Namba ya nyumba"),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
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
                          onPressed: postData,
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
