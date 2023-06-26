import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zups/login.dart';
import 'package:zups/maelezo_binafsi.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  String _jina_la_kwanza='';
  String _jina_la_katikati = '';
  String _jina_la_mwisho = '';
  String _namba_ya_simu='';
  String _nenosiri='';
  String _hakiki_neno_siri='';
  String _barua_pepe='';

  

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final response = await http.post(
        Uri.parse('http://localhost:8000/api/register'),
        body: {
          'name': _jina_la_kwanza,
          'email': _jina_la_katikati,
          'password': _jina_la_mwisho,
          
        },
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Registration()),
        );
      } else {
        var era = json.decode(response.body);
        var erastring = era["error"]["email"];

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Registration Failed'),
              content: Text(erastring[0]),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/zanzibar.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),
            

            Container(
              color: Colors.lightBlue.withOpacity(0.4),
            ),

            
Padding(
  padding: const EdgeInsets.only(top: 50,bottom: 10,left: 20,right: 20),
  child:   Container(
  
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.white,
    ),
  
        
  
        child: ListView(
        
          children: [
        
            Center(
        
              child: SafeArea(
        
                child: Form(
        
                  key: _formKey,
        
                  child: Column(
        
                    mainAxisAlignment: MainAxisAlignment.start,
        
                    crossAxisAlignment: CrossAxisAlignment.center,
        
                    children: [
        
        
        
                      Image.asset("assets/logo2.png",
                            
                      width: 200,
                            
                      height: 200,),
        
        
        
        
        
                      // SizedBox(
        
                      //   height: 50,
        
                      // ),
        
                      Text(
        
                        "JISAJILI",
        
                        style: TextStyle(
        
                            fontWeight: FontWeight.bold,
        
                            fontSize: 30,
        
                            color: Colors.lightBlue),
        
                      ),
        
        
        
                      // Column with text and text field
        
                      Padding(
        
                        padding: const EdgeInsets.all(16.0),
        
                        child: Column(
        
                          crossAxisAlignment: CrossAxisAlignment.start,
        
                          children: [
        
                            Text(
        
                              "Jina la kwanza" ,
        
                              style: TextStyle(color: Colors.lightBlue),
                              
        
                            ),
        
                            SizedBox(
        
                              height: 10,
        
                            ),
        
                            Container(
        
                              decoration: BoxDecoration(
        
                                color: Colors.white,
        
                                borderRadius: BorderRadius.circular(10),
        
                                boxShadow: [
        
                                  BoxShadow(
        
                                    color: Colors.grey.withOpacity(0.5),
        
                                    spreadRadius: 1,
        
                                    blurRadius: 10,
        
                                    offset: Offset(0, 3),
        
                                  ),
        
                                ],
        
                              ),
        
                              child: SizedBox(
        
                                height: 60,
        
                                child: TextFormField(
        
                                  validator: (value) {
        
                                    if (value!.isEmpty) {
        
                                      return 'Tafadhali ingiza jina kwanza';
        
                                    }
        
        
        
                                    return null;
        
                                  },
        
                                  onSaved: (value) {
        
                                    _jina_la_kwanza = value!;
        
                                  },
        
                                  decoration: InputDecoration(
        
                                    filled: true,
        
                                    fillColor: Colors.white,
        
                                    label: Text("Ingiza jina la kwanza"),
        
                                    floatingLabelBehavior:
        
                                        FloatingLabelBehavior.never,
        
                                    border: OutlineInputBorder(
        
                                      borderRadius: BorderRadius.circular(10),
        
                                      borderSide: BorderSide.none,
        
                                    ),
        
                                  ),
        
                                ),
        
                              ),
        
                            )
        
                          ],
        
                        ),
        
                      ),

                      Padding(
        
                        padding: const EdgeInsets.all(16.0),
        
                        child: Column(
        
                          crossAxisAlignment: CrossAxisAlignment.start,
        
                          children: [
        
                            Text(
        
                              "Jina la katikati",
        
                              style: TextStyle(color: Colors.lightBlue),
                              
        
                            ),
        
                            SizedBox(
        
                              height: 10,
        
                            ),
        
                            Container(
        
                              decoration: BoxDecoration(
        
                                color: Colors.white,
        
                                borderRadius: BorderRadius.circular(10),
        
                                boxShadow: [
        
                                  BoxShadow(
        
                                    color: Colors.grey.withOpacity(0.5),
        
                                    spreadRadius: 1,
        
                                    blurRadius: 10,
        
                                    offset: Offset(0, 3),
        
                                  ),
        
                                ],
        
                              ),
        
                              child: SizedBox(
        
                                height: 60,
        
                                child: TextFormField(
        
                                  validator: (value) {
        
                                    if (value!.isEmpty) {
        
                                      return 'Tafadhali ingiza jina la katikati';
        
                                    }
        
        
        
                                    return null;
        
                                  },
        
                                  onSaved: (value) {
        
                                    _jina_la_katikati = value!;
        
                                  },
        
                                  decoration: InputDecoration(
        
                                    filled: true,
        
                                    fillColor: Colors.white,
        
                                    label: Text("Ingiza jina la katikati"),
        
                                    floatingLabelBehavior:
        
                                        FloatingLabelBehavior.never,
        
                                    border: OutlineInputBorder(
        
                                      borderRadius: BorderRadius.circular(10),
        
                                      borderSide: BorderSide.none,
        
                                    ),
        
                                  ),
        
                                ),
        
                              ),
        
                            )
        
                          ],
        
                        ),
        
                      ),
                       

                       Padding(
        
                        padding: const EdgeInsets.all(16.0),
        
                        child: Column(
        
                          crossAxisAlignment: CrossAxisAlignment.start,
        
                          children: [
        
                            Text(
        
                              "Jina la mwisho",
        
                              style: TextStyle(color: Colors.lightBlue),
                              
        
                            ),
        
                            SizedBox(
        
                              height: 10,
        
                            ),
        
                            Container(
        
                              decoration: BoxDecoration(
        
                                color: Colors.white,
        
                                borderRadius: BorderRadius.circular(10),
        
                                boxShadow: [
        
                                  BoxShadow(
        
                                    color: Colors.grey.withOpacity(0.5),
        
                                    spreadRadius: 1,
        
                                    blurRadius: 10,
        
                                    offset: Offset(0, 3),
        
                                  ),
        
                                ],
        
                              ),
        
                              child: SizedBox(
        
                                height: 60,
        
                                child: TextFormField(
        
                                  validator: (value) {
        
                                    if (value!.isEmpty) {
        
                                      return 'Tafadhali ingiza jina la mwisho';
        
                                    }
        
        
        
                                    return null;
        
                                  },
        
                                  onSaved: (value) {
        
                                    _jina_la_mwisho = value!;
        
                                  },
        
                                  decoration: InputDecoration(
        
                                    filled: true,
        
                                    fillColor: Colors.white,
        
                                    label: Text("Ingiza jina la mwisho"),
        
                                    floatingLabelBehavior:
        
                                        FloatingLabelBehavior.never,
        
                                    border: OutlineInputBorder(
        
                                      borderRadius: BorderRadius.circular(10),
        
                                      borderSide: BorderSide.none,
        
                                    ),
        
                                  ),
        
                                ),
        
                              ),
        
                            )
        
                          ],
        
                        ),
        
                      ),


                      Padding(
        
                        padding: const EdgeInsets.all(16.0),
        
                        child: Column(
        
                          crossAxisAlignment: CrossAxisAlignment.start,
        
                          children: [
        
                            Text(
        
                              "Namba ya simu",
        
                              style: TextStyle(color: Colors.lightBlue),
                              
        
                            ),
        
                            SizedBox(
        
                              height: 10,
        
                            ),
        
                            Container(
        
                              decoration: BoxDecoration(
        
                                color: Colors.white,
        
                                borderRadius: BorderRadius.circular(10),
        
                                boxShadow: [
        
                                  BoxShadow(
        
                                    color: Colors.grey.withOpacity(0.5),
        
                                    spreadRadius: 1,
        
                                    blurRadius: 10,
        
                                    offset: Offset(0, 3),
        
                                  ),
        
                                ],
        
                              ),
        
                              child: SizedBox(
        
                                height: 60,
        
                                child: TextFormField(
        
                                  validator: (value) {
        
                                    if (value!.isEmpty) {
        
                                      return 'Tafadhali ingiza namba ya simu';
        
                                    }
        
        
        
                                    return null;
        
                                  },
        
                                  onSaved: (value) {
        
                                    _namba_ya_simu = value!;
        
                                  },
        
                                  decoration: InputDecoration(
        
                                    filled: true,
        
                                    fillColor: Colors.white,
        
                                    label: Text("Namba ya simu"),
        
                                    floatingLabelBehavior:
        
                                        FloatingLabelBehavior.never,
        
                                    border: OutlineInputBorder(
        
                                      borderRadius: BorderRadius.circular(10),
        
                                      borderSide: BorderSide.none,
        
                                    ),
        
                                  ),
        
                                ),
        
                              ),
        
                            )
        
                          ],
        
                        ),
        
                      ),

                      
        
         Padding(
        
                        padding: const EdgeInsets.all(16.0),
        
                        child: Column(
        
                          crossAxisAlignment: CrossAxisAlignment.start,
        
                          children: [
        
                            Text(
        
                              "Nenosiri",
        
                              style: TextStyle(color: Colors.lightBlue),
        
                            ),
        
                            SizedBox(
        
                              height: 10,
        
                            ),
        
                            Container(
        
                              decoration: BoxDecoration(
        
                                color: Colors.white,
        
                                borderRadius: BorderRadius.circular(10),
        
                                boxShadow: [
        
                                  BoxShadow(
        
                                    color: Colors.grey.withOpacity(0.5),
        
                                    spreadRadius: 1,
        
                                    blurRadius: 10,
        
                                    offset: Offset(0, 3),
        
                                  ),
        
                                ],
        
                              ),
        
                              child: SizedBox(
        
                                height: 60,
        
                                child: TextFormField(
        
                                  obscureText: true,
        
                                  validator: (value) {
        
                                    if (value!.isEmpty) {
        
                                      return 'Tafadhali ingiza nenosiri';
        
                                    }
        
                                    if (value.length < 8) {
        
                                      return 'Nenosiri liwe na angalau herufi 8';
        
                                    }
        
                                    return null;
        
                                  },
        
                                  onSaved: (value) {
        
                                    _nenosiri = value!;
        
                                  },
        
                                  decoration: InputDecoration(
        
                                    filled: true,
        
                                    fillColor: Colors.white,
        
                                    label: Text("Nenosiri"),
        
                                    floatingLabelBehavior:
        
                                        FloatingLabelBehavior.never,
        
                                    border: OutlineInputBorder(
        
                                      borderRadius: BorderRadius.circular(10),
        
                                      borderSide: BorderSide.none,
        
                                    ),
        
                                  ),
        
                                ),
        
                              ),
        
                            )
        
                          ],
        
                        ),
        
                      ),
        
        
        
        
        
                Padding(
        
                        padding: const EdgeInsets.all(16.0),
        
                        child: Column(
        
                          crossAxisAlignment: CrossAxisAlignment.start,
        
                          children: [
        
                            Text(
        
                              "Hakiki nenosiri",
        
                              style: TextStyle(color: Colors.lightBlue),
        
                            ),
        
                            SizedBox(
        
                              height: 10,
        
                            ),
        
                            Container(
        
                              decoration: BoxDecoration(
        
                                color: Colors.white,
        
                                borderRadius: BorderRadius.circular(10),
        
                                boxShadow: [
        
                                  BoxShadow(
        
                                    color: Colors.grey.withOpacity(0.5),
        
                                    spreadRadius: 1,
        
                                    blurRadius: 10,
        
                                    offset: Offset(0, 3),
        
                                  ),
        
                                ],
        
                              ),
        
                              child: SizedBox(
        
                                height: 60,
        
                                child: TextFormField(
        
                                  obscureText: true,
        
                                  validator: (value) {
        
                                    if (value!.isEmpty) {
        
                                      return 'Tafadhali hakiki nenosiri';
        
                                    }
        
                                    if (value.length < 8) {
        
                                      return 'Nenosiri liwe na angalau herufi 8';
        
                                    }
        
                                    return null;
        
                                  },
        
                                  onSaved: (value) {
        
                                    _hakiki_neno_siri = value!;
        
                                  },
        
                                  decoration: InputDecoration(
        
                                    filled: true,
        
                                    fillColor: Colors.white,
        
                                    label: Text("Hakiki nenosiri"),
        
                                    floatingLabelBehavior:
        
                                        FloatingLabelBehavior.never,
        
                                    border: OutlineInputBorder(
        
                                      borderRadius: BorderRadius.circular(10),
        
                                      borderSide: BorderSide.none,
        
                                    ),
        
                                  ),
        
                                ),
        
                              ),
        
                            )
        
                          ],
        
                        ),
        
                      ),
        
        
        
        
        
        
        
        
        
        
        
                      
        
                      Padding(
        
                        padding: const EdgeInsets.all(16.0),
        
                        child: Column(
        
                          crossAxisAlignment: CrossAxisAlignment.start,
        
                          children: [
        
                            Text(
        
                              "Barua pepe",
        
                              style: TextStyle(color: Colors.lightBlue),
        
                            ),
        
                            SizedBox(
        
                              height: 10,
        
                            ),
        
                            Container(
        
                              decoration: BoxDecoration(
        
                                color: Colors.white,
        
                                borderRadius: BorderRadius.circular(10),
        
                                boxShadow: [
        
                                  BoxShadow(
        
                                    color: Colors.grey.withOpacity(0.5),
        
                                    spreadRadius: 1,
        
                                    blurRadius: 10,
        
                                    offset: Offset(0, 3),
        
                                  ),
        
                                ],
        
                              ),
        
                              child: SizedBox(
        
                                height: 60,
        
                                child: TextFormField(
        
                                  validator: (value) {
        
                                    if (value!.isEmpty) {
        
                                      return 'Tafadhali ingiza barua pepe';
        
                                    }
        
                                    if (!RegExp(r'\S+@\S+\.\S+')
        
                                        .hasMatch(value)) {
        
                                      return 'Tafadhali ingiza barua pepe sahihi';
        
                                    }
        
                                    return null;
        
                                  },
        
                                  onSaved: (value) {
        
                                    _barua_pepe = value!;
        
                                  },
        
                                  decoration: InputDecoration(
        
                                    filled: true,
        
                                    fillColor: Colors.white,
        
                                    label: Text("Barua pepe"),
        
                                    floatingLabelBehavior:
        
                                        FloatingLabelBehavior.never,
        
                                    border: OutlineInputBorder(
        
                                      borderRadius: BorderRadius.circular(10),
        
                                      borderSide: BorderSide.none,
        
                                    ),
        
                                  ),
        
                                ),
        
                              ),
        
                            )
        
                          ],
        
                        ),
        
                      ),
        
        
        
                     
                      Container(
        
                        width: 300,
        
                        height: 50,
        
                        decoration: BoxDecoration(
        
                          color: Colors.white,
        
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
        
                            onPressed: _submitForm,
        
                            child: Text(
        
                              "JISAJILI",
        
                              style: TextStyle(color: Colors.lightBlue),
        
                            )),
        
                      ),
        
        
        
                      SizedBox(height: 10),
        
                      Row(
        
                        mainAxisAlignment: MainAxisAlignment.center,
        
                        children: [
        
                          Text(
        
                            "Una akaunti tayari?",
        
                            style: TextStyle(color: Colors.lightBlue),
        
                          ),
        
                          SizedBox(width: 10),
        
                          TextButton(
        
                              onPressed: () {
        
                                Navigator.push(
        
                                  context,
        
                                  MaterialPageRoute(
        
                                      builder: (context) => LoginPage()),
        
                                );
        
                              },
        
                              child: Text(
        
                                "Ingia",
        
                                style: TextStyle(
        
                                    color: Colors.lightBlue,
        
                                    fontWeight: FontWeight.bold),
        
                              ))
        
                        ],
        
                      )
        
                    ],
        
                  ),
        
                ),
        
              ),
        
            ),
        
          ],
        
        ),
  
      ),
)
          ],
        ));
  }
}
