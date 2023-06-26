import 'package:flutter/material.dart';

class Benki extends StatefulWidget {
  const Benki({super.key});

  @override
  State<Benki> createState() => _BenkiState();
}

class _BenkiState extends State<Benki> {

  final _formKey = GlobalKey<FormState>();
   String _jina_la_benki="";
  //  String _jina_la_akaunti="";
  //  String _jina_la_benki="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle:true,
        title:Text("TAARIFA ZA BENKI")
      ),

      body: Container(
        color:Color(0xFFF5F5F5),
        child: ListView(
          children: [
            Form(
                key: _formKey,
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [

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
                      SizedBox(height: 20,),

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
                          label: Text("Jina la akaunti"),
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
                          label: Text("Akaunti namba"),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                           
                           SizedBox(height: 40,),

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
                          onPressed: () {},
                          // async {
                          //   if (_formKey.currentState!.validate()) {
                          //     try {
                          //       await postData();
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) => MaelezoYaMwakilishi(),
                          //         ),
                          //       );
                          //     } catch (e) {
                          //       print('Error: $e');
                          //       // Handle the error appropriately
                          //     }
                          //   }
                          // },
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
                  ),) ,
                )
          ],
        ),
      ),
    );
  }
}