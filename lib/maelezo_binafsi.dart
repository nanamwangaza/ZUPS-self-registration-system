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

  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      _dateController.text = picked.toString(); // Update the date value
    }
  }


  final _formKey = GlobalKey<FormState>();

  // TextEditingController _tarehe_ya_kuzaliwa = TextEditingController();
  // TextEditingController _tarehe_ya_kuingia_Zanzibar = TextEditingController();

  String _jina_kamili_la_mzee = "";
  late int _umri;
  late int _namba_ya_simu;
  String _mtaa = "";
  String _SLP = "";
  String _namba_ya_nyumba = "";
  String _namba_ya_kitambulisho_cha_mzanzibari = "";
  String _kitambulisho_kingine = "";
  String _namba_ya_kitambulisho_kingine = "";
  String _shehia = "";
  String _wilaya = "";
  String _mkoa = "";
  String _hali_ya_ulemavu = "";

  Future<void> postData() async {
    try {
      var url = Uri.parse('http://localhost:8000/api/pension');

      var headers = {
        'Content-Type': 'application/json',
      };

      var data = {
        'jina_kamili_la_mzee': _jina_kamili_la_mzee,
        'umri': _umri.toString(),
        'namba_ya_simu': _namba_ya_simu.toString(),
        'mtaa': _mtaa,
        'SLP': _SLP,
        'namba_ya_nyumba': _namba_ya_nyumba,
        'namba_ya_kitambulisho_cha_mzanzibari':
            _namba_ya_kitambulisho_cha_mzanzibari,
        'kitambulisho_kingine': _kitambulisho_kingine,
        'namba_ya_kitambulisho_kingine': _namba_ya_kitambulisho_kingine,
        'shehia': _shehia,
        'wilaya': _wilaya,
        'mkoa': _mkoa,
        'hali_ya_ulemavu': _hali_ya_ulemavu,
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
        backgroundColor:Colors.lightBlue,
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
                           controller: _dateController,
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
            
                        ),
                
                      SizedBox(height: 20),

                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tafadhali ingiza  umri';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _umri = int.parse(value!);
                          // converting int to string
                        },
                        keyboardType: TextInputType.number,
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
                      
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tafadhali ingiza namba ya simu';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _namba_ya_simu = int.parse(value!);
                          // converting int to string
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
                            return 'Tafadhali ingiza  umri';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _umri = int.parse(value!);
                          // converting int to string
                        },
                        keyboardType: TextInputType.number,
                        // brings keyboard with numbers only
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
                            return 'Tafadhali ingiza  umri';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _umri = int.parse(value!);
                          // converting int to string
                        },
                        keyboardType: TextInputType.number,
                        // brings keyboard with numbers only
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
                            return 'Tafadhali ingiza  umri';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _umri = int.parse(value!);
                          // converting int to string
                        },
                        keyboardType: TextInputType.number,
                        // brings keyboard with numbers only
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
                            return 'Tafadhali ingiza  umri';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _umri = int.parse(value!);
                          // converting int to string
                        },
                        keyboardType: TextInputType.number,
                        // brings keyboard with numbers only
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
                            return 'Tafadhali ingiza  umri';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _umri = int.parse(value!);
                          // converting int to string
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
                      // TextFormField(
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'Tafadhali ingiza jina la mtaa';
                      //     }
                      //     return null;
                      //   },
                      //   onSaved: (value) {
                      //     _mtaa = value!;
                      //   },
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: Colors.white,
                      //     label: Text("Mtaa"),
                      //     floatingLabelBehavior: FloatingLabelBehavior.never,
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 20),
                      // TextFormField(
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'Tafadhali ingiza anwani kamili';
                      //     }
                      //     return null;
                      //   },
                      //   onSaved: (value) {
                      //     _SLP = value!;
                      //   },
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: Colors.white,
                      //     label: Text("Anwani Kamili (SLP)"),
                      //     floatingLabelBehavior: FloatingLabelBehavior.never,
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 20),
                      // TextFormField(
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'Tafadhali ingiza namba ya nyumba';
                      //     }
                      //     return null;
                      //   },
                      //   onSaved: (value) {
                      //     _namba_ya_nyumba = value!;
                      //   },
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: Colors.white,
                      //     label: Text("Namba ya Nyumba"),
                      //     floatingLabelBehavior: FloatingLabelBehavior.never,
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 20),
                      // TextFormField(
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'Tafadhali ingiza namba ya kitambulisho cha Mzanzibari';
                      //     }
                      //     return null;
                      //   },
                      //   onSaved: (value) {
                      //     _namba_ya_kitambulisho_cha_mzanzibari = value!;
                      //   },
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: Colors.white,
                      //     label: Text("Namba ya kitambulisho cha Mzanzibari"),
                      //     floatingLabelBehavior: FloatingLabelBehavior.never,
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 20),
                      // TextFormField(
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'Tafadhali ingiza kitambulisho kingine';
                      //     }
                      //     return null;
                      //   },
                      //   onSaved: (value) {
                      //     _kitambulisho_kingine = value!;
                      //   },
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: Colors.white,
                      //     label: Text("Kitambulisho kingine"),
                      //     floatingLabelBehavior: FloatingLabelBehavior.never,
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 20),
                      // TextFormField(
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'Tafadhali ingiza namba ya kitambulisho kingine';
                      //     }
                      //     return null;
                      //   },
                      //   onSaved: (value) {
                      //     _namba_ya_kitambulisho_kingine = value!;
                      //   },
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: Colors.white,
                      //     label: Text("Namba ya Kitambulisho kingine"),
                      //     floatingLabelBehavior: FloatingLabelBehavior.never,
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 20),
                      // TextFormField(
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'Tafadhali ingiza shehia';
                      //     }
                      //     return null;
                      //   },
                      //   onSaved: (value) {
                      //     _shehia = value!;
                      //   },
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: Colors.white,
                      //     label: Text("Shehia"),
                      //     floatingLabelBehavior: FloatingLabelBehavior.never,
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 20),
                      // TextFormField(
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'Tafadhali ingiza wilaya';
                      //     }
                      //     return null;
                      //   },
                      //   onSaved: (value) {
                      //     _wilaya = value!;
                      //   },
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: Colors.white,
                      //     label: Text("Wilaya"),
                      //     floatingLabelBehavior: FloatingLabelBehavior.never,
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 20),
                      // TextFormField(
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'Tafadhali ingiza mkoa';
                      //     }
                      //     return null;
                      //   },
                      //   onSaved: (value) {
                      //     _mkoa = value!;
                      //   },
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: Colors.white,
                      //     label: Text("Mkoa"),
                      //     floatingLabelBehavior: FloatingLabelBehavior.never,
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 20),
                      // TextFormField(
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'Tafadhali ingiza hali ya ulemavu';
                      //     }
                      //     return null;
                      //   },
                      //   onSaved: (value) {
                      //     _hali_ya_ulemavu = value!;
                      //   },
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: Colors.white,
                      //     label: Text("Hali ya Ulemavu"),
                      //     floatingLabelBehavior: FloatingLabelBehavior.never,
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
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
