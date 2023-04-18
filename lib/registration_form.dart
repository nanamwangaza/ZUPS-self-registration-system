import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> formKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            Form(
              key:formKey ,
              child:
            Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                Text(" A. MAELEZO BINAFSI YA MZEE",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                ),
                SizedBox(height: 20,),

                TextFormField(
                  validator: (value){
                    if(value!.isEmpty)return
                     "Tafadhali ingiza jina";
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Jina:"),
                  ),
                ),
                 SizedBox(height: 20,),

                TextFormField(
                  validator: (value){
                    if(value!.isEmpty)return
                     "Tafadhali ingiza umri";
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Umri:"),
                  ),
                ),


                 SizedBox(height: 20,),

                TextFormField(
                  validator: (value){
                    if(value!.isEmpty)return
                     "Tafadhali ingiza namba ya simu";
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Namba ya simu:"),
                  ),
                ),

                 SizedBox(height: 20,),

                TextFormField(
                  validator: (value){
                    if(value!.isEmpty)return
                     "Tafadhali ingiza jina";
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Jina:"),
                  ),
                ),

                 SizedBox(height: 20,),

                TextFormField(
                  validator: (value){
                    if(value!.isEmpty)return
                     "Tafadhali ingiza tarehe ya kuzaliwa";
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Tarehe ya kuzaliwa:"),
                  ),
                ),

                 SizedBox(height: 20,),

                TextFormField(
                  validator: (value){
                    if(value!.isEmpty)return
                     "Tafadhali ingiza mtaa";
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Mtaa:"),
                  ),
                ),

                 SizedBox(height: 20,),

                TextFormField(
                  validator: (value){
                    if(value!.isEmpty)return
                     "Tafadhali ingiza anwani kamili";
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Anwani kamili (SLP):"),
                  ),
                ),

                 SizedBox(height: 20,),

                TextFormField(
                  validator: (value){
                    if(value!.isEmpty)return
                     "Tafadhali ingiza kitambuliso kingine";
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Kitambulisho kingine:"),
                  ),
                ),

                 SizedBox(height: 20,),

                TextFormField(
                  validator: (value){
                    if(value!.isEmpty)return
                     "Tafadhali ingiza shehia";
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Shehia:"),
                  ),
                ),

                 SizedBox(height: 20,),

                TextFormField(
                  validator: (value){
                    if(value!.isEmpty)return
                     "Tafadhali ingiza wilaya";
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Wilaya:"),
                  ),
                ),

                 SizedBox(height: 20,),

                TextFormField(
                  validator: (value){
                    if(value!.isEmpty)return
                     "Tafadhali ingiza mkoa";
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Mkoa:"),
                  ),
                ),

                 SizedBox(height: 20,),

                TextFormField(
                  validator: (value){
                    if(value!.isEmpty)return
                     "Tafadhali ingiza jina";
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Jina:"),
                  ),
                ),

                 SizedBox(height: 20,),

                TextFormField(
                  validator: (value){
                    if(value!.isEmpty)return
                     "Tafadhali ingiza jina";
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Jina:"),
                  ),
                ),

                 SizedBox(height: 20,),

                TextFormField(
                  validator: (value){
                    if(value!.isEmpty)return
                     "Tafadhali ingiza jina";
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Jina:"),
                  ),
                ),

                 SizedBox(height: 20,),

                TextFormField(
                  validator: (value){
                    if(value!.isEmpty)return
                     "Tafadhali ingiza jina";
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Jina:"),
                  ),
                ),
               ],
            ))
          ],
        ),
      ),
    );
  }
}