import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zups/njia_za_upokeaji_pension.dart';

class Asante extends StatefulWidget {
  const Asante({Key? key}) : super(key: key);

  @override
  State<Asante> createState() => _AsanteState();
}

class _AsanteState extends State<Asante> {
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
                                      builder: (context) =>NjiaZaUpokeajiPension() ),
                                );
          },),
        backgroundColor: Color(0xFF1d3557),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ASANTE KWA KUKUSANYA MAELEZO!",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFF1d3557),
            ),)
          ],
        ),
      ) ,
    );
  }
}