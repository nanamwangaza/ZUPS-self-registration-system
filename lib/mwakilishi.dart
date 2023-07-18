import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zups/benki.dart';
import 'package:zups/maelezo_binafsi.dart';
import 'package:http/http.dart' as http;

class MaelezoYaMwakilishi extends StatefulWidget {
  const MaelezoYaMwakilishi({Key? key}) : super(key: key);

  @override
  State<MaelezoYaMwakilishi> createState() => _MaelezoYaMwakilishiState();
}

class _MaelezoYaMwakilishiState extends State<MaelezoYaMwakilishi> {
  TextEditingController _dateController = TextEditingController();

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
  String _jina_la_kwanza_la_mwakilishi = "";
  String _jina_la_katikati_la_mwakilishi = "";
  String _jina_la_mwisho_la_mwakilishi = "";
  late DateTime _tarehe_ya_kuzaliwa;
  String _namba_ya_simu_ya_mwakilishi = "";
  String _namba_ya_kitambulisho_cha_mzanzibari_cha_mwakilishi = "";
  String _uhusiano_na_mzee = "";

  void postData() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Convert the DateTime value to a formatted string
      String formattedDate = _tarehe_ya_kuzaliwa.toIso8601String();

      // Create a map with the form data
      Map<String, dynamic> formData = {
        'jina_la_kwanza_la_mwakilishi': _jina_la_kwanza_la_mwakilishi,
        'jina_la_katikati_la_mwakilishi': _jina_la_katikati_la_mwakilishi,
        'jina_la_mwisho_la_mwakilishi': _jina_la_mwisho_la_mwakilishi,
        'tarehe_ya_kuzaliwa': formattedDate,
        'namba_ya_simu_ya_mwakilishi': _namba_ya_simu_ya_mwakilishi,
        'namba_ya_kitambulisho_cha_mzanzibari_cha_mwakilishi':
            _namba_ya_kitambulisho_cha_mzanzibari_cha_mwakilishi,
        'uhusiano_na_mzee': _uhusiano_na_mzee,
      };

