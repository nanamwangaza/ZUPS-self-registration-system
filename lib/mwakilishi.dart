import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zups/maelezo_binafsi.dart';
import 'package:zups/njia_za_upokeaji_pension.dart';

class MaelezoYaMwakilishi extends StatefulWidget {
  const MaelezoYaMwakilishi({Key? key}) : super(key: key);

  @override
  State<MaelezoYaMwakilishi> createState() => _MaelezoYaMwakilishiState();
}

class _MaelezoYaMwakilishiState extends State<MaelezoYaMwakilishi> {

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>Registration() ),
                                );
          },),
        backgroundColor:Colors.lightBlue,
        title: Text("MAELEZO YA MTU WA KARIBU",
        style: TextStyle(
          color: Colors.white
        ),),
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
                            label: Text("Jina la kwanza"),
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
                            label: Text("Jina la katikati"),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        SizedBox(height: 20,),

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
                            label: Text("Jina la mwisho"),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        SizedBox(height: 20),


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

                         

                        SizedBox(height: 20),

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
                            label: Text("Namba ya simu"),
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
                            label: Text("Namba ya kitambulisho cha mzanzibari"),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        SizedBox(height: 20),


                        SizedBox(height: 20),
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
                            label: Text("Uhusiano"),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
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
                            color:Colors.lightBlue,
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