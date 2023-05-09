import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zups/njia_za_upokeaji_pension.dart';

class MaelezoYaMwakilishi extends StatefulWidget {
  const MaelezoYaMwakilishi({Key? key}) : super(key: key);

  @override
  State<MaelezoYaMwakilishi> createState() => _MaelezoYaMwakilishiState();
}

class _MaelezoYaMwakilishiState extends State<MaelezoYaMwakilishi> {

 final _formKey = GlobalKey<FormState>();
 String _jina_la_mwakilishi="";
 String _anapoishi_mwakilishi="";
 String _uhusiano_na_mhusika="";
 late int _namba_ya_simu_ya_mwakilishi;
 late int _namba_ya_nyumba_ya_mwakilishi;
 late int _namba_ya_kitambulisho_cha_mzanzibari_cha_mwakilishi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: (Color(0xFF1d3557)),
        title: Text("MAELEZO YA MTU WA KARIBU"),
        centerTitle: true,
      ),
      body:ListView(
        children: [
               Form(
              key:_formKey ,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [

                   

                     SizedBox(height: 30),

                    TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Tafadhali ingiza jina la mwakilishi';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _jina_la_mwakilishi = value!;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            label: Text("Jina la mwakilishi"),
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
                              return 'Tafadhali ingiza anapoishi mwakilishi';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _anapoishi_mwakilishi = value!;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            label: Text("Anapoishi mwakilishi"),
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
                              return 'Tafadhali ingiza uhusiano na mhusika';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _uhusiano_na_mhusika = value!;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            label: Text("Uhusiano na mhusika"),
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
                            return 'Tafadhali ingiza namba ya simu ya mwakilishi';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _namba_ya_simu_ya_mwakilishi = int.parse(value!);
                          // converting int to string
                        },
                        keyboardType: TextInputType.number,
                        // brings keyboard with numbers only
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
                      SizedBox(height: 20),

                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tafadhali ingiza namba ya nyumba ya mwakilishi';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _namba_ya_nyumba_ya_mwakilishi = int.parse(value!);
                          // converting int to string
                        },
                        keyboardType: TextInputType.number,
                        // brings keyboard with numbers only
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Namba ya Nyumba ya Mwakilishi"),
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
                            return 'Tafadhali ingiza namba ya nyumba ya kitambulisho cha Mzanzibari';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _namba_ya_kitambulisho_cha_mzanzibari_cha_mwakilishi = int.parse(value!);
                          // converting int to string
                        },
                        keyboardType: TextInputType.number,
                        // brings keyboard with numbers only
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Namba ya Kitambulisho cha Mzanzibari cha Mwakilishi"),
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
                            color: Color(0xFF1d3557),
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
                                  onPressed:(){
                                    {
                                 if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NjiaZaUpokeajiPension()),
                                );
                              }};
                                  },
                                  child: Text("KUSANYA", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                  )
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