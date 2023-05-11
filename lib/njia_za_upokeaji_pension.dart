import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zups/asante.dart';
import 'package:zups/mwakilishi.dart';

class NjiaZaUpokeajiPension extends StatefulWidget {
  const NjiaZaUpokeajiPension({Key? key}) : super(key: key);

  @override
  State<NjiaZaUpokeajiPension> createState() => _NjiaZaUpokeajiPensionState();
}

class _NjiaZaUpokeajiPensionState extends State<NjiaZaUpokeajiPension> {

 final _formKey = GlobalKey<FormState>();
 String _jina_la_benki="";
 String _jina_la_akaunti="";
 late int _namba_ya_akaunti;
 late int _namba_ya_simu;
  bool _fedhaTaslimu=false;

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
                                      builder: (context) =>MaelezoYaMwakilishi() ),
                                );
          },),
        backgroundColor: (Color(0xFF1d3557)),
        title: Text("NJIA ZA UPOKEAJI PENSION"),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFFF5F5F5),
        child: ListView(
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

                        SizedBox(height: 20),

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

                        SizedBox(height: 20),

                         TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tafadhali ingiza namba ya akaunti';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _namba_ya_akaunti = int.parse(value!);
                          // converting int to string
                        },
                        keyboardType: TextInputType.number,
                        // brings keyboard with numbers only
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          label: Text("Namba ya Akaunti"),
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
                          label: Text("Namba ya Simu"),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                       CheckboxListTile(
                      title: Text(
                        'Fedha Taslimu',
                        style: TextStyle(
                          color: Color(0xFF1d3557),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      value: _fedhaTaslimu,
                      activeColor: Colors.white,
                      checkColor: Colors.black,
                      onChanged: (newValue) {
                        setState(() {
                          _fedhaTaslimu = newValue!;
                        });
                      },
                    ),


                      
                          
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
                                      if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>Asante() ),
                                );
                              }
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
      ),
    );
  }
}