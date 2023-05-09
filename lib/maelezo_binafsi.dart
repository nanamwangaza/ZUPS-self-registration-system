import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zups/mwakilishi.dart';
import 'njia_za_upokeaji_pension.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _tarehe_ya_kuzaliwa = TextEditingController();
  TextEditingController _tarehe_ya_kuingia_Zanzibar = TextEditingController();

  String _jina_kamili_la_mzee = "";
  late int _umri;
  bool _mme = false;
  bool _mke = false;
  late int _namba_ya_simu;
  String _mtaa= "";
  String _SLP= "";
  String _namba_ya_nyumba="";
  String _namba_ya_kitambulisho_cha_mzanzibari="";
  String _kitambulisho_kingine = "";
  String _namba_ya_kitambulisho_kingine = "";
  String _shehia = "";
   String _wilaya = "";
   String _mkoa = "";
   String _hali_ya_ulemavu = "";
   bool _posho_ya_wilayani = false;


   
  



  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process user input here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1d3557),
        title: Text(
          "MAELEZO BINAFSI YA MZEE",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tafadhali ingiza jina kamili';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _jina_kamili_la_mzee = value!;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Jina Kamili la Mzee"),
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
                          label: Text("Umri"),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       "JINSIA:",
                      //       style: TextStyle(fontWeight: FontWeight.bold),
                      //     ),
                      //   ],
                      // ),

                      // CheckboxListTile(
                      //   title: Text("Mme"),
                      //   value:_mme,
                      // onChanged:(newValue){
                      //   setState(() {
                      //     _mme=newValue!;
                      //   });
                      // } ),

                      //   CheckboxListTile(
                      //   title: Text("Mke"),
                      //   value:_mke,
                      // onChanged:(newValue){
                      //   setState(() {
                      //     _mke=newValue!;
                      //   });
                      // } )
                      GestureDetector(
                        onTap: () async {
                          DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2023),
                          );
                          if (selectedDate != null) {
                            _tarehe_ya_kuzaliwa.text = selectedDate.toString();
                          }
                        },
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: _tarehe_ya_kuzaliwa,
                            decoration: InputDecoration(
                              labelText: 'Tarehe ya Kuzaliwa',labelStyle: TextStyle(
                                fontSize: 15
                              )
                            ),
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
                          label: Text("Namba ya Simu"),
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
                            return 'Tafadhali ingiza jina la mtaa';
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
                            return 'Tafadhali ingiza anwani kamili';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _SLP = value!;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Anwani Kamili (SLP)"),
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
                          _namba_ya_nyumba = value!;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Namba ya Nyumba"),
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
                            return 'Tafadhali ingiza namba ya kitambulisho cha Mzanzibari';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _namba_ya_kitambulisho_cha_mzanzibari = value!;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Namba ya kitambulisho cha Mzanzibari"),
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
                            return 'Tafadhali ingiza kitambulisho kingine';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _kitambulisho_kingine = value!;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Kitambulisho kingine"),
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
                            return 'Tafadhali ingiza namba ya kitambulisho kingine';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _namba_ya_kitambulisho_kingine = value!;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Namba ya Kitambulisho kingine"),
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
                          _shehia= value!;
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
                            return 'Tafadhali ingiza hali ya ulemavu';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _hali_ya_ulemavu = value!;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Hali ya Ulemavu"),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Je, unapokea posho ya wilayani? (5,000/=):",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                        SizedBox(height: 20,),


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
                              onPressed: () {
                                 if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MaelezoYaMwakilishi()),
                                );
                              }},
                              child: Text("Endelea", style: TextStyle(
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
      ),
    );
  }
}