      // Send an HTTP POST request to your Laravel API
      try {
        Uri apiUrl = Uri.parse(
            'http://localhost:8000/api/representative'); // Replace with your actual API URL
        final response = await http.post(apiUrl, body: formData);

        if (response.statusCode == 200) {
          // Request successful, handle the response
          // e.g., show a success message
          print('Form data submitted successfully');
          // Navigate to the next screen if needed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Benki()),
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Registration()),
            );
          },
        ),
        backgroundColor: Colors.lightBlue,
        title: Text(
          "MAELEZO YA MTU WA KARIBU",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                                      "Jina la kwanza:",
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Tafadhali ingiza jina la kwanza la mwakilishi';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _jina_la_kwanza_la_mwakilishi = value!;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: Text("Jina la kwanza la mwakilishi"),
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

                    SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                                      "Jina la katikati:",
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Tafadhali ingiza jina la katikati la mwakilishi';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _jina_la_katikati_la_mwakilishi = value!;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: Text("Jina la katikati la mwakilishi"),
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

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                                      "Jina la mwisho:",
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Tafadhali ingiza jina la mwisho la mwakilishi';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _jina_la_mwisho_la_mwakilishi = value!;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: Text("Jina la mwisho la mwakilishi"),
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

                    SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                                      "Tarehe ya kuzaliwa:",
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                          TextFormField(
                            controller: _dateController,
                            readOnly: true,
                            onTap: () {
                              _selectDate(context);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Tafadhali ingiza tarehe ya kuzaliwa';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _tarehe_ya_kuzaliwa = DateTime.parse(value!);
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
                                      "Namba ya simu:",
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Tafadhali ingiza namba ya simu ya mwakilishi';
                              }
                               if (value.length!=10) {
                return 'Ingiza namba sahihi';
              }
               if (!value.startsWith('0')) {
    return 'Ingiza namba sahihi';
  }
                              return null;
                              
                            },
                            onSaved: (value) {
                              _namba_ya_simu_ya_mwakilishi = value!;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: Text("Namba ya simu ya mwakilishi"),
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

                    SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                                      "Namba ya kitambulisho cha mzanzibari:",
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                              _namba_ya_kitambulisho_cha_mzanzibari_cha_mwakilishi =
                                  value!;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: Text(
                                  "Namba ya kitambulisho cha mzanzibari cha mwakilishi"),
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

                    // SizedBox(height: 20),

                    SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                                      "Uhusiano:",
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Tafadhali ingiza uhusiano na mzee';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _uhusiano_na_mzee = value!;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: Text("Uhusiano na mzee"),
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

                    SizedBox(height: 20),
                    //  TextFormField(
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Tafadhali ingiza jina la mwakilishi';
                    //     }
                    //     return null;
                    //   },
                    //   onSaved: (value) {
                    //     _jina_la_mwakilishi = value!;
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

                    SizedBox(height: 20),

                    //   TextFormField(
                    //     validator: (value) {
                    //       if (value!.isEmpty) {
                    //         return 'Tafadhali ingiza anapoishi mwakilishi';
                    //       }
                    //       return null;
                    //     },
                    //     onSaved: (value) {
                    //       _anapoishi_mwakilishi = value!;
                    //     },
                    //     decoration: InputDecoration(
                    //       filled: true,
                    //       fillColor: Colors.white,
                    //       label: Text("Anapoishi mwakilishi"),
                    //       floatingLabelBehavior: FloatingLabelBehavior.never,
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //         borderSide: BorderSide.none,
                    //       ),
                    //     ),
                    //   ),

                    //   SizedBox(height: 20),

                    //   TextFormField(
                    //     validator: (value) {
                    //       if (value!.isEmpty) {
                    //         return 'Tafadhali ingiza uhusiano na mhusika';
                    //       }
                    //       return null;
                    //     },
                    //     onSaved: (value) {
                    //       _uhusiano_na_mhusika = value!;
                    //     },
                    //     decoration: InputDecoration(
                    //       filled: true,
                    //       fillColor: Colors.white,
                    //       label: Text("Uhusiano na mhusika"),
                    //       floatingLabelBehavior: FloatingLabelBehavior.never,
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //         borderSide: BorderSide.none,
                    //       ),
                    //     ),
                    //   ),

                    //   SizedBox(height: 20),

                    //    TextFormField(
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Tafadhali ingiza namba ya simu ya mwakilishi';
                    //     }
                    //     return null;
                    //   },
                    //   onSaved: (value) {
                    //     _namba_ya_simu_ya_mwakilishi = int.parse(value!);
                    //     // converting int to string
                    //   },
                    //   keyboardType: TextInputType.number,
                    //   // brings keyboard with numbers only
                    //   decoration: InputDecoration(
                    //     filled: true,
                    //     fillColor: Colors.white,
                    //     label: Text("Namba ya simu ya mwakilishi"),
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
                    //       return 'Tafadhali ingiza namba ya nyumba ya mwakilishi';
                    //     }
                    //     return null;
                    //   },
                    //   onSaved: (value) {
                    //     _namba_ya_nyumba_ya_mwakilishi = int.parse(value!);
                    //     // converting int to string
                    //   },
                    //   keyboardType: TextInputType.number,
                    //   // brings keyboard with numbers only
                    //   decoration: InputDecoration(
                    //     filled: true,
                    //     fillColor: Colors.white,
                    //     label: Text("Namba ya Nyumba ya Mwakilishi"),
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
                    //       return 'Tafadhali ingiza namba ya nyumba ya kitambulisho cha Mzanzibari';
                    //     }
                    //     return null;
                    //   },
                    //   onSaved: (value) {
                    //     _namba_ya_kitambulisho_cha_mzanzibari_cha_mwakilishi = int.parse(value!);
                    //     // converting int to string
                    //   },
                    //   keyboardType: TextInputType.number,
                    //   // brings keyboard with numbers only
                    //   decoration: InputDecoration(
                    //     filled: true,
                    //     fillColor: Colors.white,
                    //     label: Text("Namba ya Kitambulisho cha Mzanzibari cha Mwakilishi"),
                    //     floatingLabelBehavior: FloatingLabelBehavior.never,
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //       borderSide: BorderSide.none,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 20),

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
                          "Kusanya",
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
    );
  }
}
